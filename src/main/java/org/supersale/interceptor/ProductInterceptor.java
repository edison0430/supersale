package org.supersale.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.supersale.entity.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 檢查使用者是否有管理權限，若有才可執行商品管理相關功能
 */
public class ProductInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");
        if(!member.getAdmin()) {
            response.sendRedirect("/supersale/list");
            return false;
        }
        return true;
    }
}
