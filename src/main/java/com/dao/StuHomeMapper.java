package com.dao;


import com.entity.StudentHome;
import com.vo.StuHomeVo;

import java.util.List;

public interface StuHomeMapper {
    /*
    查询学生生源地列表
     */
    List<StudentHome> findStuHomeList(StuHomeVo stuHomeVo);
}
