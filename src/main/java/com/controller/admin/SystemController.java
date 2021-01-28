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

@RequestMapping("/index")
public String index(){
        return "admin/index";
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
    @RequestMapping("/reset")
    public String reset(){
        return "admin/reset";
    }
    /*
    去到学生管理页面
    @return
     */
    @RequestMapping("toStuManager")
public String toStuManager(){
return "admin/stu/stuManager";
}
    /*
       去到学生生源地管理页面
       @return
        */
    @RequestMapping("toStuHome")
    public String toStuHomeManager(){
        return "admin/stu/stuHome";
    }
    /*
       去到学生就业信息管理页面
       @return
        */
    @RequestMapping("toStuEmp")
    public String toStuEmpManager(){
        return "admin/stu/stuEmp";
    }
    /*
    去到考研学生管理页面
     */
    @RequestMapping("toStuMaster")
    public String toStuMasterManager(){
        return "admin/stu/stuMaster";
    }
    /*
    角色管理
     */
    @RequestMapping("toRoleManager")
    public String toRoleManager(){
        return "admin/role/roleManager";
    }
    /*
    老师管理
     */
    @RequestMapping("toTeacherManager")
    public String toTeacherManager(){
        return "admin/teacher/teacherManager";
    }
    /*
    去到学生登录导入
     */
    @RequestMapping("toStuLogin")
    public String toStuLogin(){
        return "admin/stu/stuLogin";
    }
    /*
    去到招聘页面
     */
    @RequestMapping("toHireManager")
    public String toHireManagern(){
        return "admin/hire/hireEmploy";
    }
}
