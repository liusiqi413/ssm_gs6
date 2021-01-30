package com.service;

import com.entity.Hire;
import com.vo.HireVo;

import java.util.List;

public interface HireService {
/*
查询招聘信息列表
 */
    List<Hire> findHireList(HireVo hirevo);
}
