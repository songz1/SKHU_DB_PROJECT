package skhu.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class Intercepter implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	HttpSession session = request.getSession();

    	if(request.getRequestURI().startsWith("/admin")) {
    		if(session.getAttribute("adminInfo") == null) {
    			response.sendRedirect("/admin/login/login");
    			return false;
    		}
    	}

    	else {
    		if(session.getAttribute("userInfo") == null) {
    			response.sendRedirect("/user/login/login");
    			return false;
    		}
    	}

    	return true;
    }
}