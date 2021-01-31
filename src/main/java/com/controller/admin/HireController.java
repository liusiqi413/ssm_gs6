package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.entity.Hire;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.HireService;
import com.utils.DataGridViewResult;
import com.utils.SystemConstant;
import com.utils.UUIDUtils;
import com.vo.HireVo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        //创建Map集合保存返回的JSON数据
        Map<String,Object> map=new HashMap<String, Object>();
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
            //组装最终的文件名
            String finalName=dataPath+"/"+newFileName;
            //创建文件对象
            //参数1：文件上传的地址 参数2：文件名称
            File dest=new File(path,finalName);
            //判断文件夹是否存在，不存在则创建文件夹
            if(!dest.getParentFile().exists()){
                dest.getParentFile().mkdirs();//创建文件夹
            }

            try{
                //进行文件上传
                file.transferTo(dest);
                map.put("code",0);//状态码
                map.put("msg","上传成功");//执行消息
                Map<String,Object> dataMap=new HashMap<String, Object>();
                dataMap.put("src","/company/show/"+finalName);
                map.put("data",dataMap);//文件数据
                map.put("imagePath",finalName);//隐藏域的值，只保留日期文件夹+重命名后的文件夹
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
         return JSON.toJSONString(map);
    }
 /*
 添加招聘信息
  */
    @RequestMapping("/addHire")
    public String addHire(Hire hire){
        Map<String,Object> map=new HashMap<String, Object>();
        if(hireService.addHire(hire)>0){
            map.put(SystemConstant.SUCCESS,true);
            map.put(SystemConstant.MESSAGE,"添加成功");
        }else{
            map.put(SystemConstant.SUCCESS,false);
            map.put(SystemConstant.MESSAGE,"添加失败");
        }
        return JSON.toJSONString(map);
    }
}