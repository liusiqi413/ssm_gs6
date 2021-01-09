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
}
