<%@ page language="java" %>
<%@ page errorPage="/common/Error.jsp" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tld/hq.tld" prefix="hq" %>

<!-- RolePermissionsForm.jsp -->

<tiles:importAttribute name="mode" ignore="true"/>
<tiles:importAttribute name="rolePermissions" ignore="true"/>

<!--  TABLED LIST    -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <!-- THE GLOBAL PERMISSIONS HEADER ROW -->
  <tr class="ListHeader">
    <td class="ListHeaderInactive">
      <html:img page="/images/spacer.gif" width="175" height="1" border="0"/><br>
      <fmt:message key="admin.role.perms.GlobalPermissions"/></td>

    <td width="150px" class="ListHeaderInactive" colspan="2"><div align="center">
      <html:img page="/images/spacer.gif" width="50" height="1" border="0"/><br>
      <fmt:message key="admin.role.perms.Authorized"/></div></td>
  </tr>

  <!-- EACH GLOBAL PERM ROW -->
  
  <!-- MANAGE_SECURITY -->
  <tr class="ListRow">
    <td class="ListCell">
       <b><fmt:message key="admin.role.perms.perm.MANAGE_SECURITY"/></b>
       <c:if test="${mode eq edit || mode eq new}">**</c:if>
    </td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['MANAGE_SECURITY']}">
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected" colspan="2"><html:multibox property="p" value="MANAGE_SECURITY" onclick="ToggleAll(this)"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- MANAGE_INVENTORY -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.MANAGE_INVENTORY"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['MANAGE_INVENTORY']}">
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected" colspan="2"><html:multibox property="p" value="MANAGE_INVENTORY" onclick="ToggleSelection(this, 'MANAGE_SECURITY')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- MANAGE_SETTINGS -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.MANAGE_SETTINGS"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['MANAGE_SETTINGS']}">
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected" colspan="2"><html:multibox property="p" value="MANAGE_SETTINGS" onclick="ToggleSelection(this, 'MANAGE_SECURITY')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- MANAGE_BUNDLE  -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.MANAGE_BUNDLE"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['MANAGE_BUNDLE']}">
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected" colspan="2"><html:multibox property="p" value="MANAGE_BUNDLE" onclick="ToggleSelection(this, 'MANAGE_BUNDLE')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- END GLOBAL PERM ROWS -->

  <!-- THE RESOURCE PERMISSIONS HEADER ROW -->
  <tr class="ListHeader">
    <td class="ListHeaderInactive">
      <html:img page="/images/spacer.gif" width="175" height="1" border="0"/><br>
      <fmt:message key="admin.role.perms.ResourcePermissions"/></td>

    <td class="ListHeaderInactive" nowrap="nowrap" colspan="2"><div align="center">
      <html:img page="/images/spacer.gif" width="50" height="1" border="0"/><br>
      <fmt:message key="admin.role.perms.Authorized"/></div></td>
  </tr>

  <!-- EACH RESOURCE PERM ROW -->

  <!-- MODIFY_RESOURCE -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.MODIFY_RESOURCE"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['MODIFY_RESOURCE']}">
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected" colspan="2"><html:multibox property="p" value="MODIFY_RESOURCE" onclick="ToggleSelection(this, 'MANAGE_SECURITY')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- DELETE_RESOURCE -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.DELETE_RESOURCE"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['DELETE_RESOURCE']}">
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected" colspan="2"><html:multibox property="p" value="DELETE_RESOURCE" onclick="ToggleSelection(this, 'MANAGE_SECURITY')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- CREATE_CHILD_RESOURCES -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.CREATE_CHILD_RESOURCES"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['CREATE_CHILD_RESOURCES']}">
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell" colspan="2"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected" colspan="2"><html:multibox property="p" value="CREATE_CHILD_RESOURCES" onclick="ToggleSelection(this, 'MANAGE_SECURITY')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- THE SUBSYSTEM PERMISSIONS HEADER ROW -->
  <tr class="ListHeader">
    <td class="ListHeaderInactive">
      <html:img page="/images/spacer.gif" width="175" height="1" border="0"/><br>
      <fmt:message key="admin.role.perms.SubsystemPermissions"/></td>

    <td class="ListHeaderInactive" nowrap="nowrap"><div align="center">
      <html:img page="/images/spacer.gif" width="25" height="1" border="0"/><br>
      <fmt:message key="admin.role.perms.Read"/></div></td>
      
    <td class="ListHeaderInactive" nowrap="nowrap"><div align="center">
      <html:img page="/images/spacer.gif" width="25" height="1" border="0"/><br>
      <fmt:message key="admin.role.perms.Write"/></div></td>
  </tr>

  <!-- MANAGE_ALERTS -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.MANAGE_ALERTS"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['MANAGE_ALERTS']}">
    <td align="center" class="ListCell"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCell"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCell"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCellCheckboxSelected"><html:multibox property="p" value="MANAGE_ALERTS" onclick="ToggleSelection(this, 'MANAGE_SECURITY')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- MANAGE_MEASUREMENTS -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.MANAGE_MEASUREMENTS"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['MANAGE_MEASUREMENTS']}">
    <td align="center" class="ListCell"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCell"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCell"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCellCheckboxSelected"><html:multibox property="p" value="MANAGE_MEASUREMENTS" onclick="ToggleSelection(this, 'MANAGE_SECURITY')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- MANAGE_CONTENT -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.MANAGE_CONTENT"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['MANAGE_CONTENT']}">
    <td align="center" class="ListCell"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCell"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCell"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCellCheckboxSelected"><html:multibox property="p" value="MANAGE_CONTENT" onclick="ToggleSelection(this, 'MANAGE_SECURITY')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- CONTROL -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.CONTROL"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['CONTROL']}">
    <td align="center" class="ListCell"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCell"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCell"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected"><fmt:message key="admin.role.perms.NotApplicable"/></td>
    <td align="center" class="ListCellCheckboxSelected"><html:multibox property="p" value="CONTROL" onclick="ToggleSelection(this, 'MANAGE_SECURITY')"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- CONFIGURE -->
  <tr class="ListRow">
    <td class="ListCell"><b><fmt:message key="admin.role.perms.perm.CONFIGURE"/></b></td>

  <c:choose>
    <c:when test="${mode eq 'view'}">
      <c:choose>
        <c:when test="${rolePermissions['CONFIGURE_READ']}">
    <td align="center" class="ListCell"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
      <c:choose>
        <c:when test="${rolePermissions['CONFIGURE_WRITE']}">
    <td align="center" class="ListCell"><html:img page="/images/permission_enabled.gif" width="11" height="11" border="0"/></td>
        </c:when>
        <c:otherwise>
    <td align="center" class="ListCell"><html:img page="/images/permission_disabled.gif" width="11" height="11" border="0"/></td>
        </c:otherwise>
      </c:choose>
    </c:when>
    <c:otherwise>
    <td align="center" class="ListCellCheckboxSelected"><html:multibox property="p" value="CONFIGURE_READ" onclick="ToggleSelection(this, 'MANAGE_SECURITY'); ToggleSelectionState(this, 'CONFIGURE_WRITE', 0)"/></td>
    <td align="center" class="ListCellCheckboxSelected"><html:multibox property="p" value="CONFIGURE_WRITE" onclick="ToggleSelection(this, 'MANAGE_SECURITY'); ToggleSelectionState(this, 'CONFIGURE_READ', 1)"/></td>
    </c:otherwise>
  </c:choose>
  </tr>

  <!-- END RESOURCE PERM ROWS -->

 <c:if test="${mode eq edit || mode eq new}">
  <script language="JavaScript" src="<html:rewrite page="/js/adminEditRole_checkAll.js"/>"></script>
  <tr class="ListRow">
   <td colspan="3">**<fmt:message key="admin.role.perms.perm.MANAGE_SECURITY.warning"/></td>
  </tr>
 </c:if>

</table>

<!--  /  -->