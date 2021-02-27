package com.dao;

import com.entity.Teacher;
import com.vo.TeacherVo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {

    /**
     * 根据登录账号查询老师信息
     * @param loginName
     * @return
     */
    Teacher findTeacherByLoginName(String loginName);
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
查询密码
 */
    Teacher findLoginPwdByLoginName(String loginName);
/*
删除老师角色关系表
 */
    void deleteTeacherAndRole(Integer id);
    /*
    保存老师角色关系
     */
   @Insert("insert into sys_role_teacher(tid,rid) values(#{tid},#{rid})")
    void addTeacherRole(@Param("rid") String roleId, @Param("tid") Integer teachId);
   /*
   修改密码
    */
   int updateTeacherPassword(Teacher teacher);
}
