package com.dao;

import com.vo.PieChartsVo;

import java.util.List;
import java.util.Map;

public interface ChartsMapper {
//    List<Map> getTotalEmp();
    List<PieChartsVo> getTotalEmp(String year);
}
