/*
 * RHQ Management Platform
 * Copyright (C) 2005-2008 Red Hat, Inc.
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
package org.rhq.core.domain.content.transfer;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.rhq.core.domain.content.PackageDetailsKey;

/**
* Contains the data necessary to describe the result of deploying a single package. The overall result of the package
* installation and any error message (if there is one) will convey whether or not the package was successfully
* installed. Additionally, if installation steps were determined for this package, they and their respective
* success/failure flags, will be contained in this object as well.
*
* @author Jason Dobies
*/
public class DeployIndividualPackageResponse implements Serializable {

    private static final long serialVersionUID = 1L;

    private PackageDetailsKey key;

    private ContentResponseResult result;
    private String errorMessage;

    private List<DeployPackageStep> deploymentSteps;

    public DeployIndividualPackageResponse(PackageDetailsKey key) {
        this.key = key;
    }

    public DeployIndividualPackageResponse(PackageDetailsKey key, ContentResponseResult result) {
        if (key == null) {
            throw new IllegalArgumentException("key cannot be null");
        }

        setResult(result);

        this.key = key;
    }

    // Public  --------------------------------------------

    public PackageDetailsKey getKey() {
        return key;
    }

    public ContentResponseResult getResult() {
        return result;
    }

    public void setResult(ContentResponseResult result) {
        if (result == null) {
            throw new IllegalArgumentException("result cannot be null");
        }

        this.result = result;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public List<DeployPackageStep> getDeploymentSteps() {
        return deploymentSteps;
    }

    public void setDeploymentSteps(List<DeployPackageStep> deploymentSteps) {
        this.deploymentSteps = deploymentSteps;
    }

    public void addDeploymentStep(DeployPackageStep step) {
        if (this.deploymentSteps == null)
            this.deploymentSteps = new ArrayList<DeployPackageStep>(1);

        this.deploymentSteps.add(step);
    }
}