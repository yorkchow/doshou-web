<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf" %>
<doshou:contentHeader title="用户登录 剁手么网站后台管理系统" index="true"/>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">用户登录</h3>
                </div>
                <div class="panel-body">
                    <doshou:showMessage></doshou:showMessage>
                    <form role="form" id="loginForm" method="post">
                        <doshou:backURL hiddenInput="true"/>
                        <fieldset>
                            <div class="form-group input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-user fa-fw"></i>
                                </span>
                                <input class="form-control" type="text" id="username" name="username" value="${param.username}"
                                       placeholder="请输入用户名、邮箱或手机号" autofocus>
                            </div>
                            <div class="form-group input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-key fa-fw"></i>
                                </span>
                                <input class="form-control" type="password" id="password" name="password" placeholder="请输入密码">
                            </div>
                            <%-- jcaptchaEbabled 在JCaptchaValidateFilter设置 --%>
                            <c:if test="${jcaptchaEbabled}">
                                <div class="form-group input-group">
                                <span class="input-group-addon">
                                    <i class="fa fa-qrcode fa-fw"></i>
                                </span>
                                    <input class="form-control" type="password" id="jcaptchaCode" name="jcaptchaCode"
                                           placeholder="请输入验证码">
                                    <img class="jcaptcha-btn jcaptcha-img" style="margin-left: 10px;" src="${ctx}/jcaptcha.jpg" title="点击更换验证码">
                                    <a class="jcaptcha-btn btn btn-link">换一张</a>
                                </div>
                            </c:if>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="rememberMe" name="rememberMe" value="true">记住我
                                </label>
                            </div>
                            <input type="submit" id="submitForm" class="btn btn-success btn-block" value="登录">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<doshou:contentFooter/>