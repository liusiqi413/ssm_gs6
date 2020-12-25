package com.controller.admin;

import com.service.StuGraduService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/admin/stu")
public class StuGraduController {
    @Resource
    private StuGraduService stuGraduService;

}
