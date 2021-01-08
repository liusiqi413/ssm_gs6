package com.service;

import com.entity.Menu;

import java.util.List;

public interface MenuService {
    /**
     * 查询所有菜单列表
     * @return
     */
    List<Menu> findMenuList();
    List<Integer> findMenuIdListByRoleId(int roleId);
    /*
    根据菜单编号查询菜单信息
     */
    List<Menu>findMenuByMenuId(List<Integer> currentRoleMenuIds);
}
