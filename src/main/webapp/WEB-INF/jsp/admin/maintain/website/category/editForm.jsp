<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<doshou:contentHeader/>

<div class="panel">
    <ul class="nav nav-tabs">
        <shiro:hasPermission name="maintain:website:category:create">
            <c:if test="${op eq '新增'}">
                <li ${op eq '新增' ? 'class="active"' : ''}>
                    <a href="${ctx}/admin/maintain/website/category/create?BackURL=<doshou:backURL/>">
                        <i class="fa fa-file-o fa-fw"></i> 新增
                    </a>
                </li>
            </c:if>
        </shiro:hasPermission>

        <c:if test="${not empty m.id}">
            <li ${op eq '查看' ? 'class="active"' : ''}>
                <a href="${ctx}/admin/maintain/website/category/${m.id}?BackURL=<doshou:backURL/>">
                    <i class="fa fa-eye fa-fw"></i> 查看
                </a>
            </li>
            <shiro:hasPermission name="maintain:website:category:update">
                <li ${op eq '修改' ? 'class="active"' : ''}>
                    <a href="${ctx}/admin/maintain/website/category/${m.id}/update?BackURL=<doshou:backURL/>">
                        <i class="fa fa-edit fa-fw"></i> 修改
                    </a>
                </li>
            </shiro:hasPermission>
        </c:if>
        <li>
            <a href="<doshou:backURL/>" class="btn btn-link">
                <i class="fa fa-reply fa-fw"></i> 返回
            </a>
        </li>
    </ul>

    <form:form id="editForm" method="post" commandName="m" cssClass="form-inline form-horizontal form-small form-wrapper"
               enctype="multipart/form-data">
        <doshou:showGlobalError commandName="m"/>
        <form:hidden path="id"/>

        <div id="baseinfo" class="baseinfo container">
            <div class="row">
                <h4 class="hr">类别基本信息</h4>

                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="name" cssClass="control-label">类别名称</form:label>
                    <div class="controls">
                        <form:input path="name" cssClass="validate[required]"
                                    placeholder="2到20个汉字、字母、数字或下划线"/>
                    </div>
                </div>
                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="sortOrder" cssClass="control-label">权重</form:label>
                    <div class="controls">
                        <form:input path="sortOrder"
                                    cssClass="validate[required,custom[number]]"
                                    placeholder="数字越小排在越前面"/>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="isShow" cssClass="control-label">是否显示</form:label>
                    <div class="controls inline-radio">
                        <form:radiobuttons path="isShow" items="${booleanList}" itemLabel="info" cssClass="validate[required]"/>
                    </div>
                </div>
            </div>
        </div>
        <%--
        <c:set var="displayOrganizationJobs" value="${m.displayOrganizationJobs}"/>
        <%@include file="/WEB-INF/jsp/admin/sys/organization/selectOrganizationAndJob.jspf"%>
        --%>
        <c:if test="${op eq '新增'}">
            <c:set var="icon" value="fa-file-o"/>
        </c:if>
        <c:if test="${op eq '修改'}">
            <c:set var="icon" value="fa-edit"/>
        </c:if>

        <div class="control-group left-group" style="margin-left: 30px;">
            <div>
                <button type="submit" class="btn btn-primary">
                    <i class="fa ${icon} fa-fw"></i>
                        ${op}
                </button>
                <a href="<doshou:backURL/>" class="btn">
                    <i class="fa fa-reply fa-fw"></i> 返回
                </a>
            </div>
        </div>

    </form:form>
</div>
<doshou:contentFooter/>
<%@include file="/WEB-INF/jsp/common/admin/import-maintain-js.jspf"%>
<script type="text/javascript">
    $(function () {

        <c:choose>
        <c:when test="${op eq '查看'}">
        $.app.readonlyForm($("#editForm"), true);
        //$.sys.organization.removeOrganizationBtn();
        </c:when>
        <c:otherwise>
        $.maintain.website.initValidator($("#editForm"));
        <doshou:showFieldError commandName="m"/>
        </c:otherwise>
        </c:choose>

        //$.sys.organization.initSelectForm("organizationId", "jobId");

    });

</script>