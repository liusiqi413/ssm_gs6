package com.dao;

import com.entity.Hire;

import java.util.List;

public interface HireMapper {
/*
查询招聘列表
 */
List<Hire> findHireList(Hire hire);
}
