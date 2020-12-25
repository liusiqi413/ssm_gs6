package com.service.impl;

import com.dao.StuHomeMapper;
import com.entity.StudentHome;
import com.service.StuHomeService;
import com.vo.StuHomeVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class StuHomeServiceImpl implements StuHomeService {
    @Resource
    private StuHomeMapper stuHomeMapper;
    public List<StudentHome> findStuHomeList(StuHomeVo stuHomeVo){
        return stuHomeMapper.findStuHomeList(stuHomeVo);
    }

}
