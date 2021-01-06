package com.service;

import com.entity.StuEmp;
import com.vo.StuEmpVo;

import java.util.List;

public interface StuEmpService{
    /*
    查询
     */
    List<StuEmp> findStuEmpList(StuEmpVo stuEmpVo);

    int addStuEmp(StuEmp stuEmp);

    int updateStuEmp(StuEmp stuEmp);

    int deleteStuEmpById(Integer id);
}
