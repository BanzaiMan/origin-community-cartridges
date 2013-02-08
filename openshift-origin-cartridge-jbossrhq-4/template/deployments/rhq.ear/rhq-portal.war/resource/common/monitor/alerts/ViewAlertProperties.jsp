<%@ page language="java" %>
<%@ page errorPage="/common/Error.jsp" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/hq.tld" prefix="hq" %>


<!-- Content Block Title: Properties -->
<tiles:insert definition=".header.tab">
  <tiles:put name="tabKey" value="alert.current.detail.props.Title"/>
</tiles:insert>

<!-- Properties Content -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td colspan="5" class="BlockContent"><html:img page="/images/spacer.gif" width="1" height="1" border="0"/></td>
  </tr>
  <tr valign="top">
    <td width="20%" class="BlockLabel"><fmt:message key="common.label.Name"/></td>
    <td width="30%" class="BlockContent"><c:out value="${alertDef.name}"/><c:if test="${not empty Resource}"><br>
      <html:link page="/alerts/Config.do?mode=viewRoles&id=${Resource.id}&ad=${alertDef.id}"><fmt:message key="alert.config.props.PB.ViewDef"/></html:link></c:if></td>
    <td width="20%" class="BlockLabel"><fmt:message key="alert.config.props.PB.Priority"/></td>
    <td width="30%" class="BlockContent" colspan="2">
      <c:out value="${alertDef.priority.displayName}" />
    </td>
  </tr>
  <tr valign="top">
    <td width="20%" class="BlockLabel"><fmt:message key="common.label.Description"/></td>
    <td width="30%" class="BlockContent" rowspan="2"><c:out value="${alertDef.description}"/></td>
    <td width="20%" class="BlockLabel"><fmt:message key="alert.config.props.PB.AlertDefinitionActive"/></td>
    <tiles:insert page="/resource/common/monitor/alerts/config/AlertDefinitionActive.jsp">
      <tiles:put name="alertDef" beanName="alertDef"/>
    </tiles:insert>
  </tr>
  <tr valign="top">
    <td class="BlockLabel">&nbsp;</td>
    <td class="BlockLabel"><fmt:message key="alert.current.detail.props.AlertDate"/></td>
    <td class="BlockContent" colspan="2"><hq:dateFormatter time="false" value="${alert.ctime}"/></td>
  </tr>
  <c:choose>
      <c:when test="${not empty alert.acknowledgingSubject}">
          <tr valign="top">
              <td class="BlockLabel">Acknowledged by:</td>
              <td class="BlockContent">
                      <c:out value="${alert.acknowledgingSubject}"/>
                      <%--
                      <c:out value=" "/>
                      <c:out value="${alert.acknowledgingSubject.lastName}"/>
                      <c:out value=" ("/>
                      <c:out value="${alert.acknowledgingSubject.name}"/>
                      <c:out value=")"/>
                      --%>
              </td>
              <td class="BlockLabel">Acknowledged at:</td>
              <td class="BlockContent">
                      <hq:dateFormatter time="false" value="${alert.acknowledgeTime}"/>
              </td>
          </tr>
          </c:when>
      <c:otherwise>
          <tr valign="top">
              <td class="BlockLabel">Acknowledge Alert</td>
              <td class="BlockContent">
                  <a href="/alerts/AckAlert.do?id=${Resource.id}&a=${alert.id}&mode=${param.mode}">click here</a>
              </td>
              <td class="BlockContent">&nbsp;</td>
              <td class="BlockContent">&nbsp;</td>
          </tr>

      </c:otherwise>

  </c:choose>
  <tr>
    <td colspan="5" class="BlockContent"><html:img page="/images/spacer.gif" width="1" height="1" border="0"/></td>
  </tr>
  <tr>
    <td colspan="5" class="BlockBottomLine"><html:img page="/images/spacer.gif" width="1" height="1" border="0"/></td>
  </tr>
</table>
