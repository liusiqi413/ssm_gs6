package com.controller.admin;

import com.service.StuUserService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/stuExcelUpload")
public class StuUserExcelController {
    @Resource
    private StuUserService stuUserService;
    @ResponseBody
    @RequestMapping(value="/ajaxUpload",method={RequestMethod.GET,RequestMethod.POST})
    public Map<String, String> ajaxUploadExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("进来了");
        Map<String, String> map = new HashMap<>();
        stuUserService.ajaxUploadExcel(file, request, response);
        map.put("msg", "ok");
        return map;
    }
}