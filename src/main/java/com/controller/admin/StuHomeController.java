package com.controller.admin;


import com.alibaba.fastjson.JSON;
import com.entity.StudentHome;
import com.github.pagehelper.PageHelper;;
import com.github.pagehelper.PageInfo;
import com.service.StuHomeService;
import com.utils.DataGridViewResult;
import com.utils.SystemConstant;
import com.vo.StuHomeVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
    @RequestMapping("/admin/stu")
   public class StuHomeController {
        @Resource
        private StuHomeService stuHomeService;
        /*
        查询列表
         */
        @RequestMapping("/lists")
        public DataGridViewResult list(StuHomeVo stuHomeVo){
            //设置分页信息
            PageHelper.startPage(stuHomeVo.getPage(),stuHomeVo.getLimit());
//            调用分页查询方法
            List<StudentHome> studentHomeList=stuHomeService.findStuHomeList(stuHomeVo);
//            创建分页对象
            PageInfo<StudentHome> pageInfo=new PageInfo<StudentHome>(studentHomeList);
            //返回数据
            return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
        }

    /*
   添加学生
    */
    @RequestMapping("/updateStuHome")
    public String updateStuHome(StudentHome studentHome){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用添加学生的方法
        if(stuHomeService.updateStuHome(studentHome)>0){
            map.put(SystemConstant.SUCCESS,true);//成功
            map.put(SystemConstant.MESSAGE,"修改成功");
        }else{
            map.put(SystemConstant.SUCCESS,false);//失败
            map.put(SystemConstant.MESSAGE,"修改失败");
        }
        //将map集合以JSON格式返回
        return JSON.toJSONString(map);
    }
    @RequestMapping("/deleteStuHomeById")
    public String deleteStuHomeById(Integer id){
        Map<String,Object> map=new HashMap<String, Object>();
        if(stuHomeService.deleteStuHomeById(id)>0){
            map.put("success",true);
            map.put("message","删除成功");
        }else{
            map.put("success",false);
            map.put("message","删除失败");
        }
        return JSON.toJSONString(map);
    }
    }
