package com.service.impl;

import com.dao.StuInfoMapper;
import com.dao.StuUserMapper;
import com.entity.*;
import com.service.StuInfoService;
import com.utils.PasswordUtil;
import com.utils.SystemConstant;
import com.utils.UUIDUtils;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class StuInfoServiceImpl implements StuInfoService {
    @Resource
    private StuInfoMapper stuInfoMapper;

    public int updateInfo(Student student) {
        student.setStatus(1);
        return stuInfoMapper.updateInfo(student);
    }

    @Override
    public int addEmp(StuEmp stuEmp) {
        stuEmp.setStatus(1);
        return stuInfoMapper.addEmp(stuEmp);
    }

    @Override
    public StuEmp findStuEmpByName(StuEmp stuEmp) {
        return stuInfoMapper.findStuEmpByName(stuEmp);
    }

    public StuMaster findStuMasterByName(StuMaster stuMaster) {
        return stuInfoMapper.findStuMasterByName(stuMaster);
    }

    @Override
    public int addMaster(StuMaster stuMaster) {
        stuMaster.setStatus(1);
        return stuInfoMapper.addMaster(stuMaster);
    }

    @Override
    public Student findStuInfoByName(Student student) {
        return stuInfoMapper.findStuInfoByName(student);
    }

    @Override
    public List<StuEmp> findStuEmpByStuno(String stuno) {
        return stuInfoMapper.findStuEmpByStuno(stuno);
    }

    @Override
    public int updateEditEmp(StuEmp stuEmp) {
        stuEmp.setStatus(1);
        return stuInfoMapper.updateEditEmp(stuEmp);
    }

    @Override
    public List<StuMaster> findStuMasterByStuno(String stuno) {
        return stuInfoMapper.findStuMasterByStuno(stuno);
    }

    @Override
    public int updateEditMaster(StuMaster stuMaster) {
        stuMaster.setStatus(1);
        return stuInfoMapper.updateEditMaster(stuMaster);
    }

    @Override
    public StuUser findLoginPwdByLoginName(String loginName, String loginPwd) {
        StuUser oldUser = stuInfoMapper.findLoginPwdByLoginName(loginName);
        if(oldUser !=null) {
            String newPassword = PasswordUtil.md5(loginPwd, oldUser.getSalt(), SystemConstant.PASSWORD_COUNT);
            if (oldUser.getPassWord().equals(newPassword)) {
                return oldUser;
            }
        }
        return null;
    }

    @Override
    public int updateUserPassword(StuUser stuUser) {
        //自动生成盐值
        stuUser.setSalt(UUIDUtils.randomUUID());
        //密码加密
        stuUser.setPassWord(PasswordUtil.md5(stuUser.getPassWord(),stuUser.getSalt(),SystemConstant.PASSWORD_COUNT));

        return stuInfoMapper.updateUserPassword(stuUser);
    }
}