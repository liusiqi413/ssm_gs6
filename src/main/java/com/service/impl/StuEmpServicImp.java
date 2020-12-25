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
}
