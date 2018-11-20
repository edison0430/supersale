var supersale ={
    //封裝搶購相關AJAX的URL
    URL : {
        login: function() {
            return '/supersale/login';
        },
        sellingList: function () {
            return '/supersale/list';
        },
        orderDetail: function (orderId) {
            return '/supersale/order/' + orderId;
        },
        checkout: function (productId) {
            return '/supersale/' + productId + '/checkoutStep1';
        }
    },
    login : function(){
        $('#loginModal').modal({
            show: true, //顯示彈出層
            backdrop : 'static' //禁止點選背景
        });
        $('#loginBtn').click(function () {
            $.post(supersale.URL.login(), {
                email: $('#loginEmail').val(),
                password: $('#loginPassword').val()
            }, function (result) {
                if (result && result['success']) {
                    window.location.href = supersale.URL.sellingList();
                } else {
                    $('#loginMessage').hide().html('<label class="label label-danger">帳號或密碼錯誤</label>').show(300);
                }
            });
        })
    },
    purchase : function(productId) {
        $.get('/supersale/isLogin', function (result) {
            if(result.isLogin) {
                window.location.href = supersale.URL.checkout(productId);
            } else {
                supersale.login();
            }
        })

    },
    getOrderDetail: function (orderId) {
        $.get(supersale.URL.orderDetail(orderId), function (result) {
            console.log(result);
            $('#orderId').html(result.orderId);
            $('#receiverName').html(result.buyerName);
            $('#receiverPhone').html(result.receiverPhone);
            $('#receiverAddress').html(result.receiverAddress);
            $('#remark').html(result.remark);
        })
    }
};

$.validator.addMethod(
    "date",
    function (value, element) {
        //yyyy-MM-dd HH:mm:ss
        return value.match(/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1]) ([0-1][0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$/);
    },
    "請輸入活動時間(例:2018-10-23 21:00:00)"
);

$.validator.addMethod(
    "money",
    function (value, element) {
        return value.match(/^(\d{1,9}|\d{1,3},\d{1,3}|\d{1,3},\d{1,3},\d{1,3})$/);
    },
    "請輸入0 ~ 999999999"
);