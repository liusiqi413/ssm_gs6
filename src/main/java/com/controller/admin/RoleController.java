package com.controller.admin;


import com.alibaba.fastjson.JSON;
import com.entity.Menu;
import com.entity.Role;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.MenuService;
import com.service.RoleService;
import com.utils.DataGridViewResult;
import com.utils.SystemConstant;
import com.utils.TreeNode;
import com.vo.RoleVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("admin/role")
public class RoleController {
@Resource
    private RoleService roleService;
@Resource
private MenuService menuService;
/*
查询角色列表
 */
    @RequestMapping("list")
    public DataGridViewResult list(RoleVo roleVo){
        //设置分页信息
        PageHelper.startPage(roleVo.getPage(),roleVo.getLimit());
        //调用查询角色列表的方法
        List<Role> roleList = roleService.findRoleList(roleVo);
        //创建分页信息对象
        PageInfo<Role> pageInfo=new PageInfo<Role>(roleList);
        //返回数据 参数1：总数量 参数2：角色列表
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
    /*
    初始化菜单树
     */
    @RequestMapping("/initMenuTree")
    public DataGridViewResult initMenuTree(Integer roleId){
        //调用查询菜单列表的方法
        List<Menu> menuList = menuService.findMenuList();
        //调用根据角色ID查询该角色已经拥有的菜单ID的方法
        List<Integer> currentRoleMenuIds = menuService.findMenuIdListByRoleId(roleId);
        //定义集合，保存菜单信息
        List<Menu> currentMenus=new ArrayList<Menu>();
        //判断集合是否存在数据
        if(currentRoleMenuIds!=null && currentRoleMenuIds.size()>0){
            //根据菜单ID查询该菜单信息
            currentMenus=menuService.findMenuByMenuId(currentRoleMenuIds);
        }
        //创建集合保存树节点信息
        List<TreeNode> treeNodes=new ArrayList<TreeNode>();
        //循环遍历集合
        for(Menu menu:menuList){
            //定义变量，标识是否选中
            String checkArr="0";//0表示复选框不选中，1表示复选框选中
            //内层循环遍历当前角色拥有的权限菜单
            //循环比较的原因：比较俩个集合中的数据是否有相同的，有相同的表示当前角色拥有这个权限
            for(Menu currentMenu:currentMenus){
                //如果ID相等，表示当前角色有这个菜单，有这个菜单则需要将复选框选中
                if (menu.getId()==currentMenu.getId()){
                    checkArr="1";//选中
                    break;
                }
            }
            //定义变量，表示菜单是否展开
            Boolean spread=(menu.getSpread()==null || menu.getSpread()==1)?true:false;
            treeNodes.add(new TreeNode(menu.getId(),menu.getPid(),menu.getTitle(),spread,checkArr));
        }
        //将数据返回到页面
        return new DataGridViewResult(treeNodes);
    }
    /*
    分配菜单
     */
    @RequestMapping("/saveRoleMenu")
    public String saveRoleMenu(String ids,Integer roleId){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用保存菜单的方法
        if(roleService.saveRoleMenu(ids,roleId)>0){
            map.put("message","菜单分配成功");
        }else{
            map.put("message","菜单分配失败");
        }
        return JSON.toJSONString(map);
    }

}