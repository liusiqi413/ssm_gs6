package com.controller;

import com.entity.Hire;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.HireService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class IndexController {
    @Resource
    private HireService hireService;
    @RequestMapping("/home.html")
    public String Index(Model model, HttpSession session){
        //调用查询招聘信息列表
        List<Hire> hireList=hireService.findCompanyListById();
        //将数据放进模型中
        model.addAttribute("hireList",hireList);
        return "forward:home.jsp";
    }
    /**
     * 分页查询
     */
    @RequestMapping(value="/list",method= RequestMethod.GET)
    public String pageList(ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        Integer pageSize=10;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<Hire> hireList = hireService.getAllUser();//获取所有用户信息
        PageInfo<Hire> pageInfo=new PageInfo<Hire>(hireList);
        map.addAttribute("pageInfo", pageInfo);
        return "list";
    }
}
