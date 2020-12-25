package com.controller.admin;


import com.entity.StudentHome;
import com.github.pagehelper.PageHelper;;
import com.github.pagehelper.PageInfo;
import com.service.StuHomeService;
import com.utils.DataGridViewResult;
import com.vo.StuHomeVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;


@RestController
    @RequestMapping("/admin/stu")
   public class StuHomeController {
        @Resource
        private StuHomeService stuHomeService;
        /*
        查询列表
         */
        @RequestMapping("/lists")
        public DataGridViewResult list(StuHomeVo stuHomeVo){
            //设置分页信息
            PageHelper.startPage(stuHomeVo.getPage(),stuHomeVo.getLimit());
//            调用分页查询方法
            List<StudentHome> studentHomeList=stuHomeService.findStuHomeList(stuHomeVo);
//            创建分页对象
            PageInfo<StudentHome> pageInfo=new PageInfo<StudentHome>(studentHomeList);
            //返回数据
            return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
        }
    }
