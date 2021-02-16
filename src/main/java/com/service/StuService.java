package com.service;

import com.entity.StuEmp;
import com.entity.Student;
import com.vo.StuVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface StuService {
    /*
    查询
     */
    List<Student> findStuList(StuVo stuVo);

    /*
    添加学生
     */
    int addStu(Student student);
    /*
  修改学生信息
   */
    int updateStu(Student student);
    /*
    删除该学生信息
     */
    int deleteById(Integer id);
    /*
    批量导入
     */
    String ajaxUploadExcel(MultipartFile file, HttpServletRequest request, HttpServletResponse response);
    /*
    根据学生号查询学生信息
     */
    Student findStuByName(String stuno);
    /*
    查询修改学生数据是否重复
     */
    Student checkUpdateStuName(Student student);
    /*
   根据学生号查询学生
    */
    List <Student> findStuByStuno(String stuno);
}