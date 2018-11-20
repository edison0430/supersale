<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品管理</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp"%>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>商品管理</h2>
        </div>
        <div class="panel-body">
            <a class="btn btn-warning pull-right" href="/supersale/manage/product/create">新增</a>
            <%--<button type="button" class="btn btn-warning btn-lg pull-right">新增</button>--%>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>商品編號</th>
                    <th>商品名稱</th>
                    <th>可售數量</th>
                    <th>單價</th>
                    <th>活動開啟時間</th>
                    <th>活動結束時間</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${productList}">
                    <tr>
                        <td>${product.productId}</td>
                        <td>${product.name}</td>
                        <td>${product.number}</td>
                        <td>$<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}"/></td>
                        <td><fmt:formatDate value="${product.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        <td><fmt:formatDate value="${product.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        <td><a class="btn btn-primary" href="/supersale/manage/product/${product.productId}/edit">編輯</a></td>
                        <td> <a class="btn btn-danger" href="/supersale/manage/product/${product.productId}/delete" onclick="return confirm('你確定要刪除${product.name}嗎');">刪除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
