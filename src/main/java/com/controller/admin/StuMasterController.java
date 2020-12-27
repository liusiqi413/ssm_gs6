package com.controller.admin;

import com.entity.StuMaster;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.StuMasterService;
import com.utils.DataGridViewResult;

import com.vo.StuMasterVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/admin/stu")
public class StuMasterController {
    @Resource
    private StuMasterService stuMasterService;
/*
查询
 */
    @RequestMapping("/master")
    public DataGridViewResult list(StuMasterVo stuMasterVo){
        //设置分页信息
        PageHelper.startPage(stuMasterVo.getPage(),stuMasterVo.getLimit());
//            调用分页查询方法
        List<StuMaster> studentMasterList=stuMasterService.findStuMasterList(stuMasterVo);
//            创建分页对象
        PageInfo<StuMaster> pageInfo=new PageInfo<StuMaster>(studentMasterList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
}
