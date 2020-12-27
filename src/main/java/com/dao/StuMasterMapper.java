package com.dao;

import com.entity.StuMaster;
import com.vo.StuMasterVo;

import java.util.List;

public interface StuMasterMapper {
/*
查询研究生列表
 */
    List<StuMaster> findStuMasterList(StuMasterVo stuMasterVo);
}
