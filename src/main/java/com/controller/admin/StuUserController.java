package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.entity.StuUser;
import com.entity.Teacher;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.StuUserService;
import com.utils.DataGridViewResult;
import com.utils.SystemConstant;
import com.vo.StuUserVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/stu")
public class StuUserController {
    @Resource
    private StuUserService stuUserService;
    /*
查询学生基本信息列表
 */
    @RequestMapping("/listUser")
    public DataGridViewResult listUser(StuUserVo stuUserVo){
        //设置分页信息，当前页码，每页显示数量
        PageHelper.startPage(stuUserVo.getPage(),stuUserVo.getLimit());
        //调用分页查询学生信息列表的方法
        List<StuUser> stuUserList=stuUserService.findStuUserList(stuUserVo);
        //创建分页对象
        PageInfo<StuUser> pageInfo=new PageInfo<StuUser>(stuUserList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
    @RequestMapping("/register")
    public String register(StuUser stuUser){
        //创建map集合保存结果信息
        Map<String,Object> map=new HashMap<String, Object>();
        //调用注册的方法
        if(stuUserService.addStuUser(stuUser)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"注册成功！");
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"注册失败！");
        }
        return JSON.toJSONString(map);
    }
    /*
修改学生
*/
    @RequestMapping("/updateStuUser")
    public String updateStuUser(StuUser stuUser){
        Map<String,Object> map=new HashMap<String, Object>();
        if(stuUserService.updateStuUser(stuUser)>0){
            map.put(SystemConstant.SUCCESS,true);//成功
            map.put(SystemConstant.MESSAGE,"修改成功");
        }else{
            map.put(SystemConstant.SUCCESS,false);//失败
            map.put(SystemConstant.MESSAGE,"修改失败");
        }
        //将map集合以JSON格式返回
        return JSON.toJSONString(map);
    }
    /*
    删除学生账户
     */
    @RequestMapping("/deleteStuUserById")
    public String deleteStuUserById(int id){
        Map<String,Object> map=new HashMap<String, Object>();
        if(stuUserService.deleteStuUserById(id)>0){
            map.put("success",true);
            map.put("message","删除成功");
        }else{
            map.put("success",false);
            map.put("message","删除失败");
        }
        return JSON.toJSONString(map);
        }
    @RequestMapping("/checkName")
    public String checkName(String loginName){
        //创建map集合保存结果信息
        Map<String,Object> map=new HashMap<String, Object>();
        //调用注册的方法
        if(stuUserService.findStuUserByName(loginName)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"用户名已被占用，请重新输入！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }
    }
