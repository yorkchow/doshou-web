<%@taglib prefix="dsform" uri="http://www.doshou.me/tags/doshou-form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="searchForm" class="form-inline search-form" data-change-search="true">

    <dsform:label path="search.id_in">编号</dsform:label>
    <dsform:input path="search.id_in" cssClass="input-medium" placeholder="多个使用空格分隔"/>
    &nbsp;&nbsp;

    <dsform:label path="search.username_like">用户名</dsform:label>
    <dsform:input path="search.username_like" cssClass="input-medium" placeholder="模糊匹配"/>
    &nbsp;&nbsp;

    <dsform:label path="search.status_eq">状态</dsform:label>
    <dsform:select path="search.status_eq" cssClass="input-small">
        <dsform:option label="所有" value=""/>
        <dsform:options items="${statusList}" itemLabel="info"/>
    </dsform:select>
    &nbsp;&nbsp;
    <input type="submit" class="btn" value="查询"/>
    <a class="btn btn-link accordion-toggle" data-toggle="collapse" href="#searchMore">高级查询</a>
    <a class="btn btn-link btn-clear-search">清空</a>

    <%--more--%>
    <div id="searchMore" class="accordion-body collapse">
        <div class="accordion-inner">
        <dsform:label path="search.createDate_gte">创建时间从</dsform:label>
        &nbsp;&nbsp;
        <div class="input-append date">
            <dsform:input path="search.createDate_gte" cssClass="input-medium"
                          data-format="yyyy-MM-dd hh:mm:ss"
                          placeholder="大于等于"/>
            <span class="add-on"><i data-time-icon="fa fa-clock-o" data-date-icon="fa fa-calendar"></i></span>
        </div>
        &nbsp;&nbsp;
        <dsform:label path="search.createDate_lte">到</dsform:label>
        &nbsp;&nbsp;
        <div class="input-append date">
            <dsform:input path="search.createDate_lte" cssClass="input-medium"
                          data-format="yyyy-MM-dd hh:mm:ss"
                          data-position="bottom-left"
                          placeholder="小于等于"/>
            <span class="add-on"><i data-time-icon="fa fa-clock-o" data-date-icon="fa fa-calendar"></i></span>
        </div>
    </div>
    </div>
</form>
