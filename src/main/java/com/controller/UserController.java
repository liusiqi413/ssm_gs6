package com.controller;

import com.alibaba.fastjson.JSON;
import com.entity.StuUser;
import com.service.UserService;
import com.utils.SystemConstant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
@Resource
    private UserService userService;
    /*
    学生登录
     */
    @ResponseBody
    @RequestMapping("/login")

    public String login(String loginName, String passWord, HttpSession session){
        Map<String,Object> map = new HashMap<String,Object>();
        //调用学生登录的方法
        StuUser loginUser = userService.login(loginName, passWord);
        //判断对象是否为空，不为空表示登录成功
        if(loginUser!=null){
            map.put(SystemConstant.SUCCESS,true);//成功
            loginUser.setPassWord(null);
            session.setAttribute(SystemConstant.FRONT_LOGIN_USER,loginUser);
        }else{
            map.put(SystemConstant.SUCCESS,false);//失败
            map.put(SystemConstant.MESSAGE,"账号密码错误，登录失败");
        }
        return JSON.toJSONString(map);
    }
}
