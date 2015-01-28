<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<doshou:contentHeader/>

<div class="panel">
    <ul class="nav nav-tabs">
        <shiro:hasPermission name="maintain:website:product:create">
            <c:if test="${op eq '新增'}">
                <li ${op eq '新增' ? 'class="active"' : ''}>
                    <a href="${ctx}/admin/maintain/website/product/create?BackURL=<doshou:backURL/>">
                        <i class="fa fa-file-o fa-fw"></i> 新增
                    </a>
                </li>
            </c:if>
        </shiro:hasPermission>

        <c:if test="${not empty m.id}">
            <li ${op eq '查看' ? 'class="active"' : ''}>
                <a href="${ctx}/admin/maintain/website/product/${m.id}?BackURL=<doshou:backURL/>">
                    <i class="fa fa-eye fa-fw"></i> 查看
                </a>
            </li>
            <shiro:hasPermission name="maintain:website:product:update">
                <li ${op eq '修改' ? 'class="active"' : ''}>
                    <a href="${ctx}/admin/maintain/website/product/${m.id}/update?BackURL=<doshou:backURL/>">
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
        <form:hidden path="imgUrl"/>

        <div id="baseinfo" class="baseinfo container">
            <div class="row">
                <h4 class="hr">商品基本信息</h4>

                <div class="control-group col-sm-12 col-md-12 col-lg-12">
                    <form:label path="category.id" cssClass="control-label">商品类别</form:label>
                    <div class="controls">
                        <form:select path="category.id" cssClass="input-small">
                            <form:option value="0" label="请选择"/>
                            <form:options items="${categoryList}" itemValue="id" itemLabel="name"/>
                        </form:select>
                    </div>
                </div>
                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="brief" cssClass="control-label">商品说明</form:label>
                    <div class="controls">
                        <form:input path="brief" cssClass="validate[required]"
                                    placeholder="2到20个汉字、字母、数字或下划线"/>
                    </div>
                </div>
                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="url" cssClass="control-label">商品URL</form:label>
                    <div class="controls">
                        <form:input path="url" cssClass="validate[required]"
                                    placeholder="如http://www.tmaill.com"/>
                    </div>
                </div>
                <c:if test="${op eq '查看' or op eq '修改'}">
                <div class="control-group col-sm-12 col-md-12 col-lg-12">
                    <div class="alert alert-danger" role="alert">
                        以下原价和现价为方便计算都是在实际价格上剩以100，修改时请保持剩以100的结果！
                    </div>
                </div>
                </c:if>
                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="marketPrice" cssClass="control-label">原价</form:label>
                    <div class="controls">
                        <form:input path="marketPrice"
                                    cssClass="validate[required]"
                                    placeholder="数字、可以小数点保留1位"/>
                    </div>
                </div>
                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="shopPrice" cssClass="control-label">现价</form:label>
                    <div class="controls">
                        <form:input path="shopPrice"
                                    cssClass="validate[required]"
                                    placeholder="数字、可以小数点保留1位"/>
                    </div>
                </div>
                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="sales" cssClass="control-label">销量</form:label>
                    <div class="controls">
                        <form:input path="sales"
                                    cssClass="validate[required,custom[number]]"
                                    placeholder="数字"/>
                    </div>
                </div>
                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="comments" cssClass="control-label">评论数</form:label>
                    <div class="controls">
                        <form:input path="comments"
                                    cssClass="validate[required,custom[number]]"
                                    placeholder="数字"/>
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

                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="addDate" cssClass="control-label">创建日期</form:label>
                    <div class="controls input-append date">
                        <form:input path="addDate"
                                    data-format="yyyy-MM-dd"
                                    data-position="bottom-left"
                                    placeholder="默认当前日期"/>
                        <span class="add-on"><i data-time-icon="fa fa-clock-o" data-date-icon="fa fa-calendar"></i></span>
                    </div>
                </div>

                <c:if test="${op eq '新增' or op eq '修改'}">
                    <div class="control-group col-sm-6 col-md-6 col-lg-6">
                        <label for="file" class="control-label">上传图片</label>
                        <div class="controls">
                            <input id="file" type="file" name="file" class="custom-file-input"/>
                        </div>
                    </div>
                </c:if>

                <div class="clearfix"></div>

                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="isBest" cssClass="control-label">是否精品</form:label>
                    <div class="controls inline-radio">
                        <form:radiobuttons path="isBest" items="${booleanList}" itemLabel="info" itemValue="value" cssClass="validate[required]"/>
                    </div>
                </div>

                <div class="control-group col-sm-6 col-md-6 col-lg-6">
                    <form:label path="isHot" cssClass="control-label">是否热销</form:label>
                    <div class="controls inline-radio">
                        <form:radiobuttons path="isHot" items="${booleanList}" itemLabel="info" cssClass="validate[required]"/>
                    </div>
                </div>

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