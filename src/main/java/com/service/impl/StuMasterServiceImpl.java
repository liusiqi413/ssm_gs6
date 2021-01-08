package com.service.impl;

import com.dao.StuMasterMapper;
import com.entity.StuMaster;
import com.service.StuMasterService;
import com.vo.StuMasterVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class StuMasterServiceImpl implements StuMasterService {
    @Resource
    private StuMasterMapper stuMasterMapper;

    @Override
    public List<StuMaster> findStuMasterList(StuMasterVo stuMasterVo) {
        return stuMasterMapper.findStuMasterList(stuMasterVo);
    }

    @Override
    public int addStuMaster(StuMaster stuMaster) {
        return stuMasterMapper.addStuMaster(stuMaster);
    }

    @Override
    public int updateStuMaster(StuMaster stuMaster) {
        return stuMasterMapper.updateStuMaster(stuMaster);
    }

    @Override
    public int deleteStuMasterById(Integer id) {
        return stuMasterMapper.deleteStuMasterById(id);
    }

}
