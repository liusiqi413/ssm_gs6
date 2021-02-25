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
}
