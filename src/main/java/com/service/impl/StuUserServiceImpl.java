package com.service.impl;

import com.dao.StuUserMapper;
import com.entity.StuUser;
import com.entity.Student;
import com.service.StuUserService;
import com.utils.ExcelUtils;
import com.utils.PasswordUtil;
import com.utils.SystemConstant;
import com.utils.UUIDUtils;
import com.vo.StuUserVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
@Transactional
public class StuUserServiceImpl implements StuUserService {
@Resource
private StuUserMapper stuUserMapper;

    public StuUser login(String loginName, String passWord) {
        StuUser stuUser=stuUserMapper.findStuUserByName(loginName);
        if(stuUser!=null) {
            String newPassword = PasswordUtil.md5(passWord, stuUser.getSalt(), SystemConstant.PASSWORD_COUNT);
            if (stuUser.getPassWord().equals(newPassword)) {
                return stuUser;//登录成功
            }
        }
        return null;
    }

    @Override
    public List<StuUser> findStuUserList(StuUserVo stuUserVo) {
        return stuUserMapper.findStuUserList(stuUserVo);
    }

    @Override
    public int addStuUser(StuUser stuUser) {
        //自动生成盐值
        stuUser.setSalt(UUIDUtils.randomUUID());
        //密码加密
        stuUser.setPassWord(PasswordUtil.md5(stuUser.getPassWord(),stuUser.getSalt(),SystemConstant.PASSWORD_COUNT));
        return stuUserMapper.addStuUser(stuUser);
    }

    @Override
    public int updateStuUser(StuUser stuUser) {
        //自动生成盐值
        stuUser.setSalt(UUIDUtils.randomUUID());
        //密码加密
        stuUser.setPassWord(PasswordUtil.md5(stuUser.getPassWord(),stuUser.getSalt(),SystemConstant.PASSWORD_COUNT));
        return stuUserMapper.updateStuUser(stuUser);
    }


    public int deleteStuUserById(Integer id) {
        return stuUserMapper.deleteStuUserById(id);
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
            StuUser vo = new StuUser();
            //     Student j = null;

            //     System.out.println("lo.size是："+lo.size());

            if(lo.size() == 3){    //无ID这一列
                //     System.out.println("无ID");
                if(stuUserMapper.findStuUserByName(String.valueOf(lo.get(0)))!=null){

                }else{
                vo.setLoginName(String.valueOf(lo.get(0)));
                vo.setPassWord(String.valueOf(lo.get(1)));
                vo.setSalt(UUIDUtils.randomUUID());
                //密码加密
                vo.setPassWord(PasswordUtil.md5(vo.getPassWord(),vo.getSalt(),SystemConstant.PASSWORD_COUNT));
                vo.setRealName(String.valueOf(lo.get(2)));
                    stuUserMapper.addStuUser(vo);
            }
            }else if(lo.size() == 4) {   //有ID这一列
                //      System.out.println("有ID");
                if (stuUserMapper.findStuUserByName(String.valueOf(lo.get(1))) != null) {

                } else {
                    vo.setLoginName(String.valueOf(lo.get(1)));
                    vo.setPassWord(String.valueOf(lo.get(2)));
                    vo.setSalt(UUIDUtils.randomUUID());
                    //密码加密
                    vo.setPassWord(PasswordUtil.md5(vo.getPassWord(), vo.getSalt(), SystemConstant.PASSWORD_COUNT));
                    vo.setRealName(String.valueOf(lo.get(3)));
                    stuUserMapper.addStuUser(vo);
                        }
            }
//            stuUserMapper.addStuUser(vo);
        }
        return "success";
    }

    @Override
    public StuUser findStuUserByName(String loginName) {
        return stuUserMapper.findStuUserByName(loginName);
    }
    @Override
    public StuUser findStuUserUpdateByName(StuUser stuUser) {
        return stuUserMapper.findStuUserUpdateByName(stuUser);
    }
}
