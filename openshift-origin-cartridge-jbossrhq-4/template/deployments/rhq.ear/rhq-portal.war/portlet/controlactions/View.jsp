<%@ page language="java" %>
<%@ page errorPage="/common/Error.jsp" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/hq.tld" prefix="hq" %>
<%@ taglib uri="/WEB-INF/tld/display.tld" prefix="display" %>

<tiles:importAttribute name="displayLastCompleted"/>
<tiles:importAttribute name="lastCompletedResource" ignore="true"/>
<tiles:importAttribute name="lastCompletedGroup" ignore="true"/>

<tiles:importAttribute name="displayNextScheduled"/>
<tiles:importAttribute name="nextScheduledResource" ignore="true"/>
<tiles:importAttribute name="nextScheduledGroup" ignore="true"/>
            
<div class="effectsPortlet">
<!-- Content Block Title -->
<tiles:insert definition=".header.tab">
  <tiles:put name="tabKey" value="dash.home.Control"/>
  <tiles:put name="adminUrl" beanName="adminUrl" />
  <tiles:put name="portletName" beanName="portletName" />
  <tiles:put name="showRefresh" beanName="showRefresh" />      
</tiles:insert>

<!-- each sub-section can be hidden or visible.  They can't be re-ordered. -->

<table width="100%" cellpadding="0" cellspacing="0" border="0" class="DashboardControlActionsContainer">
  <tr>
    <td>
      <c:if test="${displayLastCompleted}">  
        <!-- Recent Actions Contents -->
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <td class="Subhead"><fmt:message key="dash.home.Subhead.Recent"/></td>
          </tr>
        </table>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <c:choose>    
            <c:when test="${empty lastCompletedResource && empty lastCompletedGroup}">
              <tr class="ListRow">
                <td class="ListCell"><fmt:message key="dash.home.no.operations.to.display"/></td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:if test="${!empty lastCompletedResource}">
              <tr>
                <td width="25%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.Resource"/></td>
                <td width="20%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.Location"/></td>
                <td width="15%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.ControlAction"/></td>
                <td width="20%" class="ListHeaderInactiveSorted"><fmt:message key="dash.home.TableHeader.DateTime"/><html:img page="/images/tb_sortdown_inactive.gif" width="9" height="9" border="0"/></td>
                <td width="5%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.Status"/></td>
              </tr>  
              <c:forEach items="${lastCompletedResource}" var="obj">
                <tr class="ListRow">                                                   
                  <td class="ListCell"><display:disambiguatedResourceName resourceName="${obj.original.resourceName}" disambiguationReport="${obj}" resourceId="${obj.original.resourceId}" /></td>
                  <td class="ListCell"><display:disambiguatedResourceLineage parents="${obj.parents}" />&nbsp;</td>
                  <td class="ListCell"><c:out value="${obj.original.operationName}"/></td>
                  <td class="ListCell"><hq:dateFormatter value="${obj.original.operationStartTime}"/></td>
                  <td class="ListCell" align="center">
                     <html:link page="/rhq/resource/operation/resourceOperationHistoryDetails.xhtml?id=${obj.original.resourceId}&opId=${obj.original.operationHistoryId}">
                     <c:choose>
                        <c:when test="${obj.original.operationStatus == 'SUCCESS'}">
                           <html:img page="/images/icons/availability_green_16.png" alt="${obj.original.operationStatus}" title="${obj.original.operationStatus}" />
                        </c:when>    
                        <c:when test="${obj.original.operationStatus == 'FAILURE'}">
                           <html:img page="/images/icons/availability_red_16.png" alt="${obj.original.operationStatus}" title="${obj.original.operationStatus}" />
                        </c:when>    
                        <c:when test="${obj.original.operationStatus == 'CANCELED'}">
                           <html:img page="/images/icons/availability_yellow_16.png" alt="${obj.original.operationStatus}" title="${obj.original.operationStatus}" />
                        </c:when>    
                        <c:otherwise>
                           <html:img page="/images/icons/availability_grey_16.png" alt="${obj.original.operationStatus}" title="${obj.original.operationStatus}"/>
                        </c:otherwise>
                     </c:choose>
                     </html:link>
                  </td>
                </tr>    
              </c:forEach>
              </c:if>
              <c:if test="${!empty lastCompletedGroup}">
              <tr>
                <td width="40%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.GroupName"/></td>
                <td width="35%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.GroupResourceType"/></td>
                <td width="15%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.ControlAction"/></td>
                <td width="25%" class="ListHeaderInactiveSorted"><fmt:message key="dash.home.TableHeader.DateTime"/><html:img page="/images/tb_sortdown_inactive.gif" width="9" height="9" border="0"/></td>
                <td width="5%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.Status"/></td>
              </tr>  
              <c:forEach items="${lastCompletedGroup}" var="obj">
                <tr class="ListRow">                                                   
                  <td class="ListCell"><html:link page="/rhq/group/monitor/graphs.xhtml?category=COMPATIBLE&groupId=${obj.groupId}"><c:out value="${obj.groupName}"/></html:link></td>
                  <td class="ListCell"><c:out value="${obj.groupResourceTypeName}"/></td>
                  <td class="ListCell"><c:out value="${obj.operationName}"/></td>
                  <td class="ListCell"><hq:dateFormatter value="${obj.operationStartTime}"/></td>
                  <td class="ListCell" align="center">
                     <html:link page="/groupScheduleNotImplementedYet?id=${obj.groupId}&opId=${obj.operationHistoryId}">
                     <c:choose>
                        <c:when test="${obj.operationStatus == 'SUCCESS'}">
                           <html:img page="/images/icons/availability_green_16.png" alt="${obj.operationStatus}" title="${obj.operationStatus}" />
                        </c:when>    
                        <c:when test="${obj.operationStatus == 'FAILURE'}">
                           <html:img page="/images/icons/availability_red_16.png" alt="${obj.operationStatus}" title="${obj.operationStatus}" />
                        </c:when>    
                        <c:when test="${obj.operationStatus == 'CANCELED'}">
                           <html:img page="/images/icons/availability_yellow_16.png" alt="${obj.operationStatus}" title="${obj.operationStatus}" />
                        </c:when>    
                        <c:otherwise>
                           <html:img page="/images/icons/availability_grey_16.png" alt="${obj.operationStatus}" title="${obj.operationStatus}"/>
                        </c:otherwise>
                     </c:choose>
                     </html:link>
                  </td>
                </tr>    
              </c:forEach>
              </c:if>
            </c:otherwise>
          </c:choose>
        </table>
      </c:if>
    </td>
  </tr>
  <tr>
    <td>
      <c:if test="${displayNextScheduled}">
        <!-- Pending Actions Content Here -->
        <table width="100%" cellpadding="0" cellspacing="0" border="0" class="ToolbarContent">
          <tr>
            <td class="Subhead"><fmt:message key="dash.home.Subhead.Pending"/></td>
          </tr>
        </table>    
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
          <c:choose>    
            <c:when test="${empty nextScheduledResource && empty nextScheduledGroup}">
              <tr class="ListRow">
                <td class="ListCell"><fmt:message key="dash.home.no.operations.to.display"/></td>
              </tr>
            </c:when>
            <c:otherwise>              
              <c:if test="${!empty nextScheduledResource}">
                <tr>
                  <td width="20%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.Resource"/></td>
                  <td width="35%" class="ListHeaderInactive" colspan="2"><fmt:message key="dash.home.TableHeader.Location"/></td>
                  <td width="15%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.ControlAction"/></td>
                  <td width="15%" class="ListHeaderInactiveSorted"><fmt:message key="dash.home.TableHeader.DateTime"/><html:img page="/images/tb_sortdown_inactive.gif" width="9" height="9" border="0"/></td>
                </tr>                
                <c:forEach items="${nextScheduledResource}" var="obj">
                  <tr class="ListRow">                                        
                    <td class="ListCell"><display:disambiguatedResourceName resourceName="${obj.original.resourceName}" disambiguationReport="${obj}" url="/rhq/resource/operation/resourceOperationScheduleDetails.xhtml?id=${obj.original.resourceId}&jobId=${obj.original.operationJobId}"/></td>
                    <td class="ListCell" colspan="2"><display:disambiguatedResourceLineage parents="${obj.parents}" /></td>
                    <td class="ListCell"><c:out value="${obj.original.operationName}"/></td>
                    <td class="ListCell"><hq:dateFormatter value="${obj.original.operationNextFireTime}"/></td>
                  </tr>    
                </c:forEach>              
              </c:if>
              <c:if test="${!empty nextScheduledGroup}">
                <tr>
                  <td width="20%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.GroupName"/></td>
                  <td width="50%" class="ListHeaderInactive" colspan="2"><fmt:message key="dash.home.TableHeader.GroupResourceType"/></td>
                  <td width="15%" class="ListHeaderInactive"><fmt:message key="dash.home.TableHeader.ControlAction"/></td>
                  <td width="15%" class="ListHeaderInactiveSorted"><fmt:message key="dash.home.TableHeader.DateTime"/><html:img page="/images/tb_sortdown_inactive.gif" width="9" height="9" border="0"/></td>
                </tr>                
                <c:forEach items="${nextScheduledGroup}" var="schedule">
                  <tr class="ListRow">                                        
                    <td class="ListCell"><html:link page="/rhq/group/operation/groupOperationScheduleDetails.xhtml?groupId=${schedule.groupId}&jobId=${schedule.operationJobId}&category=COMPATIBLE"><c:out value="${schedule.groupName}"/></html:link></td>
                    <td class="ListCell" colspan="2"><c:out value="${schedule.groupResourceTypeName}"/></td>
                    <td class="ListCell"><c:out value="${schedule.operationName}"/></td>
                    <td class="ListCell"><hq:dateFormatter value="${schedule.operationNextFireTime}"/></td>
                  </tr>    
                </c:forEach>              
              </c:if>
            </c:otherwise>
          </c:choose>  
        </table>
      </c:if>
    </td>
  </tr>
</table>
</div>
