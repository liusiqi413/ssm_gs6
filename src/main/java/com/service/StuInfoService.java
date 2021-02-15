package com.service;


import com.entity.StuEmp;
import com.entity.StuMaster;
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
    /*
   根据学生号查询该学生就业信息
    */
    StuEmp findStuEmpByName(StuEmp stuEmp);
    /*
  根据学生号查询该学生考研信息
   */
    StuMaster findStuMasterByName(StuMaster stuMaster);
    /*
   添加学生考研信息
    */
    int addMaster(StuMaster stuMaster);
}
