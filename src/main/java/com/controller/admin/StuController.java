package com.controller.admin;

import com.entity.Student;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.StuService;
import com.utils.DataGridViewResult;
import com.vo.StuVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

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
    //设置分页信息
    PageHelper.startPage(stuVo.getPage(),stuVo.getLimit());
    //调用分页查询方法
   List<Student> studentList=stuService.findStuList(stuVo);
   //创建分页对象
    PageInfo<Student> pageInfo=new PageInfo<Student>(studentList);
    //返回数据
    return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
}
