package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.entity.StuMaster;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.StuMasterService;
import com.utils.DataGridViewResult;

import com.utils.SystemConstant;
import com.vo.StuMasterVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/stu")
public class StuMasterController {
    @Resource
    private StuMasterService stuMasterService;
/*
查询
 */
    @RequestMapping("/master")
    public DataGridViewResult list(StuMasterVo stuMasterVo){
        //设置分页信息
        PageHelper.startPage(stuMasterVo.getPage(),stuMasterVo.getLimit());
//            调用分页查询方法
        List<StuMaster> studentMasterList=stuMasterService.findStuMasterList(stuMasterVo);
//            创建分页对象
        PageInfo<StuMaster> pageInfo=new PageInfo<StuMaster>(studentMasterList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
    /*
   添加学生
    */
    @RequestMapping("/addStuMaster")
    public String addStuMaster(StuMaster stuMaster){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用添加学生的方法
        if(stuMasterService.addStuMaster(stuMaster)>0){
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
    @RequestMapping("/updateStuMaster")
    public String updateStuMaster(StuMaster stuMaster){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用添加学生的方法
        if(stuMasterService.updateStuMaster(stuMaster)>0){
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
    @RequestMapping("/deleteStuMasterById")
    public String deleteStuMasterById(Integer id){
        Map<String,Object> map=new HashMap<String, Object>();
        if(stuMasterService.deleteStuMasterById(id)>0){
            map.put("success",true);
            map.put("message","删除成功");
        }else{
            map.put("success",false);
            map.put("message","删除失败");
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/checkStuMaster")
    public String checkStuMaster(String stuno){
        //创建map集合保存结果信息
        Map<String,Object> map=new HashMap<String, Object>();
        //调用注册的方法
        if(stuMasterService.findStuMasterNoByName(stuno)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"已有相同学生号，请重新确认后再输入！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/checkUpdateStuMasterName")
    public String checkUpdateStuMasterName(StuMaster stuMaster){
        //创建map集合保存结果信息
        Map<String,Object> map=new HashMap<String, Object>();
        //调用查询的方法
        if(stuMasterService.checkUpdateStuMasterName(stuMaster)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"已有相同学生号，请重新确认后再输入！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/batchDeleteMaster")
    public String batchDeleteMaster(String ids) {
        Map<String, Object> map = new HashMap<String, Object>();
        int count = 0;
        //将字符串拆分成数组
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            count = stuMasterService.deleteStuMasterById(Integer.valueOf(idsStr[i]));
            if (count > 0) {
                map.put("success", true);
                map.put("message", "删除成功");
            }
        }
        //判断受影响行数是否为0
        if (count <= 0) {
            map.put("success", false);
            map.put("message", "删除失败");
        }
        return JSON.toJSONString(map);
    }
}