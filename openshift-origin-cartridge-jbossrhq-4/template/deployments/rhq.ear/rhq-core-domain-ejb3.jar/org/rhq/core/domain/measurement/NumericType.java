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
package org.rhq.core.domain.measurement;

/**
 * More detailed description of numeric measurement data.
 * 
 * If dataType is "measurement", this further describes the measurement data.
                  This defines whether the measurement values that get collected
                  consistently increase over time or are dynamic and can "randomly"
                  be higher or lower than previous values. The system will by itself generate
                  per minute metrics for data with measurementType of 
                  trendsup or trendsdown.
 * @author Heiko W. Rupp
 */
public enum NumericType {
    /** Data fluctuates up and down */
    DYNAMIC,
    /** Data monotonically increases, e.g. number of Tx created */
    TRENDSUP,
    /** Data monotonically decreases */
    TRENDSDOWN
}