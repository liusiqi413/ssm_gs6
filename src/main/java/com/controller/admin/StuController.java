package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.entity.Student;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.StuService;
import com.utils.DataGridViewResult;
import com.utils.SystemConstant;
import com.vo.StuVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/stu")
public class StuController {
@Resource
    private StuService stuService;
/*
查询学生基本信息列表
 */
@RequestMapping("/list")
public DataGridViewResult list(StuVo stuVo){
    //设置分页信息，当前页码，每页显示数量
    PageHelper.startPage(stuVo.getPage(),stuVo.getLimit());
    //调用分页查询学生信息列表的方法
   List<Student> studentList=stuService.findStuList(stuVo);
   //创建分页对象
    PageInfo<Student> pageInfo=new PageInfo<Student>(studentList);
    //返回数据
    return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
    /*
    添加学生
     */
    @RequestMapping("/addStu")
    public String addStu(Student student){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用添加学生的方法
        if(stuService.addStu(student)>0){
            map.put(SystemConstant.SUCCESS,true);//成功
            map.put(SystemConstant.MESSAGE,"添加成功");
        }else{
            map.put(SystemConstant.SUCCESS,false);//失败
            map.put(SystemConstant.MESSAGE,"添加失败");
        }
        //将map集合以JSON格式返回
        return JSON.toJSONString(map);
    }
    /*
   修改学生
    */
    @RequestMapping("/updateStu")
    public String updateStu(Student student){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用添加学生的方法
        if(stuService.updateStu(student)>0){
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
    删除学生
     */
    @RequestMapping("/deleteById")
    public String deleteById(Integer id){
        Map<String,Object> map=new HashMap<String, Object>();
        if(stuService.deleteById(id)>0){
            map.put("success",true);
            map.put("message","删除成功");
        }else{
            map.put("success",false);
            map.put("message","删除失败");
        }
        return JSON.toJSONString(map);
    }
}
