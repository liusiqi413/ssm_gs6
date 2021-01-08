package com.service;

import com.entity.StuMaster;
import com.vo.StuMasterVo;

import java.util.List;

public interface StuMasterService {
    List<StuMaster> findStuMasterList(StuMasterVo stuMasrerVo);

    int addStuMaster(StuMaster stuMaster);

    int updateStuMaster(StuMaster stuMaster);

    int deleteStuMasterById(Integer id);
}
