<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>搶購預告</title>
    <%@ include file="common/head.jsp"%>

</head>
<body>
    <%@ include file="common/header.jsp"%>

    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading text-center">
                <h2>搶購預告</h2>
            </div>
            <div class="panel-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width: 20%;">名稱</th>
                            <th>庫存</th>
                            <th>價錢</th>
                            <th>活動開始時間</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${list}">
                            <tr>
                                <td>${product.name}</td>
                                <td><span class="badge">${product.number}</span></td>
                                <td>$<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}"/></td>
                                <td><fmt:formatDate value="${product.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>



    <%--<!-- 輸入電話的登入div -->--%>
    <%--<div id="loginModal" class="modal fade" role="dialog">--%>
        <%--<div class="modal-dialog">--%>
            <%--<div class="modal-content">--%>
                <%--&lt;%&ndash;<div class="modal-header">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<h5 class="modal-title text-center">會員登入</h5>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<button type="button" class="close" data-dismiss="modal" aria-label="Close">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span aria-hidden="true">&times;</span>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--<div class="modal-header" style="padding:35px 50px;">--%>
                        <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                        <%--<h3 class="modal-title text-center"><span class="glyphicon glyphicon-lock"></span> 會員登入</h3>--%>
                    <%--</div>--%>
                <%--<div class="modal-body" style="padding:40px 50px;">--%>
                    <%--<div class="row">--%>
                        <%--<div class="form-group">--%>
                            <%--<label for="loginEmail"><span class="glyphicon glyphicon-user"></span> 帳號：</label>--%>
                            <%--<input type="text" class="form-control" id="loginEmail" placeholder="輸入信箱">--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<label for="loginPassword"><span class="glyphicon glyphicon-eye-open"></span> 密碼：</label>--%>
                            <%--<input type="password" class="form-control" id="loginPassword" placeholder="輸入密碼">--%>
                        <%--</div>--%>
                        <%--&lt;%&ndash;<div class="col-xs-8 col-xs-offset-2">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<input type="text" name="loginEmail" id="loginEmail" placeholder="輸入信箱" class="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="col-xs-8 col-xs-offset-2">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<input type="password" name="loginPassword" id="loginPassword" placeholder="輸入密碼" class="form-control"/>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--<h5><span id="userPhoneMessage" class="glyphicon"></span></h5>--%>
                        <%--<button type="button" id="loginBtn" class="btn btn-success btn-block">登入</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="modal-footer">--%>
                    <%--<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 取消</button>--%>
                    <%--<p>還不是會員嗎? <a href="/supersale/register">註冊</a></p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

</body>


<script type="text/javascript">
    <%--$(function () {--%>
    <%--//使用EL表達式傳入參數--%>
    <%--supersale.detail.init({--%>
    <%--superSaleId : ${superSale.superSaleId},--%>

    <%--startTime : ${superSale.startTime.time}, //getTime()取得毫秒--%>
    <%--endTime : ${superSale.endTime.time}--%>
    <%--});--%>
    <%--}),--%>
    <%--$(function (userName) {--%>
    <%--var userName = '${sessionScope.member.name}';--%>
    <%--console.log(userName);--%>
    <%--if(userName == null) {--%>
    <%--supersale.login(userName);--%>
    <%--}--%>
    <%--}),--%>



    $('[data-countdown]').each(function(){
        var $this = $(this), finalDate = $(this).data('countdown');
        $this.countdown(finalDate, function (event) {
            $this.html(event.strftime('%D 天 %H:%M:%S'));
        })
    })

</script>

</html>