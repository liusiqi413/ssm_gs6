package com.dao;

import com.entity.StuMaster;
import com.entity.Student;
import com.vo.StuMasterVo;

import java.util.List;

public interface StuMasterMapper {
/*
查询研究生列表
 */
    List<StuMaster> findStuMasterList(StuMasterVo stuMasterVo);
    /*
    修改学生信息
     */
    int updateStuMaster(StuMaster stuMaster);
    /*
    删除学生信息
     */
    int deleteStuMasterById(Integer id);
    /*
查询修改学生数据是否重复
 */
    StuMaster checkUpdateStuMasterName(StuMaster stuMaster);
}
