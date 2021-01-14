package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.entity.StuUser;
import com.entity.Student;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.StuUserService;
import com.utils.DataGridViewResult;
import com.utils.SystemConstant;
import com.vo.StuUserVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/student")
public class UserController {
    @Resource
    private StuUserService stuUserService;
    /*
    学生登录
     */
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session){
        Map<String,Object> map = new HashMap<String,Object>();
        //调用学生登录的方法
        StuUser stuUser = stuUserService.login(username, password);
        //判断对象是否为空，不为空表示登录成功
        if(stuUser!=null){
            //保存当前登录用户
            session.setAttribute(SystemConstant.LOGINUSER,stuUser);
            map.put(SystemConstant.SUCCESS,true);//成功
        }else{
            map.put(SystemConstant.SUCCESS,false);//失败
            map.put(SystemConstant.MESSAGE,"账号密码错误，登录失败");
        }
        return JSON.toJSONString(map);
    }
    /*
查询学生基本信息列表
 */
    @RequestMapping("/list")
    public DataGridViewResult list(StuUserVo stuUserVo){
        //设置分页信息，当前页码，每页显示数量
        PageHelper.startPage(stuUserVo.getPage(),stuUserVo.getLimit());
        //调用分页查询学生信息列表的方法
        List<StuUser> stuUserList=stuUserService.findStuUserList(stuUserVo);
        //创建分页对象
        PageInfo<StuUser> pageInfo=new PageInfo<StuUser>(stuUserList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
}
