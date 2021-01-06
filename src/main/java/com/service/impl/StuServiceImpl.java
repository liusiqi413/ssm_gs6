package com.service.impl;

import com.dao.StuMapper;
import com.entity.Student;
import com.service.StuService;
import com.vo.StuVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class StuServiceImpl implements StuService {
    @Resource
    private StuMapper stuMapper;
    @Override
    public List<Student> findStuList(StuVo stuVo) {
        return stuMapper.findStuList(stuVo);
    }

    @Override
    public int addStu(Student student) {
        return stuMapper.addStu(student);
    }

    @Override
    public int updateStu(Student student) {
        return stuMapper.updateStu(student);
    }

    @Override
    public int deleteById(Integer id) {
        return stuMapper.deleteById(id);
    }
}
