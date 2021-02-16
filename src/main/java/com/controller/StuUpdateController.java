package com.controller;

import com.dao.StuInfoMapper;
import com.entity.StuEmp;
import com.entity.StuUser;
import com.entity.Student;
import com.service.StuInfoService;
import com.service.StuService;
import com.utils.SystemConstant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StuUpdateController {
    @Resource
    private StuService stuService;
    @Resource
    private StuInfoService stuInfoService;
    @RequestMapping("/edit.html")
    public String Index(Model model, HttpSession session){
        StuUser stuUser=(StuUser)session.getAttribute(SystemConstant.FRONT_LOGIN_USER);
        //调用查询学生信息列表
        List<Student> stuList=stuService.findStuByStuno(stuUser.getLoginName());
        //调用查询学生就业信息列表
        List<StuEmp> stuEmpList=stuInfoService.findStuEmpByStuno(stuUser.getLoginName());
        //将数据放进模型中
        model.addAttribute("stuList",stuList);
        model.addAttribute("stuEmpList",stuEmpList);
        return "forward:edit.jsp";
    }
}
