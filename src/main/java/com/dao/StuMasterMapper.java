package com.dao;

import com.entity.StuMaster;
import com.vo.StuMasterVo;

import java.util.List;

public interface StuMasterMapper {
/*
查询研究生列表
 */
    List<StuMaster> findStuMasterList(StuMasterVo stuMasterVo);
    /*
添加学生信息
 */
    int addStuMaster(StuMaster stuMaster);
    /*
    修改学生信息
     */
    int updateStuMaster(StuMaster stuMaster);
    /*
    删除学生信息
     */
    int deleteStuMasterById(Integer id);
    /*
    根据学生学号查询学生信息
     */
    StuMaster findStuMasterNoByName(String stuno);
}
