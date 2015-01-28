<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<doshou:contentHeader/>

<c:set var="organizationId" value="${empty organization ? 0 : organization.id}"/>
<c:set var="jobId" value="${empty job ? 0 : job.id}"/>

<div data-table="table" class="panel ifr-inside-wrapper table-page-wrapper">
    <ul class="nav nav-tabs">
        <li ${param['search.deleted_eq'] ne 'true' and param['search.status_eq'] ne 'blocked' ? 'class="active"' : ''}>
            <a href="${ctx}/admin/sys/user/${organizationId}/${jobId}"><i class="fa fa-users fa-fw"></i> 所有用户列表</a>
        </li>
        <li ${param['search.deleted_eq'] eq 'true' ? 'class="active"' : ''}>
            <a href="${ctx}/admin/sys/user/${organizationId}/${jobId}?search.deleted_eq=true"><i class="fa fa-users fa-fw"></i> 已删除用户列表</a>
        </li>
        <li ${param['search.status_eq'] eq 'blocked' ? 'class="active"' : ''}>
            <a href="${ctx}/admin/sys/user/${organizationId}/${jobId}?search.status_eq=blocked"><i class="fa fa-users fa-fw"></i> 已封禁用户列表</a>
        </li>
    </ul>

    <doshou:showMessage/>

    <div class="row">
        <div class="panel-body">
            <div class="table-responsive" style="overflow-x: inherit;">
                <!-- Toolbar -->
                <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">工具条</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div class="collapse navbar-collapse tool" id="bs-example-navbar-collapse-1" style="margin-left: -30px;">
                            <ul class="nav navbar-nav">
                                <li><a class="btn no-disabled btn-refresh" href="${ctx}/admin/sys/user/0/0">
                                    <i class="fa fa-refresh fa-fw"></i> 刷新</a></li>
                                <shiro:hasPermission name="sys:user:create">
                                    <li><a class="btn no-disabled btn-create">
                                        <i class="fa fa-file-o fa-fw"></i> 新增</a></li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sys:user:update">
                                    <li><a id="update" class="btn btn-update">
                                        <i class="fa fa-edit fa-fw"></i> 修改</a></li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sys:user:delete">
                                    <li><a class="btn btn-delete">
                                        <i class="fa fa-trash-o fa-fw"></i> 删除</a></li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="sys:user;*"><%-- 当拥有所有权限时才能使用 --%>
                                    <li class="dropdown">
                                        <a href="#" class="btn dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-wrench fa-fw"></i> 更多操作 <span class="caret"></span></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a class="btn btn-link change-password">
                                                <i class="fa fa-key fa-fw"></i> 修改密码</a></li>
                                            <li><a class="btn btn-link block-user">
                                                <i class="fa fa-lock fa-fw"></i> 封禁用户</a></li>
                                            <li><a class="btn btn-link unblocked-user">
                                                <i class="fa fa-unlock fa-fw"></i> 解封用户</a></li>
                                            <li><a class="btn btn-link recycle">
                                                <i class="fa fa-recycle fa-fw"></i> 还原删除的用户</a></li>
                                            <li class="divider"></li>
                                            <li><a class="btn btn-link status-history">
                                                <i class="fa fa-history fa-fw"></i> 状态变更历史</a></li>
                                            <li><a class="btn btn-link last-online-info">
                                                <i class="fa fa-history fa-fw"></i> 最后在线历史</a></li>
                                        </ul>
                                    </li>
                                </shiro:hasPermission>
                            </ul>

                            <%@include file="searchForm.jsp" %>

                        </div>
                    </div>
                </nav>

                <!-- DataTable -->
                <table id="table" class="sort-table table table-striped table-bordered table-hover" data-prefix-url="${ctx}/admin/sys/user">
                    <thead>
                    <tr>
                        <th style="width: 20px;">&nbsp;</th>
                        <th style="width: 100px;">
                            <a class="check-all" href="javascript:;">全选</a>
                            |
                            <a class="reverse-all" href="javascript:;">反选</a>
                        </th>
                        <th sort="id">编号</th>
                        <th sort="username">用户名</th>
                        <th sort="email">邮箱</th>
                        <th sort="mobilePhoneNumber">手机号</th>
                        <th>创建时间</th>
                        <th>帐户状态</th>
                        <th>管理员</th>
                    </tr>
                    <tbody>
                    <c:forEach items="${page.content}" var="m">
                        <tr>
                            <td>
                                <a data-id="${m.id}"
                                   class="btn-link toggle-child fa fa-plus-circle fa-fw"
                                   title="点击查看/隐藏组织机构和工作职务">
                                </a>
                            </td>

                            <td class="check">
                                <input type="checkbox" name="ids" value="${m.id}" data-status="${m.status}"
                                       data-deleted="${m.deleted}"/>
                            </td>
                            <td>
                                <a href="${ctx}/admin/sys/user/${m.id}">
                                        ${m.id}
                                </a>
                            </td>
                            <td>${m.username}</td>
                            <td>${m.email}</td>
                            <td>${m.mobilePhoneNumber}</td>
                            <td><spring:eval expression="m.createDate"/></td>
                            <td>${m.status.info}</td>
                            <td>${m.admin?'是' : '否'}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <doshou:page page="${page}"/>
            </div>
        </div>
    </div>
</div>
<doshou:contentFooter/>
<%@include file="/WEB-INF/jsp/common/admin/import-sys-js.jspf"%>
<script>
    $(function() {
        $.sys.user.initUserListButton();
        $.app.toggleLoadTable($("#table"), "${ctx}/admin/sys/user/{parentId}/organizations")
    });
</script>