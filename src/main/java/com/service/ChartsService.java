package com.service;

import com.vo.PieChartsVo;

import java.util.List;
import java.util.Map;

public interface ChartsService {
    List<PieChartsVo> getTotalEmp(String year);
    List<PieChartsVo> getTotalMaster(String year);
    List<PieChartsVo> getTotalCategory(String year);
}
