<%@ page language="java" %>
<%@ page errorPage="/common/Error.jsp" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic-el" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/hq.tld" prefix="hq" %>

<!-- Properties Content -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td colspan="4" class="BlockContent"><html:img page="/images/spacer.gif" width="1" height="1" border="0"/></td>
  </tr>
  <logic:messagesPresent property="global">
  <tr>
    <td colspan="4" class="ErrorField">
      <span class="ErrorFieldContent">
        <html:errors property="global" />
      </span>
    </td>
  </tr>
  </logic:messagesPresent>
  <tr valign="top">
    <%-- name --%>
    <td width="20%" class="BlockLabel">
      <html:img page="/images/icon_required.gif" width="9" height="9"
      border="0"/><fmt:message key="common.label.Name"/>
    </td>
    <logic:messagesPresent property="name">
    <td width="30%" class="ErrorField">
      <html:text size="30" property="name"/>
      <br><span class="ErrorFieldContent">- <html:errors property="name"/></span>
    </td>
    </logic:messagesPresent>
    <logic:messagesNotPresent property="name">
    <td width="30%" class="BlockContent">
      <html:text size="30" property="name"/>
    </td>
    </logic:messagesNotPresent>

    <%-- priority --%>
    <td width="20%" class="BlockLabel">
      <html:img page="/images/icon_required.gif" width="9" height="9"
      border="0"/><fmt:message key="alert.config.props.PB.Priority"/>
    </td>
    <logic:messagesPresent property="priority">
    <td width="30%" class="ErrorField">
      <html:select property="priority">
      <hq:optionMessageList property="priorities"
      baseKey="alert.config.props.PB.Priority" filter="true"/>
      </html:select>
      <span class="ErrorFieldContent">- <html:errors property="priority"/></span>
    </td>
    </logic:messagesPresent>
    <logic:messagesNotPresent property="priority">
    <td width="30%" class="BlockContent">
      <html:select property="priority">
      <hq:optionMessageList property="priorities"
      baseKey="alert.config.props.PB.Priority" filter="true"/>
      </html:select>
    </td>
    </logic:messagesNotPresent>
  </tr>
  
  <tr valign="top">
    <%-- description --%>
    <td width="20%" class="BlockLabel">
      <fmt:message key="common.label.Description"/>
    </td>
    <logic:messagesPresent property="description">
    <td width="30%" class="ErrorField">
      <html:textarea cols="40" rows="3" property="description"/>
      <span class="ErrorFieldContent">- <html:errors property="description"/></span>
    </td>
    </logic:messagesPresent>
    <logic:messagesNotPresent property="description">
    <td width="30%" class="BlockContent">
      <html:textarea cols="40" rows="3" property="description"/>
    </td>
    </logic:messagesNotPresent>

    <%-- active --%>
    <td width="20%" class="BlockLabel">
      <html:img page="/images/icon_required.gif" width="9" height="9"
      border="0"/><fmt:message key="alert.config.props.PB.Active"/>
    </td>
    <logic:messagesPresent property="enabled">
    <td width="30%" class="ErrorField">
      <html:radio property="active" value="true"/>
      <fmt:message key="alert.config.props.PB.ActiveYes"/><br>
      <html:radio property="active" value="false"/>
      <fmt:message key="alert.config.props.PB.ActiveNo"/>
      <span class="ErrorFieldContent">- <html:errors property="active"/></span>
    </td>
    </logic:messagesPresent>
    <logic:messagesNotPresent property="enabled">
    <td width="30%" class="BlockContent">
      <html:radio property="active" value="true"/>
      <fmt:message key="alert.config.props.PB.ActiveYes"/><br>
      <html:radio property="active" value="false"/>
      <fmt:message key="alert.config.props.PB.ActiveNo"/>
    </td>
    </logic:messagesNotPresent>
  </tr>
  <c:if test="${alertDef.parentId > 0 or not empty alertDef.groupAlertDefinition}">
  <tr>
  	<td width="20%" class="BlockLabel">
      <fmt:message key="common.label.ReadOnly"/>
    </td>
  	<td width="80%" class="BlockContent" colspan="3">
  		<html:checkbox property="readOnly" />
  		<fmt:message key="alert.config.props.PB.ReadOnly"/>
  	</td>
  </tr>
  </c:if>
  <tr>
    <td colspan="4" class="BlockContent"><html:img page="/images/spacer.gif" width="1" height="1" border="0"/></td>
  </tr>
  <tr>
    <td colspan="4" class="BlockBottomLine"><html:img page="/images/spacer.gif" width="1" height="1" border="0"/></td>
  </tr>

</table>
&nbsp;<br>
