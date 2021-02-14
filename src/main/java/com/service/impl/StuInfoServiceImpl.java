package com.service.impl;

import com.dao.StuInfoMapper;
import com.entity.StuEmp;
import com.entity.Student;
import com.service.StuInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
@Service
@Transactional
public class StuInfoServiceImpl implements StuInfoService {
    @Resource
    private StuInfoMapper stuInfoMapper;

    public int updateInfo(Student student) {
        return stuInfoMapper.updateInfo(student);
    }

    @Override
    public int addEmp(StuEmp stuEmp) {
        return stuInfoMapper.addEmp(stuEmp);
    }
}