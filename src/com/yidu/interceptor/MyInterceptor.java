package com.yidu.interceptor;

import com.yidu.bean.UserInfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author XiongAiWen
 * @version 1.0
 * @description: 拦截器
 * @data 2020/12/30 18:43
 */
public class MyInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
        String servletPath = request.getServletPath();
        //System.out.println("servletPath = " + servletPath);
        if(userInfo!=null){
            //判断是否进的是查询方法
           /* if(servletPath.equals("/menu_selectMenu")){

            }*/
            return true;
        }else{
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
