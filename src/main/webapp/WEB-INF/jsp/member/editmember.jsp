<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>會員資料修改</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>
    <%@ include file="../common/header.jsp"%>

<div class="container">
    <form:form id="editForm" method="post" action="/supersale/member/edit" modelAttribute="member">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>會員資料修改</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tbody>
                <tr>
                    <th style="width: 10%" >會員名稱</th>
                    <td>
                        <form:input path="name" value="${sessionScope.member.name}"/>
                        <form:errors path="name" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>性別</th>
                    <td>
                        <form:radiobutton path="gender" value="男" label="男" checked="${sessionScope.member.gender == '男' ? 'checked' : ''}"/>
                        <form:radiobutton path="gender" value="女" label="女" checked="${sessionScope.member.gender == '女' ? 'checked' : ''}"/>
                    </td>
                </tr>
                <tr>
                    <th>手機號碼</th>
                    <td>
                        <form:input path="phone" value="${sessionScope.member.phone}"/>
                        <form:errors path="phone" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <th>住址</th>
                    <td>
                        <form:input path="address" size="40"  value="${sessionScope.member.address}"/>
                    </td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>
                        <form:input path="email" value="${sessionScope.member.email}"/>
                        <form:errors path="email" cssClass="error"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="button" class="btn btn-default" onclick="javascript:location.href='/supersale/list'">取消</button>
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
            <%--<form:hidden path="memberId" value="${sessionScope.member.memberId}"/>--%>
            <input type="hidden" name="memberId" value="${sessionScope.member.memberId}">
            <input type="hidden" name="originalEmail" value="${sessionScope.member.email}">

        </div>
    </div>
</div>
</form:form>
</body>
<script type="text/javascript">
    $('#editForm').validate({
        errorClass: "my-error-class",
        rules: {
            name: "required",
            phone: {
                required: true,
                pattern: /^09\d{8}$/
            },
            email: {
                required: true,
                pattern: /^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$/
            },
        },
        messages: {
            name: "請輸入會員名稱",
            phone: "手機號碼格式不正確",
            email: "email格式不正確",
        }
    })
</script>
</html>
