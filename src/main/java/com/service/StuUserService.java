package com.service;

import com.entity.StuUser;
import com.vo.StuUserVo;

import java.util.List;

public interface StuUserService{
    /*
    用户登录
     */
   StuUser login(String loginName, String passWord);

    List<StuUser> findStuUserList(StuUserVo stuUserVo);
}
