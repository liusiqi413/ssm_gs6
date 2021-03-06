package com.dao;

import com.entity.StuEmp;
import com.entity.Student;
import com.vo.StuVo;

import java.util.List;

public interface StuMapper {
    /*
    查询学生列表
     */
    List<Student> findStuList(StuVo stuVo);
/*
添加学生信息
 */
    int addStu(Student student);
    /*
    修改学生信息
     */
    int updateStu(Student student);
/*
删除学生信息
 */
    int deleteById(Integer id);
    /*
    根据学生号查询该学生信息
     */
    Student findStuByName(String stuno);
    /*
  查询修改学生数据是否重复
   */
    Student checkUpdateStuName(Student student);
    /*
    根据学生号查询学生
     */
    List<Student> findStuByStuno(String stuno);

}
