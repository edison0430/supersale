<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>搶購列表</title>
    <%@ include file="common/head.jsp"%>

</head>
<body>
    <%@ include file="common/header.jsp"%>

    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading text-center">
                <h2>搶購列表</h2>
            </div>
            <div class="panel-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width: 20%;">名稱</th>
                            <th>庫存</th>
                            <th>價錢</th>
                            <th>活動剩餘時間</th>
                            <th>搶購連結</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${list}">
                            <tr>
                                <td>${product.name}</td>
                                <td><span class="badge">${product.number}</span></td>
                                <td>$<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}"/></td>
                                <th><div class="text-danger" data-countdown="<fmt:formatDate value="${product.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"></div></th>
                                <td><a class="btn btn-danger" href="javascript: supersale.purchase('${product.productId}')" onclick="">立即搶購</a> </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <c:if test="${error != null && error != ''}">
        <script>
            alert('${error}');
        </script>
    </c:if>
</body>
<script type="text/javascript">
    $('[data-countdown]').each(function(){
        var $this = $(this), finalDate = $(this).data('countdown');
        $this.countdown(finalDate, function (event) {
            $this.html(event.strftime('%D 天 %H:%M:%S'));
        })
    })
</script>

</html>