package com.controller.admin;

import com.entity.StuEmp;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.StuEmpService;
import com.utils.DataGridViewResult;
import com.vo.StuEmpVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/admin/stu")
public class StuEmployController {
    @Resource
    private StuEmpService stuEmpService;
    /*
    查询列表
     */
    @RequestMapping("/employ")
    public DataGridViewResult list(StuEmpVo stuEmpVo){
        //设置分页信息
        PageHelper.startPage(stuEmpVo.getPage(),stuEmpVo.getLimit());
//            调用分页查询方法
        List<StuEmp> studentEmpList=stuEmpService.findStuEmpList(stuEmpVo);
//            创建分页对象
        PageInfo<StuEmp> pageInfo=new PageInfo<StuEmp>(studentEmpList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
}

