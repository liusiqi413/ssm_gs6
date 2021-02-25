package com.dao;

import com.vo.PieChartsVo;

import java.util.List;

public interface ChartsMapper {
    List<PieChartsVo> getTotalEmp(String year);
    List<PieChartsVo> getTotalMaster(String year);
    List<PieChartsVo> getTotalCategory(String year);
}
