<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>訂購完成</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp"%>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>3.訂購完成!</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tbody>
                <tr>
                    <th style="width: 15%">訂單編號</th>
                    <td>
                        ${shoppingOrder.orderId}
                    </td>
                </tr>
                <tr>
                    <th>商品名稱</th>
                    <td>
                        ${shoppingOrder.productName}
                    </td>
                </tr>
                <tr>
                    <th>總價</th>
                    <td>
                        $<fmt:formatNumber type="number" maxFractionDigits="3" value="${shoppingOrder.price * shoppingOrder.number}"/>
                    </td>
                </tr>
                <tr>
                    <th>收件人姓名</th>
                    <td>
                        ${shoppingOrder.buyerName}
                    </td>
                </tr>
                <tr>
                    <th>收件人電話</th>
                    <td>
                        ${shoppingOrder.buyerPhone}
                    </td>
                </tr>
                <tr>
                    <th>收件人地址</th>
                    <td>
                        ${shoppingOrder.buyerAddress}
                    </td>
                </tr>
                <tr>
                    <th>付款方式</th>
                    <td>
                        ${shoppingOrder.payment == "CASH" ? "現金" : "信用卡"}
                    </td>
                </tr>
                <tr>
                    <th>訂單建立日期</th>
                    <td>
                        <fmt:formatDate value="${shoppingOrder.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="button" class="btn btn-warning" onclick="javascript:location.href='/supersale/list'">回首頁</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
