package com.service.impl;

import com.dao.UserMapper;
import com.entity.StuUser;
import com.service.UserService;
import com.utils.PasswordUtil;
import com.utils.SystemConstant;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public StuUser findUserByName(String loginName) {
        return userMapper.findUserByName(loginName);
    }

    public StuUser login(String loginName, String passWord){
        StuUser loginUser= userMapper.findUserByName(loginName);
        if(loginUser!=null){
            //密码加密
            String newPassword = PasswordUtil.md5(passWord, loginUser.getSalt(), SystemConstant.PASSWORD_COUNT);
            //比较密码是否相等
            if(loginUser.getPassWord().equals(newPassword)){
                return loginUser;
            }
        }
        return null;
    }
}
