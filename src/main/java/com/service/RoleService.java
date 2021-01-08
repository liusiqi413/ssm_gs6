package com.service;

import com.entity.Role;
import com.vo.RoleVo;

import java.util.List;

public interface RoleService {
    List<Role> findRoleList(RoleVo rolevo);
    /*
    保存角色菜单关系
     */
    int saveRoleMenu(String ids, Integer roleId);
}
