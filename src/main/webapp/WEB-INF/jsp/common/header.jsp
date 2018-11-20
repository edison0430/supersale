<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/supersale/list">搶購網</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/supersale/list">現正搶購</a></li>
            <li><a href="/supersale/upcominglist">搶購預告</a></li>
            <c:if test="${sessionScope.member.admin}">
                <li><a href="/supersale/manage/product">商品管理</a></li>
            </c:if>
        </ul>

        <ul class="nav navbar-nav navbar-right">

            <c:choose>
                <c:when test="${sessionScope.member == null}">
                    <li><a href="/supersale/register"><span class="glyphicon glyphicon-user"></span> 註冊</a></li>
                    <li><a href='javascript: supersale.login();'><span class="glyphicon glyphicon-log-in"></span> 登入</a></li>
                </c:when>
                <c:otherwise>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">${sessionScope.member.name} 帳戶管理
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/supersale/member/edit">修改會員資料</a></li>
                            <li><a href="/supersale/member/changePassword">修改密碼</a></li>
                            <li><a href="/supersale/orderinquiry">查詢訂單</a></li>
                        </ul>
                    </li>
                    <li><a href="/supersale/logout"><span class="glyphicon glyphicon-log-out"></span> 登出</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>

<!-- 登入Modal -->
<div id="loginModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="padding:35px 50px;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title text-center"><span class="glyphicon glyphicon-lock"></span> 會員登入</h3>
            </div>
            <div class="modal-body" style="padding:40px 50px;">
                <div class="row">
                    <div class="form-group">
                        <label for="loginEmail"><span class="glyphicon glyphicon-user"></span> 帳號：</label>
                        <input type="text" class="form-control" id="loginEmail" placeholder="輸入信箱">
                    </div>
                    <div class="form-group">
                        <label for="loginPassword"><span class="glyphicon glyphicon-eye-open"></span> 密碼：</label>
                        <input type="password" class="form-control" id="loginPassword" placeholder="輸入密碼">
                    </div>
                    <h5><span id="loginMessage"></span></h5>
                    <button type="button" id="loginBtn" class="btn btn-success btn-block">登入</button>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 取消</button>
                <p>還不是會員嗎? <a href="/supersale/register">註冊</a></p>
            </div>
        </div>
    </div>
</div>


