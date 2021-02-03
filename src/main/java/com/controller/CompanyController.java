package com.controller;

import com.entity.Hire;
import com.service.HireService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
    @RequestMapping("/company")
    public class CompanyController {
        @Resource
        private HireService hireService;
        @RequestMapping("/{id}.html")
        public String detail(@PathVariable Integer id, Model model){
            Hire hire=hireService.findById(id);
            model.addAttribute("hire",hire);
                return "detail";
        }
}
