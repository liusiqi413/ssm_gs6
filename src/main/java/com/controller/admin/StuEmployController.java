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
    @RequestMapping("/checkStuEmp")
    public String checkStuEmp(String stuno){
        //创建map集合保存结果信息
        Map<String,Object> map=new HashMap<String, Object>();
        //调用注册的方法
        if(stuEmpService.findStuEmpNoByName(stuno)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"已有相同学生号，请重新确认后再输入！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/batchDeleteEmp")
    public String batchDeleteEmp(String ids) {
        Map<String, Object> map = new HashMap<String, Object>();
        int count = 0;
        //将字符串拆分成数组
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            count = stuEmpService.deleteStuEmpById(Integer.valueOf(idsStr[i]));
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
    /**
     * 审核通过
     */
    @RequestMapping("/pass")
    public String pass(StuEmp stuEmp){
        Map<String,Object> map = new HashMap<String,Object>();
        //将订单状态改成已确认(status=2)
        stuEmp.setStatus(2);
        //调用修改的方法
        if(stuEmpService.updateStuEmp(stuEmp)>0){
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
    @RequestMapping("/fail")
    public String fail(StuEmp stuEmp){
        Map<String,Object> map = new HashMap<String,Object>();
        //将订单状态改成已确认(status=2)
        stuEmp.setStatus(3);
        //调用修改的方法
        if(stuEmpService.updateStuEmp(stuEmp)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"审核未通过");
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"审核未通过失败");
        }
        return JSON.toJSONString(map);
    }
   /*批量通过*/
    @RequestMapping("/batchConfirm")
    public String batchConfirm(String ids){
        Map<String,Object> map = new HashMap<String,Object>();
        int count = 0;
        //将字符串拆分成数组
        String[] idsStr = ids.split(",");
        //循环确认
        for (int i = 0; i < idsStr.length; i++) {
            //创建对象
            StuEmp stuEmp = new StuEmp();
            stuEmp.setStatus(2);//审核通过
            stuEmp.setId(Integer.valueOf(idsStr[i]));
            //调用修改审核的方法
            count = stuEmpService.updateStuEmp(stuEmp);
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
    @RequestMapping("/batchFail")
    public String batchFail(String ids){
        Map<String,Object> map = new HashMap<String,Object>();
        int count = 0;
        //将字符串拆分成数组
        String[] idsStr = ids.split(",");
        //循环确认
        for (int i = 0; i < idsStr.length; i++) {
            //创建对象
            StuEmp stuEmp = new StuEmp();
            stuEmp.setStatus(3);//审核通过
            stuEmp.setId(Integer.valueOf(idsStr[i]));
            //调用修改审核的方法
            count = stuEmpService.updateStuEmp(stuEmp);
            //判断受影响行数是否大于0
            if(count>0){
                map.put(SystemConstant.SUCCESS,true);
                map.put(SystemConstant.MESSAGE,"未审核成功");
            }
        }
        //判断受影响行数是否小于0
        if(count<=0){
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"未审核失败");
        }
        return JSON.toJSONString(map);
    }
}