package com.dao;

import com.vo.PieChartsVo;

import java.util.List;
import java.util.Map;

public interface ChartsMapper {
    List<PieChartsVo> getTotalEmp(String year);
    List<PieChartsVo> getTotalMaster(String year);
    List<PieChartsVo> getTotalCategory(String year);
    List<Map> getTotalSalary(String year);
    List<Map> getSalaryAvgCharts(String year);
    List<Map> getProvinceCharts(String year);
}
