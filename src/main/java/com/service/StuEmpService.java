package com.service;

import com.entity.StuEmp;
import com.vo.StuEmpVo;

import java.util.List;

public interface StuEmpService{
    /*
    查询
     */
    List<StuEmp> findStuEmpList(StuEmpVo stuEmpVo);
/*
修改
 */
    int updateStuEmp(StuEmp stuEmp);
/*
删除
 */
    int deleteStuEmpById(Integer id);

    /*
     根据学生号查询信息是否重复
      */
    StuEmp checkStuEmp(StuEmp stuEmp);
}
