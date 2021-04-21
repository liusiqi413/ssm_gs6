package com.controller.admin;


import com.alibaba.fastjson.JSON;
import com.entity.StuEmp;
import com.entity.Student;
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
    /**
     * 审核通过
     */
    @RequestMapping("/homePass")
    public String homePass(StudentHome studentHome){
        Map<String,Object> map = new HashMap<String,Object>();
        //将订单状态改成已确认(status=2)
        studentHome.setStatus(2);
        //调用修改的方法
        if(stuHomeService.updateStuHome(studentHome)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"审核通过");
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"审核通过失败");
        }
        return JSON.toJSONString(map);
    }
    /**
     * 审核未通过
     */
    @RequestMapping("/homeFail")
    public String homeFail(StudentHome studentHome){
        Map<String,Object> map = new HashMap<String,Object>();
        //将订单状态改成已确认(status=2)
        studentHome.setStatus(3);
        //调用修改的方法
        if(stuHomeService.updateStuHome(studentHome)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"审核未通过成功");
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"审核未通过失败");
        }
        return JSON.toJSONString(map);
    }
    /*批量通过*/
    @RequestMapping("/batchHomeConfirm")
    public String batchHomeConfirm(String ids){
        Map<String,Object> map = new HashMap<String,Object>();
        int count = 0;
        //将字符串拆分成数组
        String[] idsStr = ids.split(",");
        //循环确认
        for (int i = 0; i < idsStr.length; i++) {
            //创建对象
            StudentHome studentHome = new StudentHome();
            studentHome.setStatus(2);//审核通过
            studentHome.setId(Integer.valueOf(idsStr[i]));
            //调用修改审核的方法
            count = stuHomeService.updateStuHome(studentHome);
            //判断受影响行数是否大于0
            if(count>0){
                map.put(SystemConstant.SUCCESS,true);
                map.put(SystemConstant.MESSAGE,"审核成功");
            }
        }
        //判断受影响行数是否小于0
        if(count<=0){
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"审核失败");
        }
        return JSON.toJSONString(map);
    }
    /*批量未通过*/
    @RequestMapping("/batchHomeFail")
    public String batchHomeFail(String ids){
        Map<String,Object> map = new HashMap<String,Object>();
        int count = 0;
        //将字符串拆分成数组
        String[] idsStr = ids.split(",");
        //循环确认
        for (int i = 0; i < idsStr.length; i++) {
            //创建对象
            StudentHome studentHome = new StudentHome();
            studentHome.setStatus(3);//审核通过
            studentHome.setId(Integer.valueOf(idsStr[i]));
            //调用修改审核的方法
            count = stuHomeService.updateStuHome(studentHome);
            //判断受影响行数是否大于0
            if(count>0){
                map.put(SystemConstant.SUCCESS,true);
                map.put(SystemConstant.MESSAGE,"批量审核未通过成功");
            }
        }
        //判断受影响行数是否小于0
        if(count<=0){
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"批量审核未通过失败");
        }
        return JSON.toJSONString(map);
    }
    }