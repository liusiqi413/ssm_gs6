package com.controller;

import com.entity.StuUser;
import com.entity.Student;
import com.service.StuService;
import com.utils.SystemConstant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StuInfoController {
    @Resource
    private StuService stuService;
    @RequestMapping("/info.html")
    public String Index(Model model, HttpSession session){
        StuUser stuUser=(StuUser)session.getAttribute(SystemConstant.FRONT_LOGIN_USER);
        //调用查询学生信息列表
        List<Student> stuList=stuService.findStuByStuno(stuUser.getLoginName());
        //将数据放进模型中
        model.addAttribute("stuList",stuList);
        return "forward:info.jsp";
    }
}