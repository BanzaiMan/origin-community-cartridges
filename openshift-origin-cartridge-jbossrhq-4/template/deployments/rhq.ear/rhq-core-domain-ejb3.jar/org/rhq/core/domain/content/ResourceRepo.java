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
package org.rhq.core.domain.content;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.rhq.core.domain.resource.Resource;

/**
 * This is the many-to-many entity that correlates a repo with one of its subscribers. It is an explicit relationship
 * mapping entity between {@link Repo} and {@link Resource}.
 *
 * @author John Mazzitelli
 */
@Entity
@IdClass(ResourceRepoPK.class)
@NamedQueries( {
    @NamedQuery(name = ResourceRepo.DELETE_BY_RESOURCES, query = "DELETE ResourceRepo rc WHERE rc.resource.id IN ( :resourceIds )"),
    @NamedQuery(name = ResourceRepo.DELETE_BY_RESOURCE_ID, query = "DELETE ResourceRepo rc WHERE rc.resource.id = :resourceId"),
    @NamedQuery(name = ResourceRepo.DELETE_BY_REPO_ID, query = "DELETE ResourceRepo rc WHERE rc.repo.id = :repoId") })
@Table(name = "RHQ_REPO_RESOURCE_MAP")
public class ResourceRepo implements Serializable {
    public static final String DELETE_BY_RESOURCES = "ResourceRepo.deleteByResources";
    public static final String DELETE_BY_RESOURCE_ID = "ResourceRepo.deleteByResourceId";
    public static final String DELETE_BY_REPO_ID = "ResourceRepo.deleteByRepoId";

    private static final long serialVersionUID = 1L;

    /*
     * http://opensource.atlassian.com/projects/hibernate/browse/EJB-286 Hibernate seems to want these mappings in the
     * @IdClass and ignore these here, even though the mappings should be here and no mappings should be needed in the
     * @IdClass.
     */

    @Id
    //   @ManyToOne
    //   @JoinColumn(name = "RESOURCE_ID", referencedColumnName = "ID", nullable = false, insertable = false, updatable = false)
    private Resource resource;

    @Id
    //   @ManyToOne
    //   @JoinColumn(name = "REPO_ID", referencedColumnName = "ID", nullable = false, insertable = false, updatable = false)
    private Repo repo;

    @Column(name = "CTIME", nullable = false)
    private long createdTime;

    protected ResourceRepo() {
    }

    public ResourceRepo(Resource resource, Repo repo) {
        this.resource = resource;
        this.repo = repo;
    }

    public ResourceRepoPK getResourceRepoPK() {
        return new ResourceRepoPK(resource, repo);
    }

    public void setResourceRepoPK(ResourceRepoPK pk) {
        this.resource = pk.getResource();
        this.repo = pk.getRepo();
    }

    /**
     * This is the epoch time when this mapping was first created; in other words, when the resource was subscribed to
     * the repo.
     *
     * @return the time the resource was subscribed to the repo
     */
    public long getCreatedTime() {
        return createdTime;
    }

    @PrePersist
    void onPersist() {
        this.createdTime = System.currentTimeMillis();
    }

    @Override
    public String toString() {
        StringBuilder str = new StringBuilder("ResourceRepo: ");
        str.append("ctime=[").append(new Date(this.createdTime)).append("]");
        str.append(", re=[").append(this.resource).append("]");
        str.append(", ch=[").append(this.repo).append("]");
        return str.toString();
    }

    @Override
    public int hashCode() {
        int result = 1;
        result = (31 * result) + ((resource == null) ? 0 : resource.hashCode());
        result = (31 * result) + ((repo == null) ? 0 : repo.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }

        if ((obj == null) || (!(obj instanceof ResourceRepo))) {
            return false;
        }

        final ResourceRepo other = (ResourceRepo) obj;

        if (resource == null) {
            if (other.resource != null) {
                return false;
            }
        } else if (!resource.equals(other.resource)) {
            return false;
        }

        if (repo == null) {
            if (other.repo != null) {
                return false;
            }
        } else if (!repo.equals(other.repo)) {
            return false;
        }

        return true;
    }
}