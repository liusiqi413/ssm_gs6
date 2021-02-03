package com.service;

import com.entity.Hire;
import com.vo.HireVo;

import java.util.List;

public interface HireService {
/*
查询招聘信息列表
 */
    List<Hire> findHireList(HireVo hirevo);
    /*
    添加招聘信息
     */
int addHire(Hire hire);
    /*
       修改招聘信息
        */
    int updateHire(Hire hire);
    /**
     * 删除招聘信息
     */
    int deleteById(int id);
    /*
    查询公司名称列表
     */
    List<Hire>findCompanyListById();
    /*
查询招聘详情
 */
    Hire findById(Integer id);
}
