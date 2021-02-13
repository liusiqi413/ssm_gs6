package com.controller;


import com.alibaba.fastjson.JSON;
import com.entity.Student;
import com.service.StuInfoService;
import com.utils.SystemConstant;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@RestController
public class StuInfoManagerController {
    /*
添加信息
*/
    @Resource
    private StuInfoService stuInfoService;

    @RequestMapping("/updateInfo")
    public String updateInfo(Student student) {
        Map<String, Object> map = new HashMap<String, Object>();
        //调用添加学生的方法
        if (stuInfoService.updateInfo(student) > 0) {
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "提交成功");
        } else {
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "提交失败");
        }
        return JSON.toJSONString(map);
    }
}
