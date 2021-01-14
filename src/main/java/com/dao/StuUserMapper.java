package com.dao;

import com.entity.StuUser;
import com.vo.StuUserVo;
import com.vo.StuVo;

import java.util.List;

public interface StuUserMapper {
    /*
    根据用户名查询用户信息
     */
    StuUser findStuUserByName(String loginName);
    /*
   查询学生列表
    */
    List<StuUser> findStuUserList(StuUserVo stuVo);
}
