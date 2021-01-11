package com.controller.admin;

import com.service.StuService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/excelUpload")
public class ExceluploadController {
    @Resource
    private StuService stuService;



    @ResponseBody
    @RequestMapping(value="/ajaxUpload",method={RequestMethod.GET,RequestMethod.POST})
    public Map<String, String> ajaxUploadExcel(@RequestParam("file")MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("进来了");
        Map<String, String> map = new HashMap<>();
        stuService.ajaxUploadExcel(file, request, response);
        map.put("msg", "ok");
        return map;
    }


}
