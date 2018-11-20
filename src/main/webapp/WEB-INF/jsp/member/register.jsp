<%@ include file="../common/tag.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>會員註冊</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp"%>

<div class="container">
    <form:form id="registerForm" method="post" action="/supersale/register" modelAttribute="member">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>會員註冊</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tbody>
                <tr>
                    <th style="width: 10%">會員名稱</th>
                    <td>
                        <form:input path="name" maxlength="15"/>
                        <form:errors path="name" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>手機號碼</th>
                    <td>
                        <form:input path="phone" maxlength="10"/>
                        <form:errors path="phone" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>
                        <form:input path="email" maxlength="100"/>
                        <form:errors path="email" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>密碼</th>
                    <td>
                        <form:password path="password" maxlength="20"/>
                        <form:errors path="password" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>確認密碼</th>
                    <td>
                        <input type="password" name="confirmPassword" maxlength="20">
                        <span class="error" id="passwordValidate">${passwordValidate}</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="button" class="btn btn-default" onclick="javascript:location.href='/supersale/list'">取消</button>
                        <button type="submit" class="btn btn-warning">註冊</button>
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
    $('#registerForm').validate({
        errorClass: "my-error-class",
        rules: {
            name: {
                required: true
            },
            phone: {
                required: true,
                pattern: /^09\d{8}$/
            },
            email: {
                required: true,
                pattern: /^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$/
            },
            password: {
                required: true,
                pattern: /^(?=.*\d)(?=.*[a-z]).{6,20}$/
            },
            confirmPassword: {
                equalTo: "#password"
            }
        },
        messages: {
            name: "請輸入會員名稱",
            phone: "手機號碼格式不正確",
            email: "email格式不正確",
            password: "密碼需包含英文及數字，且需在6至20字元內",
            confirmPassword: "兩次密碼不相同，請再次輸入"
        }
    })
</script>
</html>