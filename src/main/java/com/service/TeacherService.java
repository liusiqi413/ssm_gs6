package com.service;

import com.entity.Teacher;
import com.vo.TeacherVo;

import java.util.List;

public interface TeacherService {

    /**
     * 老师登录
     * @param loginName
     * @param loginPwd
     * @return
     */
    Teacher login(String loginName,String loginPwd);
    /*
    查询老师列表
     */
    List<Teacher> findTeacherList(TeacherVo teacherVo);
    /*
   添加老师
    */
    int addTeacher(Teacher teacher);
    /*
    修改老师
     */
    int updateTeacher(Teacher teacher);
    /*
   删除老师
    */
    int deleteById(Integer id);
/*
重置密码
 */
    int resetPwd(int id);
/*
保存老师角色关系
 */
    boolean saveTeacherRole(String roleIds, Integer teachId);

    Teacher findTeacherByLoginName(String loginName);

    Teacher findLoginPwdByLoginName(String loginName,String loginPwd);
    /*
  修改密码
   */
    int updateTeacherPassword(Teacher teacher);
}
