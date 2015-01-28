<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>

<nav class="navbar navbar-default navbar-static-top header-wrap" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <a class="navbar-brand logo" href="/"></a>
    </div>
    <h3 class="navbar-header nav-logo">剁手么网站后台管理系统</h3>
    <!-- 最上面导航 begin -->
    <!-- 右上角用户功能条 -->
    <shiro:user>
    <ul class="nav navbar-top-links navbar-right">
        <li class="btn" title="点击查看个人资料">
            <a data-src="/admin/sys/user/loginUser/viewInfo" data-title="个人资料" icon-class="fa-user">
                <sys:showLoginUsername/>，欢迎您！</a>
        </li>
        <li class="btn" title="我的通知">
            <a data-src="/office/personal/notice/list?read=false" data-title="我的通知" icon-class="fa-volume-up">
                <i class="fa fa-volume-up fa-fw"></i>
            </a>
        </li>
        <li class="btn" title="我的消息">
            <a data-src="/admin/personal/message" data-title="我的消息" icon-class="fa-envelope">
                <i class="fa fa-envelope fa-fw"></i>
            </a>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-gears fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                    <a data-src="/admin/sys/user/loginUser/viewInfo" data-title="个人资料" icon-class="fa-user">
                        <i class="fa fa-user fa-fw"></i> 个人资料</a>
                </li>
                <li>
                    <a data-src="/admin/sys/user/loginUser/changePassword" data-title="个人资料" icon-class="fa-user">
                        <i class="fa fa-key fa-fw"></i> 修改密码</a>
                </li>
            </ul>
        </li>
        <li class="btn" title="退出">
            <a href="${ctx}/admin/logout"><i class="fa fa-sign-out fa-fw"></i></a>
        </li>
    </ul>
    </shiro:user>
    <!-- /最上面导航 end -->

    <!-- 左侧菜单导航 begin -->
    <%@include file="menu.jsp"%>
    <!-- /左侧菜单导航 end -->

</nav>
