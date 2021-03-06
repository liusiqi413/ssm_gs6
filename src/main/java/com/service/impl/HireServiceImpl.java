package com.service.impl;

import com.dao.HireMapper;
import com.entity.Hire;
import com.service.HireService;
import com.vo.HireVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class HireServiceImpl implements HireService {
@Resource
private HireMapper hireMapper;
    @Override
    public List<Hire> findHireList(HireVo hirevo) {
        return hireMapper.findHireList(hirevo);
    }

    @Override
    public int addHire(Hire hire) {
        //保存创建时间
        hire.setTimes(new Date());
        return hireMapper.addHire(hire);
    }

    @Override
    public int updateHire(Hire hire) {
        return hireMapper.updateHire(hire);
    }

    @Override
    public int deleteById(int id) {
        return hireMapper.deleteById(id);
    }

    @Override
    public List<Hire> findCompanyListById() {
        return hireMapper.findCompanyListById();
    }

    @Override
    public Hire findById(Integer id) {
        return hireMapper.findById(id);
    }

    @Override
    public List<Hire> getAllUser() {
        return hireMapper.getAllUser();
    }
}
