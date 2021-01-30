package com.service.impl;

import com.dao.HireMapper;
import com.entity.Hire;
import com.service.HireService;
import com.vo.HireVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
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
}
