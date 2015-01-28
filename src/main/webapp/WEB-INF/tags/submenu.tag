<%@tag pageEncoding="UTF-8" description="构建子菜单" %>
<%@ attribute name="menu" type="me.doshou.admin.sys.resource.entity.tmp.Menu" required="true" description="当前菜单" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="doshou" tagdir="/WEB-INF/tags" %>
<c:choose>
    <c:when test="${!menu.hasChildren}">
        <li>
            <a data-src="${menu.url}" data-title="${menu.name}" icon-class="${menu.icon}">
                <i class="fa ${menu.icon} fa-fw"></i> ${menu.name}
            </a>
        </li>
    </c:when>
    <c:otherwise>
        <li>
            <a href="#"><i class="fa ${menu.icon} fa-fw"></i> ${menu.name}<span class="fa arrow"></span></a>
            <ul class="nav nav-third-level">
                <c:forEach items="${menu.children}" var="menu2">
                    <doshou:submenu menu="${menu2}"/>
                </c:forEach>
            </ul>
        </li>
    </c:otherwise>
</c:choose>