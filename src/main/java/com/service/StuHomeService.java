package com.service;

import com.entity.StudentHome;
import com.vo.StuHomeVo;

import java.util.List;

public interface StuHomeService {
    List<StudentHome> findStuHomeList(StuHomeVo stuHomeVo);

    int updateStuHome(StudentHome studentHome);

    int deleteStuHomeById(Integer id);
}