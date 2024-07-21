package kr.ddit.kixiv.intercepter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CommonInterceptor extends HandlerInterceptorAdapter {

	protected Log log = LogFactory.getLog(CommonInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		//String webRoot = request.getContextPath();
		String user_id = (String) session.getAttribute("userId");
		boolean flag = false;
		
		try {
        	if (user_id == null || user_id.equals("")) {
                if (isAjaxRequest(request)){
                    response.sendError(-1);
                    return false;
                } else {
                    response.sendRedirect("/login");
//                    response.sendRedirect(webRoot + "/login.jsp");
                    flag = false;
                }
            } else {
                flag = true;
            }
        } catch (Exception e) {
            return false;
        }

		    log.info("> " + user_id + ": " + request.getRequestURI());
        return flag;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("<\n");
		
	}

	
	private boolean isAjaxRequest(HttpServletRequest req) {
        String header = req.getHeader("AJAX");
        if ("true".equals(header)) {
        	 return true;
         } else {
        	 return false;
        }
	}




}
