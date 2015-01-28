<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<c:if test="${empty header['container']}">
    <doshou:contentHeader/>
    <style type="text/css">
        .scroll-pane {
            float: left;
            width: 100%;
            height: 100%;
            overflow: auto;
        }
    </style>
</c:if>
<div data-table="table" class="panel" id="panel">

    <ul class="nav nav-tabs">
        <li ${empty param['search.userId_eq'] and empty param['search.userId_gt'] ? 'class="active"' : ''}>
            <a href="${ctx}/admin/sys/user/online">
                <i class="icon-table"></i>
                所有用户列表
            </a>
        </li>

        <li ${not empty param['search.userId_gt'] ? 'class="active"' : ''}>
            <a href="${ctx}/admin/sys/user/online?search.userId_gt=0">
                <i class="icon-table"></i>
                登录用户列表
            </a>
        </li>
        <li ${not empty param['search.userId_eq'] ? 'class="active"' : ''}>
            <a href="${ctx}/admin/sys/user/online?search.userId_eq=0">
                <i class="icon-table"></i>
                匿名游客列表
            </a>
        </li>
    </ul>

    <%--
    <div class="row-fluid tool ui-toolbar">
        <div class="span4">
            <div class="btn-group">
                <shiro:hasPermission name="sys:userOnline or monitor:userOnline">
                    <a class="btn btn-force-logout">
                        <span class="icon-lightbulb"></span>
                        强制退出
                    </a>
                </shiro:hasPermission>
            </div>

        </div>
        <div class="span8">
            <%@include file="searchForm.jsp" %>
        </div>
    </div>
    --%>
    <!-- Toolbar -->
    <nav class="navbar navbar-default" role="navigation" style="margin-top: 10px;">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                    <span class="sr-only">工具条</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse tool" id="bs-example-navbar-collapse-2" style="margin-left: -30px;">
                <ul class="nav navbar-nav">
                    <li><a class="btn no-disabled btn-refresh" href="${ctx}/admin/sys/user/online">
                        <i class="fa fa-refresh fa-fw"></i> 刷新</a></li>
                    <shiro:hasPermission name="sys:userOnline or monitor:userOnline"><%-- 等价于sys:userOnline:* 所有权限 --%>
                        <li><a class="btn btn-force-logout">
                            <i class="fa fa-lightbulb-o fa-fw"></i> 强制退出</a></li>
                    </shiro:hasPermission>
                </ul>

                <%@include file="searchForm.jsp" %>

            </div>
        </div>
    </nav>

    <%@include file="listTable.jsp"%>
</div>
<c:if test="${empty header['container']}">
    <doshou:contentFooter/>
    <%@include file="/WEB-INF/jsp/common/admin/import-sys-js.jspf"%>
    <script type="text/javascript">
        function callback() {
            $(".scroll-pane").niceScroll({domfocus:true, hidecursordelay: 2000});
            $.sys.user.initOnlineListButton();
        }
        $(function() {
            callback();
        });
    </script>
</c:if>
