/*
 * RHQ Management Platform
 * Copyright (C) 2005-2011 Red Hat, Inc.
 * All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License, version 2, as
 * published by the Free Software Foundation, and/or the GNU Lesser
 * General Public License, version 2.1, also as published by the Free
 * Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License and the GNU Lesser General Public License
 * for more details.
 *
 * You should have received a copy of the GNU General Public License
 * and the GNU Lesser General Public License along with this program;
 * if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */
package org.rhq.core.domain.util;

import java.io.Serializable;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 * Used to pass information on pagination and sorting to data lookup methods.
 * {@link org.rhq.core.domain.server.PersistenceUtility} provides several methods
 * that can be called to apply PageControls to various types of queries.
 *
 * @author Greg Hinkle
 * @author Joseph Marques
 */
public class PageControl implements Serializable, Cloneable {

    private static final long serialVersionUID = 1L;

    private static final int MAX_ORDERING_FIELD_COUNT = 3;
    public static final int SIZE_UNLIMITED = -1;
    public static final int SIZE_MAX = 100;

    private int pageNumber = 0;
    private int pageSize = PageControl.SIZE_MAX;
    private Integer firstRecord;
    private LinkedList<OrderingField> orderingFields;

    public PageControl() {
        this.orderingFields = new LinkedList<OrderingField>();
    }

    public PageControl(int pageNumber, int pageSize) {
        this();
        this.pageNumber = pageNumber;
        this.pageSize = pageSize;
    }

    public static PageControl getExplicitPageControl(int firstRecord, int recordCount) {
        PageControl pc = new PageControl(-1, recordCount);
        pc.firstRecord = firstRecord;
        return pc;
    }

    public PageControl(int pageNumber, int pageSize, OrderingField... orderingFields) {
        this(pageNumber, pageSize);
        for (OrderingField orderingField : orderingFields) {
            // null fields are equivalent to not setting the ordering field at all
            if (orderingField.getField() != null) {
                this.orderingFields.add(orderingField);
            }
        }
    }

    public static PageControl getUnlimitedInstance() {
        return new PageControl(0, SIZE_UNLIMITED);
    }

    public static PageControl getSingleRowInstance() {
        return new PageControl(0, 1);
    }

    public void initDefaultOrderingField(String defaultField) {
        initDefaultOrderingField(defaultField, PageOrdering.ASC);
    }

    public void addDefaultOrderingField(String defaultField) {
        addDefaultOrderingField(defaultField, PageOrdering.ASC);
    }

    public void initDefaultOrderingField(String defaultField, PageOrdering defaultPageOrdering) {
        if (orderingFields.size() > 0) {
            return;
        }

        addDefaultOrderingField(defaultField, defaultPageOrdering);
    }

    public void addDefaultOrderingField(String defaultField, PageOrdering defaultPageOrdering) {
        if (orderingFields.size() >= MAX_ORDERING_FIELD_COUNT) {
            return; // only need to add defaults if there are less than 3 sort orders
        }

        for (OrderingField ordering : orderingFields) {
            if (ordering.getField().equals(defaultField)) {
                /* 
                 * return immediately, since we've apparently already added this sort field to the 
                 * list of OrderingFields; UI actions, in particular the integration of sort columns
                 * on tabular displays with this PageControl object, will dictate whether or not the
                 * PageOrdering will be reversed, but that logic occurs elsewhere  
                 */
                return;
            }
        }

        orderingFields.add(new OrderingField(defaultField, defaultPageOrdering));
    }

