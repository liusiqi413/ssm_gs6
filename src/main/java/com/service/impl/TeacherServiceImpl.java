package com.service.impl;

import com.dao.TeacherMapper;
import com.entity.Teacher;
import com.service.TeacherService;
import com.utils.PasswordUtil;
import com.utils.SystemConstant;
import com.utils.PasswordUtil;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.lang.annotation.Target;
import java.util.Date;
import java.util.List;


@Service
@Transactional
public class TeacherServiceImpl implements TeacherService {

    @Resource
    private TeacherMapper TeacherMapper;

    /**
     * 老师登录
     *
     * @param loginName
     * @param loginPwd
     * @return
     */
    public Teacher login(String loginName, String loginPwd) {
//        //调用根据账号查询老师信息的方法
        Teacher teacher = TeacherMapper.findTeacherByLoginName(loginName);
//        //判断对象是否为空
        if(teacher!=null){
            //将密码加密处理
            String newPassword = PasswordUtil.md5(loginPwd,teacher.getSalt(), SystemConstant.PASSWORD_COUNT);
            //比较密码是否一致
            if(teacher.getLoginPwd().equals(newPassword)){
                return teacher;//登录成功
            }
        }
//        登录失败

        return null;
    }
}
