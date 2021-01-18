package com.service.impl;

import com.dao.StuEmpMapper;
import com.entity.StuEmp;
import com.service.StuEmpService;
import com.vo.StuEmpVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class StuEmpServicImp implements StuEmpService {
    @Resource
    private StuEmpMapper stuEmpMapper;
    public List<StuEmp> findStuEmpList(StuEmpVo stuEmpVo){
        return stuEmpMapper.findStuEmpList(stuEmpVo);
    }

    @Override
    public int addStuEmp(StuEmp stuEmp) {
        return stuEmpMapper.addStuEmp(stuEmp);
    }

    @Override
    public int updateStuEmp(StuEmp stuEmp) {
        return stuEmpMapper.updateStuEmp(stuEmp);
    }

    @Override
    public int deleteStuEmpById(Integer id) {
        return stuEmpMapper.deleteStuEmpById(id);
    }

    @Override
    public StuEmp findStuEmpNoByName(String stuno) {
        return stuEmpMapper.findStuEmpNoByName(stuno);
    }
}
