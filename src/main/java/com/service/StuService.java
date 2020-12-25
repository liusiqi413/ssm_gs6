package com.service;

import com.entity.Student;
import com.vo.StuVo;

import java.util.List;

public interface StuService {
    /*
    查询
     */
    List<Student> findStuList(StuVo stuVo);
}
