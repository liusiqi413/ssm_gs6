package com.service;

import com.entity.StuMaster;
import com.vo.StuMasterVo;

import java.util.List;

public interface StuMasterService {
    List<StuMaster> findStuMasterList(StuMasterVo stuMasrerVo);


    int updateStuMaster(StuMaster stuMaster);

    int deleteStuMasterById(Integer id);

    /*
 查询修改学生数据是否重复
  */
    StuMaster checkUpdateStuMasterName(StuMaster stuMaster);
}
