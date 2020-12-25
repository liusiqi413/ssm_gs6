package com.dao;

import com.entity.Student;
import com.vo.StuVo;

import java.util.List;

public interface StuMapper {
    /*
    查询学生列表
     */
    List<Student> findStuList(StuVo stuVo);

}
