/*
 * RHQ Management Platform
 * Copyright (C) 2010 Red Hat, Inc.
 * All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */
package org.rhq.enterprise.gui.coregui.client.util;

import java.util.List;

import com.smartgwt.client.widgets.grid.ListGridRecord;

import org.rhq.enterprise.gui.coregui.client.components.table.Table;

/**
 * A collection of utility methods for working with {@link Table}s.
 *
 * @author Joseph Marques
 */
public class TableUtility {

    private TableUtility() {
        // static utility class only
    }

    public static int[] getIds(ListGridRecord[] selections) {
        int[] ids = new int[selections.length];
        int index = 0;
        for (ListGridRecord selection : selections) {
            ids[index++] = selection.getAttributeAsInt("id");
        }
        return ids;
    }

    public static int[] getIds(List<Integer> input) {
        int[] ids = new int[input.size()];
        int index = 0;
        for (Integer next : input) {
            ids[index++] = next;
        }
        return ids;
    }
    
}
