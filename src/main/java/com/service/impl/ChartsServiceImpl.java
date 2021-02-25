package com.service.impl;

import com.dao.ChartsMapper;
import com.service.ChartsService;
import com.vo.PieChartsVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class ChartsServiceImpl implements ChartsService {
    @Resource
    private ChartsMapper chartsMapper;
    @Override
    public List<PieChartsVo> getTotalEmp(String year) {
        return chartsMapper.getTotalEmp(year);
    }




    public List<PieChartsVo> getTotalMaster(String year) {
        return chartsMapper.getTotalMaster(year);
    }

    @Override
    public List<PieChartsVo> getTotalCategory(String year) {
        return chartsMapper.getTotalCategory(year);
    }
}