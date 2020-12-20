package com.controller.admin;

import com.utils.SystemConstant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


/**
 * 负责跳转页面(后台管理页面)
 */
@Controller
@RequestMapping("/admin")
public class SystemController {


    /**
     * 去到登录页面
     * @return
     */
    @RequestMapping("/login.html")
    public String login(){
        return "admin/login";
    }


    /**
     * 去到后台首页
     * @return
     */
    @RequestMapping("/home.html")
    public String home(){
        return "admin/home";
    }


    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        //清空session
        session.removeAttribute(SystemConstant.LOGINUSER);
        //session.invalidate();
        //重定向到登录页面
        return "redirect:/admin/login.html";
    }

}
