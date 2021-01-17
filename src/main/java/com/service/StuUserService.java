package com.service;

import com.entity.StuUser;
import com.vo.StuUserVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface StuUserService{

/*
列表查询
 */
    List<StuUser> findStuUserList(StuUserVo stuUserVo);
    /*
    添加用户
     */
    int addStuUser(StuUser stuUser);
/*
修改学生账户
 */
    int updateStuUser(StuUser stuUser);
    /*
    删除学生
     */
    int deleteStuUserById(Integer id);
    /*
   批量导入
    */
    String ajaxUploadExcel(MultipartFile file, HttpServletRequest request, HttpServletResponse response);
    /*
    根据用户名查询用户信息
     */
    StuUser findStuUserByName(String loginName);
}
