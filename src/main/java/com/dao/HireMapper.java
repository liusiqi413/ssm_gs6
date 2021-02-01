package com.dao;

import com.entity.Hire;
import com.vo.HireVo;

import java.util.List;

public interface HireMapper {
/*
查询招聘列表
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
}
