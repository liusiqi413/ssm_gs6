package com.controller;


import com.alibaba.fastjson.JSON;
import com.entity.StuEmp;
import com.entity.StuMaster;
import com.entity.Student;
import com.service.StuInfoService;
import com.utils.SystemConstant;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@RestController
public class StuInfoManagerController {
    /*
添加信息
*/
    @Resource
    private StuInfoService stuInfoService;

    @RequestMapping("/checkStuInfo")
    public String checkStuInfo(Student student){
        //创建map集合保存结果信息
        Map<String,Object> map=new HashMap<String, Object>();
        //调用注册的方法
        if(stuInfoService.findStuInfoByName(student)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"您已经提交过，如需修改，请前往修改页面！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/updateInfo")
    public String updateInfo(Student student) {
        Map<String, Object> map = new HashMap<String, Object>();
        //调用添加学生的方法
        if (stuInfoService.updateInfo(student) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "提交成功");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "提交失败");
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/addEmp")
    public String addEmp(StuEmp stuEmp) {
        Map<String, Object> map = new HashMap<String, Object>();
        //调用添加学生的方法
        if (stuInfoService.addEmp(stuEmp) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "提交成功");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "提交失败");
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/checkEmp")
    public String checkEmp(StuEmp stuEmp){
        //创建map集合保存结果信息
        Map<String,Object> map=new HashMap<String, Object>();
        //调用注册的方法
        if(stuInfoService.findStuEmpByName(stuEmp)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"您已经提交过，如需修改，请前往修改页面！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/checkMaster")
    public String checkMaster(StuMaster stuMaster){
        //创建map集合保存结果信息
        Map<String,Object> map=new HashMap<String, Object>();
        //调用注册的方法
        if(stuInfoService.findStuMasterByName(stuMaster)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"您已经提交过，如需修改，请前往修改页面！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/addMaster")
    public String addMaster(StuMaster stuMaster) {
        Map<String, Object> map = new HashMap<String, Object>();
        //调用添加学生的方法
        if (stuInfoService.addMaster(stuMaster) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "提交成功");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "提交失败");
        }
        return JSON.toJSONString(map);
    }
}