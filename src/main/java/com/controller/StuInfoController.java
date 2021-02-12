package com.controller;

import com.alibaba.fastjson.JSON;
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
/*
添加信息
 */
    @RequestMapping("/updateInfo")
    public String updateInfo(Student student){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用添加学生的方法
        if(stuService.updateInfo(student)>0){
            map.put(SystemConstant.SUCCESS,true);//成功
            map.put(SystemConstant.MESSAGE,"提交成功");
        }else{
            map.put(SystemConstant.SUCCESS,false);//失败
            map.put(SystemConstant.MESSAGE,"提交失败");
        }
        //将map集合以JSON格式返回
        return JSON.toJSONString(map);
    }
}