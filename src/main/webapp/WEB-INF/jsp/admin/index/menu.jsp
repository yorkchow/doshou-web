<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="搜索...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                </div>
            </li>
            <li>
                <a class="active" href="/"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
            </li>
            <c:forEach items="${menus}" var="m">
                <li>
                    <a href="#"><i class="fa ${m.icon} fa-fw"></i> ${m.name}<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <c:forEach items="${m.children}" var="c">
                            <doshou:submenu menu="${c}"/>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
