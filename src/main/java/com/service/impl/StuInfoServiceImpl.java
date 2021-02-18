package com.service.impl;

import com.dao.StuInfoMapper;
import com.entity.StuEmp;
import com.entity.StuMaster;
import com.entity.Student;
import com.service.StuInfoService;
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
    public int updateEditEmp(StuEmp stump) {
        return stuInfoMapper.updateEditEmp(stump);
    }

    @Override
    public List<StuMaster> findStuMasterByStuno(String stuno) {
        return stuInfoMapper.findStuMasterByStuno(stuno);
    }

    @Override
    public int updateEditMaster(StuMaster stuMaster) {
        return stuInfoMapper.updateEditMaster(stuMaster);
    }
}