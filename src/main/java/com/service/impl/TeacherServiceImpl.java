package com.service.impl;

import com.dao.TeacherMapper;
import com.entity.Teacher;
import com.service.TeacherService;
import com.utils.PasswordUtil;
import com.utils.SystemConstant;
import com.utils.PasswordUtil;
import com.vo.TeacherVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.lang.annotation.Target;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Service
@Transactional
public class TeacherServiceImpl implements TeacherService {

    @Resource
    private TeacherMapper teacherMapper;

    /**
     * 老师登录
     *
     * @param loginName
     * @param loginPwd
     * @return
     */
    public Teacher login(String loginName, String loginPwd) {
//        //调用根据账号查询老师信息的方法
        Teacher teacher = teacherMapper.findTeacherByLoginName(loginName);
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

    @Override
    public List<Teacher> findTeacherList(TeacherVo teacherVo) {
        return teacherMapper.findTeacherList(teacherVo);
    }

    @Override
    public int addTeacher(Teacher teacher) {
        teacher.setSalt(UUID.randomUUID().toString().replace("-",""));//加密盐值
        teacher.setLoginPwd(PasswordUtil.md5(SystemConstant.default_login_pwd,teacher.getSalt(),SystemConstant.PASSWORD_COUNT));
        return teacherMapper.addTeacher(teacher);
    }

    @Override
    public int updateTeacher(Teacher teacher) {
       return teacherMapper.updateTeacher(teacher);
    }

    @Override
    public int deleteById(Integer id) {
        return teacherMapper.deleteById(id);
    }

    @Override
    public int resetPwd(int id) {
        Teacher teacher=new Teacher();
        teacher.setSalt(UUID.randomUUID().toString().replace("-",""));
        teacher.setLoginPwd(PasswordUtil.md5(SystemConstant.default_login_pwd,teacher.getSalt(),SystemConstant.PASSWORD_COUNT));
        teacher.setId(id);
        return teacherMapper.updateTeacher(teacher);
    }

    @Override
    public boolean saveTeacherRole(String roleIds, Integer teachId) {
        try {
            teacherMapper.deleteTeacherAndRole(teachId);
            //在保存老师角色关系
            String[] idStr = roleIds.split(",");
            for (int i = 0; i < idStr.length; i++) {
                teacherMapper.addTeacherRole(idStr[i], teachId);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
            return false;
        }
    }
