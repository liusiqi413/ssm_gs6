package com.service;

import com.entity.StuEmp;
import com.vo.StuEmpVo;

import java.util.List;

public interface StuEmpService{
    /*
    查询
     */
    List<StuEmp> findStuEmpList(StuEmpVo stuEmpVo);
}
