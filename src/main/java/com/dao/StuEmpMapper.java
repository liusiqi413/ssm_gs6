package com.dao;

import com.entity.StuEmp;
import com.vo.StuEmpVo;

import java.util.List;

public interface StuEmpMapper {
    /*
    查询学生就业信息列表
     */
    List<StuEmp> findStuEmpList(StuEmpVo stuEmpVo);
    /*
    修改学生就业信息
     */
    int updateStuEmp(StuEmp stuEmp);
    /*
    删除学生就业信息
     */
    int deleteStuEmpById(Integer id);
    /*
    根据学生号查询重复数据
     */
    StuEmp checkStuEmp(StuEmp stuEmp);
}
