package com.service;

import com.vo.PieChartsVo;

import java.util.List;
import java.util.Map;

public interface ChartsService {
//    List<Map> getTotalEmp();
    List<PieChartsVo> getTotalEmp(String year);
}
