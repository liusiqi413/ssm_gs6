package com.service;

import com.entity.StuUser;

public interface UserService {

 StuUser findUserByName(String loginName);
    /**登录
     * @param loginName
     * @param passWord
     * @return
     */
    StuUser login(String loginName,String passWord);
}
