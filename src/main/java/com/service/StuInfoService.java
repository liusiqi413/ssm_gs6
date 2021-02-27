package com.service;


import com.entity.*;

import java.util.List;

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
    /*
 根据学生电话号查询该学生基本信息
  */
    Student findStuInfoByName(Student student);
    /*
     根据学生号查询学生就业信息
      */
    List<StuEmp> findStuEmpByStuno(String stuno);
    /*
 修改学生就业信息
 */
    int updateEditEmp(StuEmp stump);
    /*
      根据学生号查询考研信息
       */
    List<StuMaster> findStuMasterByStuno(String stuno);
    /*
    修改学生就业信息
    */
    int updateEditMaster(StuMaster stuMaster);
    /*
    查询密码
     */
    StuUser findLoginPwdByLoginName(String loginName, String loginPwd);
    /*
   修改密码
    */
    int updateUserPassword(StuUser stuUser);
}
