<%@ page language="java" %>
<%@ page errorPage="/common/Error.jsp" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html:form action="/alerts/EditProperties">

<tiles:insert definition=".page.title.events">
  <tiles:put name="titleKey" value="alert.config.edit.page.PageTitle"/>
</tiles:insert>

<tiles:insert definition=".header.tab">
<tiles:put name="tabKey" value="alert.config.props.PropertiesBox"/>
</tiles:insert>

<html:hidden property="ad"/>
<c:choose>
  <c:when test="${not empty Resource}">
    <html:hidden property="id" value="${Resource.id}"/>
  </c:when>
  <c:when test="${not empty ResourceGroup}">
    <html:hidden property="groupId" value="${ResourceGroup.id}"/>
  </c:when>
  <c:otherwise>
    <html:hidden property="type" value="${ResourceType.id}"/>
  </c:otherwise>
</c:choose>

<tiles:insert definition=".events.config.properties"/>

<tiles:insert definition=".form.buttons"/>

<tiles:insert definition=".page.footer"/>

</html:form>
