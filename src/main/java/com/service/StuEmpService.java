package com.service;

import com.entity.StuEmp;
import com.vo.StuEmpVo;

import java.util.List;

public interface StuEmpService{
    /*
    查询
     */
    List<StuEmp> findStuEmpList(StuEmpVo stuEmpVo);
/*
添加
 */
    int addStuEmp(StuEmp stuEmp);
/*
修改
 */
    int updateStuEmp(StuEmp stuEmp);
/*
删除
 */
    int deleteStuEmpById(Integer id);
   /*
   根据学号查询学生信息
    */
    StuEmp findStuEmpNoByName(String stuno);
}
