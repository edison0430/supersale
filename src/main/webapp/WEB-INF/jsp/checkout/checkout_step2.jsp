<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../common/tag.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搶購結帳</title>
    <%@ include file="../common/head.jsp" %>
    <style>
        .my-error-class {
            color: red;
        }

        .my-valid-class {
            color: green;
        }

        span.error {
            color: red;
        }
    </style>

</head>
<body>
<%@ include file="../common/header.jsp" %>

<div class="container">
    <form:form id="detailForm" method="post" action="/supersale/${productId}/checkoutStep3"
               modelAttribute="shoppingOrder">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>2.填寫資料</h2>
        </div>
        <div class="panel-body">
            <c:set var="sum" value="${shoppingOrder.number * shoppingOrder.price}"/>
            <h3 class="text-right">
                本次消費總計<span style="color:#FF0000">$<fmt:formatNumber type="number" maxFractionDigits="3"
                                                                     value="${sum}"/></span>元
            </h3>
                <%-- 信用卡 --%>
            <c:if test="${shoppingOrder.payment == 'CreditCard'}">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="text-primary">信用卡付款資料</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th style="width: 12%">信用卡卡號</th>
                        <td>
                            <input type="text" name="cardNumber1" id="cardNumber1" size="4" maxlength="4"
                                   onkeyup="moveFocus('cardNumber1', 'cardNumber2')"> -
                            <input type="text" name="cardNumber2" id="cardNumber2" size="4" maxlength="4"
                                   onkeyup="moveFocus('cardNumber2', 'cardNumber3')"> -
                            <input type="text" name="cardNumber3" id="cardNumber3" size="4" maxlength="4"
                                   onkeyup="moveFocus('cardNumber3', 'cardNumber4')"> -
                            <input type="text" name="cardNumber4" id="cardNumber4" size="4" maxlength="4">
                        </td>
                    </tr>
                    <tr>
                        <th>有效期限</th>
                        <td>
                            <select id="cardExpireMonth" name="cardExpireMonth">
                                <option value="">請選擇</option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            月
                            <select id="cardExpireYear" name="cardExpireYear">
                                <option value="">請選擇</option>
                                <option value="2018">2018</option>
                                <option value="2019">2019</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                            </select>
                            年
                        </td>
                    </tr>
                    <tr>
                        <th>
                            卡片背面後3碼
                        </th>
                        <td>
                            <input type="text" name="cardCheckCode" id="cardCheckCode" size="3" maxlength="3"
                                   autocomplete="off">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </c:if>

                <%-- 訂購人 --%>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="text-primary">訂購人資料</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th style="width: 12%">姓名</th>
                    <td>
                        <form:input path="buyerName" value="${member.name}"/>
                        <form:errors path="buyerName" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>手機號碼</th>
                    <td>
                        <form:input path="buyerPhone" value="${member.phone}"/>
                        <form:errors path="buyerPhone" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>住址</th>
                    <td>
                        <form:input path="buyerAddress" value="${member.address}"/>
                        <form:errors path="buyerAddress" cssClass="error"/>
                    </td>
                </tr>
                </tbody>
            </table>

                <%-- 收件人 --%>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="text-primary">收件人資料</th>
                    <td>
                        <input type="checkbox" value="">同購買人資料
                    </td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th style="width: 12%">姓名</th>
                    <td>
                        <form:input path="receiverName" class="required"/>
                        <form:errors path="receiverName" cssClass="error"/>

                    </td>
                </tr>
                <tr>
                    <th>手機號碼</th>
                    <td>
                        <form:input path="receiverPhone"/>
                        <form:errors path="receiverPhone" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>住址</th>
                    <td>
                        <form:input path="receiverAddress"/>
                        <form:errors path="receiverAddress" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        備注
                    </th>
                    <td>
                        <form:textarea path="remark" class="form-control"></form:textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <button type="button" class="btn btn-default" onclick="javascript:history.back()">上一頁</button>
                        <button type="submit" class="btn btn-warning">下一步</button>
                    </td>
                </tr>
                </tbody>
            </table>
            <!-- 為了讓值傳入下個頁面 -->
            <form:hidden path="productName"/>
            <form:hidden path="number"/>
            <form:hidden path="price"/>
            <form:hidden path="payment"/>
            <form:hidden path="memberId" value="${member.memberId}"/>
        </div>
    </div>
</div>
</form:form>
</body>
<script type="text/javascript">
    $('input:checkbox').change(function () {
        if ($(this).prop('checked')) {
            console.log('有勾選');
            var buyerName = $('#buyerName').val();
            var buyerPhone = $('#buyerPhone').val();
            var buyerAddress = $('#buyerAddress').val();

            $('#receiverName').val(buyerName);
            $('#receiverPhone').val(buyerPhone);
            $('#receiverAddress').val(buyerAddress);
        } else {
            console.log('沒勾選');
        }
    })

    $(function () {
        $('#detailForm').validate({
            errorClass: "my-error-class",
            groups: {
                cardNumberGroup: "cardNumber1 cardNumber2 cardNumber3 cardNumber4",
                cardExpireGroup: "cardExpireMonth cardExpireYear"
            },
            errorPlacement: function (error, element) {  //錯誤顯示在cardNumber4後面
                if (element.attr("name") == "cardNumber1" || element.attr("name") == "cardNumber2" || element.attr("name") == "cardNumber3" || element.attr("name") == "cardNumber4") {
                    error.insertAfter("#cardNumber4");
                } else if (element.attr("name") == "cardExpireMonth" || element.attr("name") == "cardExpireYear") {
                    error.insertAfter("#cardExpireYear");
                } else {
                    error.insertAfter(element);
                }
            },
            rules: {
                cardNumber1: {
                    required: true,
                    digits: true,
                    minlength: 4
                },
                cardNumber2: {
                    required: true,
                    digits: true,
                    minlength: 4
                },
                cardNumber3: {
                    required: true,
                    digits: true,
                    minlength: 4
                },
                cardNumber4: {
                    required: true,
                    digits: true,
                    minlength: 4
                },
                cardExpireMonth: {
                    required: true
                },
                cardExpireYear: {
                    required: true
                },
                cardCheckCode: {
                    required: true,
                    digits: true,
                    minlength: 3
                },
                buyerName: "required",
                buyerPhone: "required",
                buyerAddress: "required",
                receiverName: "required",
                receiverPhone: "required",
                receiverAddress: "required"
            },
            messages: {
                cardNumber1: "請輸入信用卡卡號",
                cardNumber2: "請輸入信用卡卡號",
                cardNumber3: "請輸入信用卡卡號",
                cardNumber4: "請輸入信用卡卡號",
                cardCheckCode: "請輸入卡片背面後3碼"
            }
        });
    });

    function moveFocus(currentInput, nextInput) {
        var len = $('#' + currentInput).val().length;
        if (len == 4) {
            $('#' + nextInput).focus();
        }
    }
</script>
</html>
