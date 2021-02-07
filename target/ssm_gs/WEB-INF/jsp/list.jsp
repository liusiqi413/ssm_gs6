<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/front/css/store.css" charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>招聘公告</title>
</head>
<body>
<div class="tb">
    <table width="1000">
        <tr>
<%--            <th scope="col">ID</th>--%>
            <th>招聘公告名称</th>
            <th class="hireTime">发布时间</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="hire">
            <tr>
<%--                <td>${hire.id}</td>--%>
                <td><a href="/company/${hire.id}.html"> <h2 class="boardCast">${hire.boardCast}</h2 class="board"></a></td>
    <td><h2 class="hireTimes"><fmt:formatDate value="${hire.times}" pattern="yyyy-MM-dd  HH:mm:ss"/></h2></td>

            </tr>
        </c:forEach>
    </table>
</div>
    <p>当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
        页,总 ${pageInfo.total } 条记录</div></p>
    <c:if test="${pageInfo.hasPreviousPage }">
        <a href="list?pageNo=${pageInfo.pageNum-1}">上一页</a>
    </c:if>

    <c:if test="${pageInfo.hasNextPage }">
        <a href="list?pageNo=${pageInfo.pageNum+1}">下一页</a>
    </c:if>
</body>
</html>
