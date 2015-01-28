<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<doshou:contentHeader/>

<div data-table="historyTable" class="panel">

    <ul class="nav nav-tabs">
        <li class="active">
            <a href="${ctx}/admin/sys/user/lastOnline">
                <i class="icon-table"></i>
                用户最后在线历史列表
            </a>
        </li>
    </ul>

    <!-- Toolbar -->
    <nav class="navbar navbar-default" role="navigation" style="margin-top: 10px;">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-3">
                    <span class="sr-only">工具条</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse tool" id="bs-example-navbar-collapse-3" style="margin-left: -30px;">
                <ul class="nav navbar-nav">
                    <li><a class="btn no-disabled btn-refresh" href="${ctx}/admin/sys/user/lastOnline">
                        <i class="fa fa-refresh fa-fw"></i> 刷新</a></li>
                </ul>

                <%@include file="searchForm.jsp" %>

            </div>
        </div>
    </nav>
    <%@include file="listTable.jsp"%>
</div>
<doshou:contentFooter/>