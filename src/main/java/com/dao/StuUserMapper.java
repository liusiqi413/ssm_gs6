package com.dao;

import com.entity.StuUser;
import com.vo.StuUserVo;

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
}
