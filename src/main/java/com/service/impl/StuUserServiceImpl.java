package com.service.impl;

import com.dao.StuUserMapper;
import com.entity.StuUser;
import com.service.StuUserService;
import com.utils.PasswordUtil;
import com.utils.SystemConstant;
import com.utils.UUIDUtils;
import com.vo.StuUserVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class StuUserServiceImpl implements StuUserService {
@Resource
private StuUserMapper stuUserMapper;
    @Override
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
}
