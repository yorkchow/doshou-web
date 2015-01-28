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
        <li class="active">
            <a href="${ctx}/admin/maintain/website/category">
                <i class="icon-table"></i>
                所有类别列表
            </a>
        </li>
    </ul>

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
                    <li><a class="btn no-disabled btn-refresh" href="${ctx}/admin/maintain/website/category">
                        <i class="fa fa-refresh fa-fw"></i> 刷新</a></li>
                    <shiro:hasPermission name="maintain:website:product:create">
                        <li><a class="btn no-disabled btn-create">
                            <i class="fa fa-file-o fa-fw"></i> 新增</a></li>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="maintain:website:product:update">
                        <li><a id="update" class="btn btn-update">
                            <i class="fa fa-edit fa-fw"></i> 修改</a></li>
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
    <%@include file="/WEB-INF/jsp/common/admin/import-maintain-js.jspf"%>
    <script type="text/javascript">
        function callback() {
            $(".scroll-pane").niceScroll({domfocus:true, hidecursordelay: 2000});
            $.maintain.website.initBtn();
        }
        $(function() {
            callback();
        });
    </script>
</c:if>