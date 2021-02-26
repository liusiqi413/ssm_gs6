package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.service.ChartsService;
import com.vo.ChartsVo;
import com.vo.PieChartsVo;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/admin/charts")
public class ChartsController {
    @Resource
    private ChartsService chartsService;

    @RequestMapping("/getTotalEmp")
    public String getTotalEmp(String year) {
        //判断日期是否为空
        if (StringUtils.isEmpty(year)) {
            //为空则格式化当前日期
            year = new SimpleDateFormat("yyyy").format(new Date());
        }
        return JSON.toJSONString(chartsService.getTotalEmp(year));
    }

    @RequestMapping("/getTotalMaster")
    public String getTotalMaster(String year) {
      //  判断日期是否为空
        if (StringUtils.isEmpty(year)) {
            //为空则格式化当前日期
            year = new SimpleDateFormat("yyyy").format(new Date());
        }
        return JSON.toJSONString(chartsService.getTotalMaster(year));
    }
    @RequestMapping("/getTotalCategory")
    public String getTotalCategory(String year) {
        //  判断日期是否为空
        if (StringUtils.isEmpty(year)) {
            //为空则格式化当前日期
            year = new SimpleDateFormat("yyyy").format(new Date());
        }
        return JSON.toJSONString(chartsService.getTotalCategory(year));
    }

    /**
     * 统计每年营业额
     * @return
     */
    @RequestMapping("/getSalaryCharts")
    public String getSalaryCharts(String year){
        //创建Map集合保存数据
        Map<String,Object> dataMap = new HashMap<String,Object>();
        //调用统计每个年度营业总额的方法
        List<Map> mapList = chartsService.getTotalSalary(year);
        //创建两个List集合，分别保存年份及对应的营业额
        List<String> keyList = new ArrayList<String>();//薪资区间
        List<Double> valueList = new ArrayList<Double>();//人数
        //循环遍历每年营业额集合
        for (Map map : mapList) {
            keyList.add(map.get("name").toString()+"k");//年份
            valueList.add(Double.valueOf(map.get("value").toString()));//金额
        }
        dataMap.put("keyList",keyList);
        dataMap.put("valueList",valueList);
        //将Map集合以JSON格式返回
        return JSON.toJSONString(dataMap);
    }
    @RequestMapping("/getSalaryAvgCharts")
    public String getSalaryAvgCharts(String year){
        //创建Map集合保存数据
        Map<String,Object> dataMap = new HashMap<String,Object>();
        //调用统计每个年度营业总额的方法
        List<Map> mapList = chartsService.getSalaryAvgCharts(year);
        //创建两个List集合，分别保存年份及对应的营业额
        List<String> keyList = new ArrayList<String>();//薪资区间
        List<Double> valueList = new ArrayList<Double>();//人数
        //循环遍历每年营业额集合
        for (Map map : mapList) {
            keyList.add(year);//年份
            valueList.add(Double.valueOf(map.get("value").toString()));//金额
        }
        dataMap.put("keyList",keyList);
        dataMap.put("valueList",valueList);
        //将Map集合以JSON格式返回
        return JSON.toJSONString(dataMap);
    }
    @RequestMapping("/getProvinceCharts")
    public String getProvinceCharts(String year){
        //创建Map集合保存数据
        Map<String,Object> dataMap = new HashMap<String,Object>();
        //调用统计每个年度营业总额的方法
        List<Map> mapList = chartsService.getProvinceCharts(year);
        //创建两个List集合，分别保存年份及对应的营业额
        List<String> keyList = new ArrayList<String>();//薪资区间
        List<Double> valueList = new ArrayList<Double>();//人数
        //循环遍历每年营业额集合
        for (Map map : mapList) {
            keyList.add(map.get("name").toString());//年份
            valueList.add(Double.valueOf(map.get("value").toString()));//金额
        }
        dataMap.put("keyList",keyList);
        dataMap.put("valueList",valueList);
        //将Map集合以JSON格式返回
        return JSON.toJSONString(dataMap);
    }
}
