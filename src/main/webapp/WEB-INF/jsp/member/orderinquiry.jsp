<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>訂單查詢</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp"%>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>訂單查詢</h2>
        </div>
        <div class="panel-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>訂單編號</th>
                    <th>訂購日期</th>
                    <th>付款方式</th>
                    <th>商品名稱</th>
                    <th>消費金額</th>
                    <th>收件人資訊</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orderList}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        <td>${order.payment == "CASH" ? "現金" : "信用卡"}</td>
                        <td>${order.productName}</td>
                        <td>$<fmt:formatNumber type="number" maxFractionDigits="3" value="${order.price * order.number}"/></td>
                        <td><button type="button" id="getOrderDetailButton" class="btn btn-info" orderId="${order.orderId}">點我看詳細資料</button> </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%-- 收貨人等詳細資訊 --%>
<div id="orderDetailModal" class="modal fade" role="dialog">
    <div class="modal-dialog .modal-dialog-centered" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title text-center">收件人資訊</h3>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td style="width: 25%">訂單編號</td>
                        <td id="orderId"></td>
                    </tr>
                    <tr>
                        <td>收貨人姓名</td>
                        <td id="receiverName"></td>
                    </tr>
                    <tr>
                        <td>收貨人電話</td>
                        <td id="receiverPhone"></td>
                    </tr>
                    <tr>
                        <td>收貨人地址</td>
                        <td id="receiverAddress"></td>
                    </tr>
                    <tr>
                        <td>備注</td>
                        <td id="remark"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger btn-default " data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 關閉</button>
            </div>
        </div>
    </div>
</div>

</body>

<script>
    $("table .btn").click(function () {
        supersale.getOrderDetail($(this).attr("orderId"));
        $("#orderDetailModal").modal({
            show: true
        })
    })
</script>
</html>
