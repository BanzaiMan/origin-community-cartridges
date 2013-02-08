/*
 * RHQ Management Platform
 * Copyright (C) 2005-2010 Red Hat, Inc.
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
package org.rhq.enterprise.gui.coregui.client.util.selenium;

import com.smartgwt.client.widgets.tab.Tab;
import com.smartgwt.client.widgets.tab.TabSet;

/**
 * Wrapper for com.smartgwt.client.widgets.tab.Tab that sets the ID for use with selenium scLocators.
 * 
 * @author Jay Shaughnessy
 */
public class LocatableTabSet extends TabSet {

    private String locatorId;

    /** 
     * <pre>
     * ID Format: "simpleClassname_locatorId"
     * </pre>
     * @param locatorId not null or empty.
     */
    public LocatableTabSet(String locatorId) {
        super();
        this.locatorId = locatorId;
        SeleniumUtility.setID(this, locatorId);
    }

    public void setTabs(LocatableTab... tabs) {
        super.setTabs(tabs);
    }

    public LocatableTab[] getTabs() {
        Tab[] tabs = super.getTabs();
        LocatableTab[] locatableTabs = new LocatableTab[tabs.length];
        for (int i = 0, tabsLength = tabs.length; i < tabsLength; i++) {
            Tab tab = tabs[i];
            if (!(tab instanceof LocatableTab)) {
                throw new IllegalStateException("LocatableTabSet contains a Tab that is not a LocatableTab.");
            }
            locatableTabs[i] = (LocatableTab) tab;
        }
        return locatableTabs;
    }

    /**
     * Returns the locatorId.  This can be useful for constructing more granular locatorIds. For example, if
     * the widget contains sub-widgets.  Note, this is the raw locatorId for the widget, to get the fully
     * formed ID, typically of the form "simpleClassname_locatorId", call
     * {@link com.smartgwt.client.widgets.Canvas#getID()}.
     * 
     * @return the locatorId
     */
    public String getLocatorId() {
        return locatorId;
    }

    /** 
     * Extends this widget's original locatorId with an extension. This can be useful for constructing more 
     * granular locatorIds. For example, if the widget contains sub-widgets.
     * <pre>
     * ID Format: "getLocatorId()_extension"
     * </pre>
     * 
     * @param extension not null or empty.
     *
     * @return the new, extended locatorId
     */
    public String extendLocatorId(String extension) {
        return this.locatorId + "_" + extension;
    }

    public LocatableTab getTabByTitle(String title) {
        LocatableTab[] tabs = getTabs();
        for (LocatableTab tab : tabs) {
            if (tab.getTitle().equals(title)) {
                return tab;
            }
        }
        return null;
    }

    public LocatableTab getTabByLocatorId(String locatorId) {
        LocatableTab[] tabs = getTabs();
        for (LocatableTab tab : tabs) {
            if (tab.getLocatorId().equals(locatorId)) {
                return tab;
            }
        }
        return null;
    }
}
