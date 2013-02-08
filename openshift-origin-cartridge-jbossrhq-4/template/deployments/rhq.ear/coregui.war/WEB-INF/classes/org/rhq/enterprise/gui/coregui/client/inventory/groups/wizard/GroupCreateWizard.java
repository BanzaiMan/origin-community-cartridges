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
package org.rhq.enterprise.gui.coregui.client.inventory.groups.wizard;

import com.smartgwt.client.util.SC;

import org.rhq.core.domain.resource.group.GroupCategory;
import org.rhq.core.domain.resource.group.ResourceGroup;
import org.rhq.enterprise.gui.coregui.client.CoreGUI;
import org.rhq.enterprise.gui.coregui.client.LinkManager;
import org.rhq.enterprise.gui.coregui.client.inventory.groups.ResourceGroupListView;

/**
 * A wizard for creating a new Resource group.
 *
 * @author Greg Hinkle
 * @author John Mazzitelli
 */
public class GroupCreateWizard extends AbstractGroupCreateWizard {
    private ResourceGroupListView resourceGroupListView;
    private GroupCategory category;

    public GroupCreateWizard(ResourceGroupListView resourceGroupListView, GroupCategory category) {
        this.resourceGroupListView = resourceGroupListView;
        this.category = category;
    }

    public void groupCreateCallback(ResourceGroup group) {
        resourceGroupListView.refresh();
        if (category != null && category != group.getGroupCategory()) {
            if (category == GroupCategory.COMPATIBLE && group.getExplicitResources().isEmpty()) {
                SC.say(MSG.view_group_common_emptyGroup());
            }
            // if null, it was invoked from all groups list
            // the other type of group has been created
            // navigate user to the right category
            CoreGUI.goToView(GroupCategory.COMPATIBLE == group.getGroupCategory() ? LinkManager
                .getHubCompatibleGroupsLink() : LinkManager.getHubMixedGroupsLink());
        }
    }
}