    /**
     * @return The current page number (0-based)
     */

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageNumber = (pageSize != 0 && pageSize != SIZE_UNLIMITED) ? (getStartRow() / pageSize) : 0;
        this.pageSize = pageSize;
    }

    public Integer getFirstRecord() {
        return firstRecord;
    }

    public void setFirstRecord(Integer firstRecord) {
        this.firstRecord = firstRecord;
        if (this.firstRecord != null) {
            this.pageNumber = -1;
        }
    }

    public PageOrdering getPrimarySortOrder() {
        OrderingField primaryOrderingField = getPrimaryOrderingField();
        if (primaryOrderingField == null) {
            return null;
        }

        return getPrimaryOrderingField().getOrdering();
    }

    public void setPrimarySortOrder(PageOrdering sortOrder) {
        OrderingField primaryOrderingField = getPrimaryOrderingField();
        if (primaryOrderingField == null) {
            // attempting to change sortOrder when no sortColumn has been selected, ignore
            return;
        }

        primaryOrderingField.setOrdering(sortOrder);
    }

    public String getPrimarySortColumn() {
        OrderingField primaryOrderingField = getPrimaryOrderingField();
        if (primaryOrderingField == null) {
            return null;
        }

        return primaryOrderingField.getField();
    }

    public void setPrimarySort(String sortColumn, PageOrdering sortOrder) {
        OrderingField primaryOrderingField = getPrimaryOrderingField();
        if (primaryOrderingField == null) {
            primaryOrderingField = new OrderingField(sortColumn, sortOrder);
            orderingFields.add(primaryOrderingField);
        } else {
            primaryOrderingField.setField(sortColumn);
            primaryOrderingField.setOrdering(sortOrder);
        }
    }

    private OrderingField getPrimaryOrderingField() {
        OrderingField result = null;
        if (orderingFields.size() != 0) {
            result = orderingFields.get(0);
        }

        return result;
    }

    public OrderingField[] getOrderingFieldsAsArray() {
        return orderingFields.toArray(new OrderingField[0]);
    }

    public List<OrderingField> getOrderingFields() {
        return orderingFields;
    }

    public void truncateOrderingFields(int keepFieldCount) {
        int removeCount = orderingFields.size() - keepFieldCount;
        for (int i = 0; i < removeCount; i++) {
            orderingFields.removeLast();
        }
    }

    public void removeOrderingField(String doomedField) {
        for (Iterator<OrderingField> i = orderingFields.iterator(); i.hasNext();) {
            OrderingField field = i.next();
            if (field.getField().equals(doomedField)) {
                i.remove();
                break;
            }
        }
    }

    public void sortBy(String sortField) {
        boolean wasAlreadySortedOn = false;

        for (int i = 0, sz = orderingFields.size(); i < sz; i++) {
            OrderingField field = orderingFields.get(i);
            if (sortField.equals(field.getField())) {
                /*
                 * When a user clicks on some column to sort it, that column is promoted to the primary sort column, and
                 * the rest of the orderings move down in the list
                 */
                orderingFields.remove(i);
                field.flipOrdering();
                orderingFields.addFirst(field);

                wasAlreadySortedOn = true;
                break;
            }
        }

        /*
         * if we weren't already sorting on this field, we'll add it as the new primary sort.  however, for objects with
         * many, many fields we want to limit the number of sorted columns, so we'll remove any elements if the list
         * size exceeds MAX_ORDERING_FIELD_COUNT
         */
        if (wasAlreadySortedOn == false) {
            OrderingField field = new OrderingField(sortField, PageOrdering.ASC);
            orderingFields.addFirst(field);
            if (orderingFields.size() > MAX_ORDERING_FIELD_COUNT) {
                orderingFields.removeLast();
            }
        }
    }

    /**
     * Get the index of the first item on the page as dictated by the page size and page number.
     *
     * @return the index of the starting row for the page
     */
    public int getStartRow() {
        if (firstRecord != null) {
            return firstRecord;
        } else {
            return pageNumber * pageSize;
        }
    }

    public void reset() {
        // allow the pageSize to remain, which keeps unlimited views with unlimited paging
        pageNumber = 0;
        firstRecord = null;
        orderingFields = new LinkedList<OrderingField>();
    }

    // TODO (ips, 10/12/11): Incorporate firstRecord field into equals() and hashCode().

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;

        PageControl that = (PageControl) o;

        if (pageNumber != that.pageNumber)
            return false;
        if (pageSize != that.pageSize)
            return false;
        if (!orderingFields.equals(that.orderingFields))
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = pageNumber;
        result = 31 * result + pageSize;
        result = 31 * result + orderingFields.hashCode();
        return result;
    }

    @Override
    public String toString() {
        StringBuilder buf = new StringBuilder("PageControl[");
        if (firstRecord != null) {
            buf.append("firstRow=").append(firstRecord);
        } else {
            buf.append("page=").append(pageNumber);
        }
        buf.append(", size=").append(pageSize);
        int i = 0;
        if (orderingFields.size() > 0) {
            buf.append(", sort[");
            for (OrderingField orderingField : orderingFields) {
                if (i++ != 0) {
                    buf.append(", ");
                }
                buf.append(orderingField.getField()).append(" ").append(orderingField.getOrdering());
            }
            buf.append("]");
        }

        buf.append("]");
        return buf.toString();
    }

    public Object clone() {
        return new PageControl(pageNumber, pageSize, getOrderingFieldsAsArray());
    }

}