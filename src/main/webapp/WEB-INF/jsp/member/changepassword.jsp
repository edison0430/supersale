<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp"%>
<html>
<head>
    <title>變更密碼</title>
    <%@ include file="../common/head.jsp" %>
</head>
<body>


<div class="container">
    <form:form method="post" action="/supersale/member/changePassword">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>變更密碼</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tbody>
                <tr>
                    <th style="width: 10%" >舊密碼</th>
                    <td>
                        <input type="password" name="oldPassword">
                        <span class="text-danger" id="oldPasswordValidate">*${oldPasswordValidate}</span>
                    </td>
                </tr>
                <tr>
                    <th>新密碼</th>
                    <td>
                        <input type="password" name="newPassword">
                        <span class="text-danger" id="newPasswordValidate">*${newPasswordValidate}</span>
                    </td>
                </tr>
                <tr>
                    <th>確認新密碼</th>
                    <td>
                        <input type="password" name="confirmPassword">
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
                        <span class="text-danger" id="result">${result}</span>
                    </td>
                </tr>
                </tbody>
            </table>
            <input type="hidden" name="memberId" value="${sessionScope.member.memberId}">

        </div>
    </div>
</div>
</form:form>
</body>
</body>
</html>
