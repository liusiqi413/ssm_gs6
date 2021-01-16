package com.dao;

import com.entity.StuUser;

public interface UserMapper {
    /**
     * 根据用户名查询用户信息
     * @param loginName
     * @return
     */

    StuUser findUserByName(String loginName);

}
