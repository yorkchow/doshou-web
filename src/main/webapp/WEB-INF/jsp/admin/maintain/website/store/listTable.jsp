<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf"%>
<style>
    #table td {
        word-break: break-all;
        word-wrap:break-word;
    }
</style>
<div class="scroll-pane">
    <table id="table" class="sort-table table table-bordered table-hover"
           data-async="true" data-async-callback="callback" data-async-container="panel">
        <thead>
        <tr>
            <th style="width: 80px;">
                <a class="check-all" href="javascript:;">全选</a>
                |
                <a class="reverse-all" href="javascript:;">反选</a>
            </th>
            <th sort="id" style="width: 50px;">编号</th>
            <th style="width: 100px">商铺名称</th>
            <th>商品URL</th>
            <th style="width: 100px">图片URL</th>
            <th style="width: 50px">显示</th>
            <th style="width: 50px">权重</th>
            <th style="width: 80px">创建日期</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="m">
            <tr>
                <td class="check">
                    <input type="checkbox" name="ids" value="${m.id}"/>
                </td>
                <td>${m.id}</td>
                <td>${m.name}</td>
                <td>${m.url}</td>
                <td><img src="${ctx}${m.imgUrl}" title="${m.imgUrl}" width="100" height="100"/></td>
                <td>${m.isShow ? "是" : "否"}</td>
                <td>${m.sortOrder}</td>
                <td><pretty:prettyTime date="${m.addDate}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<doshou:page page="${page}"/>
