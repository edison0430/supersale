package org.supersale.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.supersale.dao.ProductDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * 檢查商品當前狀態是否可購買，若可以購買才進入結帳作業
 */
public class CheckoutInterceptor implements HandlerInterceptor {

    @Autowired
    private ProductDao productDao;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String[] paths = request.getRequestURI().split("/");
        //paths = /supersale/*/checkoutStep*
        int productId = Integer.parseInt(paths[2]);
        if(!productDao.isPurchasable(productId, new Date())) {
            response.sendRedirect("/supersale/list");
            return false;
        }
        return true;
    }
}
