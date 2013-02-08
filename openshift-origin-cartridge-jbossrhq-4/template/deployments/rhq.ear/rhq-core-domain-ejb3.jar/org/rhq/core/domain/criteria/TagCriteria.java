/*
 * RHQ Management Platform
 * Copyright (C) 2005-2010 Red Hat, Inc.
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
package org.rhq.core.domain.criteria;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.rhq.core.domain.tagging.Tag;
import org.rhq.core.domain.util.PageOrdering;

/**
 * @author Greg Hinkle
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
@SuppressWarnings("unused")
public class TagCriteria extends Criteria {
    private static final long serialVersionUID = 1L;

    private String filterNamespace;
    private String filterSemantic;
    private String filterName;

    private PageOrdering sortNamespace;
    private PageOrdering sortSemantic;
    private PageOrdering sortName;

    @Override
    public Class<Tag> getPersistentClass() {
        return Tag.class;
    }

    public void addFilterNamespace(String filterNamespace) {
        this.filterNamespace = filterNamespace;
    }

    public void addFilterSemantic(String filterSemantic) {
        this.filterSemantic = filterSemantic;
    }

    public void addFilterName(String filterName) {
        this.filterName = filterName;
    }

    public void addSortNamespace(PageOrdering sortNamespace) {
        addSortField("namespace");
        this.sortNamespace = sortNamespace;
    }

    public void addSortSemantic(PageOrdering sortSemantic) {
        addSortField("semantic");
        this.sortSemantic = sortSemantic;
    }

    public void addSortName(PageOrdering sortName) {
        addSortField("name");
        this.sortName = sortName;
    }

}
