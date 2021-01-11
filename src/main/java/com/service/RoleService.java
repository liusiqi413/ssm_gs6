package com.service;

import com.entity.Role;
import com.vo.RoleVo;

import java.util.List;
import java.util.Map;

public interface RoleService {
    List<Role> findRoleList(RoleVo rolevo);
    /*
    保存角色菜单关系
     */
    int saveRoleMenu(String ids, Integer roleId);
    /*
    查询所有角色列表
     */
    List<Map<String,Object>> findRoleListByMap();
    /*
    根据老师ID查询该老师拥有的角色列表
     */
    List<Integer> findTeacherRoleByTeacherId(Integer teacherId);
}
