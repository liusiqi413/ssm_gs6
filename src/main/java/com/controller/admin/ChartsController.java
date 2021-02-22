package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.service.ChartsService;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("/admin/charts")
public class ChartsController {
@Resource
    private ChartsService chartsService;
@RequestMapping("/getTotalEmp")
    public String getTotalEmp(String date){
    //判断日期是否为空
    if(StringUtils.isEmpty(date)){
        //为空则格式化当前日期
        date = new SimpleDateFormat("yyyy").format(new Date());
    }
    return JSON.toJSONString(chartsService.getTotalEmp(date));
}
}
