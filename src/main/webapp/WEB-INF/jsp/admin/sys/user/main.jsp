<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<doshou:contentHeader index="true"/>
<%--
<div class="ifr-inside-wrapper ifr-margin-top">
    <div class="nav nav-tabs">
        <li class="active">
            <a href="${ctx}/admin/sys/user/${organizationId}/${jobId}"><i class="fa fa-users fa-fw"></i> 所有用户列表</a>
        </li>
    </div>

    <doshou:showMessage/>

    <div class="tab-content">
        <div class="tab-pane active embed-responsive embed-responsive-4by3">
            <iframe id="listFrame" name="listFrame" scrolling="auto"
                    src="${ctx}/admin/sys/user/0/0" class="embed-responsive-item"></iframe>
        </div>
    </div>
</div>
--%>
<div class="tab-content">
    <div class="tab-pane active embed-responsive embed-responsive-4by3">
        <iframe id="listFrame" name="listFrame" scrolling="auto"
                src="${ctx}/admin/sys/user/0/0" class="embed-responsive-item"></iframe>
    </div>
</div>

<doshou:contentFooter/>
