package com.service.impl;

import com.dao.MenuMapper;
import com.entity.Menu;
import com.service.MenuService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuMapper menuMapper;
    /**
     * 查询所有菜单列表
     *
     * @return
     */
    public List<Menu> findMenuList() {

        return menuMapper.findMenuList();
    }
}
