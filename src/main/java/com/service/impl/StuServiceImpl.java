package com.service.impl;

import com.dao.StuMapper;
import com.entity.Student;
import com.service.StuService;
import com.utils.ExcelUtils;
import com.vo.StuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.io.InputStream;

@Service
@Transactional
public class StuServiceImpl implements StuService {
    @Resource
    private StuMapper stuMapper;
    @Override
    public List<Student> findStuList(StuVo stuVo) {
        return stuMapper.findStuList(stuVo);
    }

    @Override
    public int addStu(Student student) {
        return stuMapper.addStu(student);
    }

    @Override
    public int updateStu(Student student) {
        return stuMapper.updateStu(student);
    }

    @Override
    public int deleteById(Integer id) {
        return stuMapper.deleteById(id);
    }

        /*
         * 文件导入（批量导入）
         * */
        @Override
        public String ajaxUploadExcel(MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

            /*MultipartFile file = multipartRequest.getFile("file");*/

            //   System.out.println("得到数据文件");
            if(file.isEmpty()){
                try {
                    throw new Exception("文件不存在！");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            InputStream in =null;
            try {
                in = file.getInputStream();
            } catch (IOException e) {
                e.printStackTrace();
            }
            //   System.out.println("加载流");
            List<List<Object>> listob = null;
            try {
                //   System.out.println("加载流");
                listob = new ExcelUtils().getBankListByExcel(in,file.getOriginalFilename());
            } catch (Exception e) {
                e.printStackTrace();
            }

            //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
            for (int i = 0; i < listob.size(); i++) {
                //    System.out.println("listob,zize是："+listob.size());
                List<Object> lo = listob.get(i);
                //    System.out.println("遍历" + listob.get(i));
                Student vo = new Student();
                //     Student j = null;

                //     System.out.println("lo.size是："+lo.size());

                if(lo.size() == 10){    //无ID这一列
                    //     System.out.println("无ID");
                    vo.setStuno(String.valueOf(lo.get(0)));
                    vo.setStuname(String.valueOf(lo.get(1)));
                    vo.setGender(String.valueOf(lo.get(2)));
                    vo.setCollege(String.valueOf(lo.get(3)));
                    vo.setMajor(String.valueOf(lo.get(4)));
                    vo.setClasses(String.valueOf(lo.get(5)));
                    vo.setStart(Date.valueOf(String.valueOf(lo.get(6))));
                    vo.setGradu(Date.valueOf(String.valueOf(lo.get(7))));
                    vo.setDiploma(String.valueOf(lo.get(8)));
                    vo.setTrain(String.valueOf(lo.get(9)));
                }else if(lo.size() == 11){   //有ID这一列
                    //      System.out.println("有ID");
                    vo.setStuno(String.valueOf(lo.get(1)));
                    vo.setStuname(String.valueOf(lo.get(2)));
                    vo.setGender(String.valueOf(lo.get(3)));
                    vo.setCollege(String.valueOf(lo.get(4)));
                    vo.setMajor(String.valueOf(lo.get(5)));
                    vo.setClasses(String.valueOf(lo.get(6)));
                    vo.setStart(Date.valueOf(String.valueOf(lo.get(7))));
                    vo.setGradu(Date.valueOf(String.valueOf(lo.get(8))));
                    vo.setDiploma(String.valueOf(lo.get(9)));
                    vo.setTrain(String.valueOf(lo.get(10)));

                }

               stuMapper.addStu(vo);

            }
            return "success";
        }

    }

