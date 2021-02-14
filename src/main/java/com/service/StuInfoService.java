package com.service;


import com.entity.StuEmp;
import com.entity.Student;

public interface StuInfoService {
    /*
  添加信息
   */
    int updateInfo(Student student);
    /*
    添加学生就业信息
     */
    int addEmp(StuEmp stuEmp);
}
