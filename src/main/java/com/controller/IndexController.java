package com.controller;

import com.entity.Hire;
import com.service.HireService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class IndexController {
@Resource
    private HireService hireService;
@RequestMapping("/home.html")
    public String Index(Model model){
    //调用查询招聘信息列表
    List<Hire> hireList=hireService.findCompanyListById();
    //将数据放进模型中
    model.addAttribute("hireList",hireList);
    return "forward:home.jsp";

}
}
