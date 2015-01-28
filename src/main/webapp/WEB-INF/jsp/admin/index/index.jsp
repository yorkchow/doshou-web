<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<doshou:contentHeader title="剁手么网站后台管理系统"/>

<div id="wrapper">

    <!-- 导航条 begin -->
    <%@include file="nav.jsp"%>
    <!-- 导航条 end -->

    <!-- Page Content -->
    <div id="page-wrapper" style="padding:65px 0;">
        <ul id="nav-tabs" class="nav nav-tabs">
            <li class="active">
                <a href="#tab_0" data-toggle="tab" tab-name="dashboard">
                    <i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active embed-responsive embed-responsive-4by3" id="tab_0">
                <iframe src="/admin/welcome" scrolling="auto" class="embed-responsive-item"></iframe>
            </div>
        </div>
    </div>
</div>

<doshou:contentFooter/>

</body>
</html>
