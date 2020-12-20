package com.service;

import com.entity.Teacher;

public interface TeacherService {

    /**
     * 老师登录
     * @param loginName
     * @param loginPwd
     * @return
     */
    Teacher login(String loginName,String loginPwd);

}
