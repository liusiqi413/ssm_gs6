package com.dao;

import com.entity.Menu;

import java.util.List;

public interface MenuMapper {
    /**
     * 查询所有菜单列表
     *
     * @return
     */
    List<Menu> findMenuList();
/*
根据角色ID查询该角色拥有的菜单ID集合
 */
List<Integer> findMenuIdListByRoleId(int roleId);

/*
根据菜单编号查询菜单信息
 */
    List<Menu> findMenuByMenuId(List<Integer> currentRoleMenuIds);
    /*
    根据当前登录老师的角色查询菜单列表
     */
    List<Menu> findMenuListByTeacherId(Integer teacherId);
}
