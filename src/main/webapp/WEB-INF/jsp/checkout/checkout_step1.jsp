<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搶購結帳</title>
    <%@ include file="../common/head.jsp" %>

</head>
<body>
<%@ include file="../common/header.jsp"%>

<div class="container">
    <form:form method="post" action="/supersale/${productId}/checkoutStep2" modelAttribute="shoppingOrder">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>1.選擇數量及付款方式</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th style="width: 40%">商品名稱</th>
                    <th style="width: 20%">數量</th>
                    <th style="width: 20%">單價</th>
                    <th style="width: 20%">總計</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <!-- 這邊設hidden是為了能讓值傳到下個頁面 -->
                        <form:hidden path="productName"/>
                        ${shoppingOrder.productName}
                    </td>
                    <td>
                        <form:select path = "number" items="${numberList}"/>
                    </td>
                    <td>
                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${shoppingOrder.price}"/>
                        <form:hidden path="price"/>
                    </td>
                    <td>
                        <div id="sum" class="text-danger">
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${shoppingOrder.price}"/>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

            <!-- 收件人 -->
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="text-primary">請選擇付款方式</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <label class="radio-inline"><form:radiobutton path="payment" value="CASH" label="現金" checked="${member.gender == 'CASH' ? 'checked' : ''}" class="required"/></label>
                        <label class="radio-inline"><form:radiobutton path="payment" value="CreditCard" label="信用卡" checked="${member.gender == 'CreditCard' ? 'checked' : ''}"/></label>
                        <form:errors path="payment" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <button type="button" class="btn btn-default" onclick="javascript:history.back()">上一頁</button>
                        <button type="submit" class="btn btn-warning">下一步</button>
                    </td>

                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</form:form>

<c:if test="${error != null && error != ''}">
    <script>
        alert('${error}, 剩於${numberList.size()}組');
    </script>
</c:if>
</body>
<script type="text/javascript">
    //解決radio的驗證訊息在錯誤的位置
    $(function () {
        $('form').validate({
            errorClass: "my-error-class",
            errorPlacement: function (error, element) {
                if (element.is(':radio') || element.is(':checkbox')) {
                    var eid = element.attr('name');
                    $('input[name=' + eid + ']:last').next().after(error);
                } else {
                    error.insertAfter(element);
                }
            }
        });
    });

    $('select').on('change', function() {
        var price = $('#price').val();
        var number = $(this).find(':selected').val();
        var sum = numeral(price * number).format('0,0');
        $('#sum').text(sum);
    });
</script>
</html>
