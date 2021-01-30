package com.controller.admin;

import com.entity.Hire;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.HireService;
import com.utils.DataGridViewResult;
import com.utils.UUIDUtils;
import com.vo.HireVo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/admin/hire")
public class HireController {
    @Resource
    private HireService hireService;
    /*
    查询招聘信息
     */
    @RequestMapping("/list")
    public DataGridViewResult list(HireVo hireVo){
        //设置分页信息
        PageHelper .startPage(hireVo.getPage(),hireVo.getLimit());
        //调用查询的方法
        List<Hire> hireList=hireService.findHireList(hireVo);
        //创建分页对象
        PageInfo<Hire> pageInfo=new PageInfo<Hire>(hireList);
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
    @RequestMapping("/uploadFile")
    public String uploadFile(MultipartFile file){
        //判断是否有选中的文件
        if(!file.isEmpty()){
            //获取文件上传地址
            String path="F:/project/company/upload/";
            //获取源文件的名称
            String oldFileName=file.getOriginalFilename();
            //获取文件的后缀名
           String extension=FilenameUtils.getExtension(oldFileName);
            //重命名旧文件
            String newFileName= UUIDUtils.randomUUID()+"."+extension;
            //为了解决同一个文件夹下文件过多的问题，使用日期作为文件夹管理
            String dataPath=new SimpleDateFormat("yyyyMMdd").format(new Date());
        }
    }
}
