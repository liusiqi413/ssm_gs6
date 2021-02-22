package com.service.impl;

import com.dao.ChartsMapper;
import com.service.ChartsService;
import com.vo.PieChartsVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
@Transactional
public class ChartsServiceImpl implements ChartsService {
    @Resource
    private ChartsMapper chartsMapper;
    @Override
    public List<PieChartsVo> getTotalEmp(String year) {

        return chartsMapper.getTotalEmp(year);
    }
}
