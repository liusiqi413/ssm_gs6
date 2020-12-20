package com.dao;

import com.entity.Teacher;
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

}
