package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.entity.StuEmp;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.StuEmpService;
import com.utils.DataGridViewResult;
import com.utils.SystemConstant;
import com.vo.StuEmpVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/stu")
public class StuEmployController {
    @Resource
    private StuEmpService stuEmpService;
    /*
    查询列表
     */
    @RequestMapping("/employ")
    public DataGridViewResult list(StuEmpVo stuEmpVo){
        //设置分页信息
        PageHelper.startPage(stuEmpVo.getPage(),stuEmpVo.getLimit());
//            调用分页查询方法
        List<StuEmp> studentEmpList=stuEmpService.findStuEmpList(stuEmpVo);
//            创建分页对象
        PageInfo<StuEmp> pageInfo=new PageInfo<StuEmp>(studentEmpList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
    /*
   添加学生
    */
    @RequestMapping("/addStuEmp")
    public String addStuEmp(StuEmp stuEmp){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用添加学生的方法
        if(stuEmpService.addStuEmp(stuEmp)>0){
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
    @RequestMapping("/updateStuEmp")
    public String updateStuEmp(StuEmp stuEmp){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用添加学生的方法
        if(stuEmpService.updateStuEmp(stuEmp)>0){
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
    @RequestMapping("/deleteStuEmpById")
    public String deleteStuEmpById(Integer id){
        Map<String,Object> map=new HashMap<String, Object>();
        if(stuEmpService.deleteStuEmpById(id)>0){
            map.put("success",true);
            map.put("message","删除成功");
        }else{
            map.put("success",false);
            map.put("message","删除失败");
        }
        return JSON.toJSONString(map);
    }
}

