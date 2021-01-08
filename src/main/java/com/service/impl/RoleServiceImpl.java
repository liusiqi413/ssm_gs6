package com.service.impl;

import com.dao.RoleMapper;
import com.entity.Role;
import com.service.RoleService;
import com.vo.RoleVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;
    @Override
    public List<Role> findRoleList(RoleVo roleVo) {
        return roleMapper.findRoleList(roleVo);
    }

    @Override
    public int saveRoleMenu(String ids, Integer roleId) {
        try {
            //删除原有的菜单关系
            roleMapper.deleteRoleMenu(roleId);//根据角色ID删除
            //将ids拆分成数组
            String [] idsStr = ids.split(",");
            //循环调用
            for (int i = 0; i <idsStr.length ; i++) {
                //调用保存菜单角色关系的方法
                roleMapper.addRoleMenu(roleId,idsStr[i]);
            }
            return 1;//成功
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;//失败
    }
}
