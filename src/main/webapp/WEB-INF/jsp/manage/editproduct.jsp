<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品修改</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
    <%@ include file="../common/header.jsp"%>

<div class="container">
    <form:form id="productForm" method="post" action="/supersale/manage/product/${product.productId}/edit" modelAttribute="product">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>商品修改</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tbody>
                <tr>
                    <th style="width: 15%" >商品編號</th>
                    <td>
                        ${product.productId}
                    </td>
                </tr>
                <tr>
                    <th>商品名稱</th>
                    <td>
                        <form:input path="name"/>
                        <form:errors path="name" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>可售數量</th>
                    <td>
                        <form:input path="number" autocomplete="off"/>
                        <form:errors path="number" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>單價</th>
                    <td>
                        <form:input path="price" autocomplete="off"/>
                        <form:errors path="price" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>活動開啟時間</th>
                    <td>
                        <%--datetimePicker需要一層position: relatve包住才可以正常作用--%>
                        <div style="position: relative">
                            <form:input path="startTime" autocomplete="off"/>
                            <form:errors path="startTime" cssClass="error"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>活動結束時間</th>
                    <td>
                        <div style="position: relative">
                            <form:input path="endTime" autocomplete="off"/>
                            <form:errors path="endTime" cssClass="error"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="button" class="btn btn-default" onclick="javascript:location.href='/supersale/manage/product'">取消</button>
                        <button type="submit" class="btn btn-warning">修改</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="text-danger" id="updateResult">${updateResult}</span>
                    </td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>
</div>
</form:form>
</body>
<script type="text/javascript">
    $('#productForm').validate({
        errorClass: "my-error-class",
        rules: {
            name : "required",
            number: {
                required: true,
                min: 0,
                max: 999999
            },
            price: {
                required: true,
                money: true
            },
            startTime: {
                required: true,
                date: true
            },
            endTime: {
                required: true,
                date: true
            }
        }
    });

    $('#startTime').datetimepicker({
        format: 'YYYY-MM-DD HH:mm:ss'
    });
    $('#endTime').datetimepicker({
        useCurrent: false, //Important! See issue #1075
        format: 'YYYY-MM-DD HH:mm:ss'
    });
    $("#startTime").on("dp.change", function (e) {
        $('#endTime').data("DateTimePicker").minDate(e.date);
    });
    $("#endTime").on("dp.change", function (e) {
        $('#startTime').data("DateTimePicker").maxDate(e.date);
    });
</script>
</html>
