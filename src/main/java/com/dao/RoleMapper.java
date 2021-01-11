package com.dao;

import com.entity.Role;
import com.vo.RoleVo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
    /*
    查询角色列表
     */
    List<Role> findRoleList(RoleVo roleVo);
/*
删除原有关系
 */
    @Delete("delete from sys_role_menu where rid=#{roleId}")
    void deleteRoleMenu(Integer roleId);
    /**
     * 添加角色菜单关系数据
     * @param roleId
     * @param menuId
     */
    @Insert("insert into sys_role_menu(mid,rid) values(#{menuId},#{roleId})")
    void addRoleMenu(@Param("roleId") Integer roleId, @Param("menuId") String menuId);
/*
查询所有角色列表
 */
    List <Map<String,Object>>findRoleListByMap();
    /*
    根据老师ID查询该老师拥有的据谔谔色列表
     */
    List<Integer> findTeacherRoleByTeacherId(Integer teacherId);

}
