package com.dao;

import com.entity.StuEmp;
import com.vo.StuEmpVo;

import java.util.List;

public interface StuEmpMapper {
    /*
    查询学生就业信息列表
     */
    List<StuEmp> findStuEmpList(StuEmpVo stuEmpVo);
}
