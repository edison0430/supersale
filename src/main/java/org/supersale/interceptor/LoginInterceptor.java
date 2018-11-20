package org.supersale.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.supersale.entity.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 檢查用戶是否已登入
 */
public class LoginInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");
        if(member == null) {
            response.sendRedirect("/supersale/list");
            return false;
        }
        return true;
    }
}
