package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.entity.Menu;
import com.entity.Teacher;
import com.service.MenuService;
import com.utils.MenuNode;
import com.utils.SystemConstant;
import com.utils.TreeUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/menu")
public class MenuController {
    //注入menuService
@Resource
    private MenuService menuService;
    /**
     * 加载首页左侧菜单导航
     * @param
     * @return
     */
    @RequestMapping("/loadMenuList")
    public String loadMenuList(HttpSession session){
        //创建Map集合，保存菜单信息
        Map<String,Object> map=new LinkedHashMap<String, Object>();
        //创建Map集合，保存homeInfo信息
        Map<String ,Object> homeInfo=new LinkedHashMap<String,Object>();
        //创建Map集合，保存logoInfo信息
        Map<String,Object> logoInfo=new LinkedHashMap<String, Object>();
        //调用查询所有列表的方法
       // List<Menu> menuList=menuService.findMenuList();
       //获取当前登录的老师
        Teacher teacher=(Teacher)session.getAttribute(SystemConstant.LOGINUSER);
        //根据当前老师的角色动态显示菜单列表
        List<Menu> menuList =menuService.findMenuListByTeacherId(teacher.getId());
        //创建集合，保存菜单关系
        List<MenuNode> menuNodeList=new ArrayList<MenuNode>();
        //循环遍历菜单列表，创建菜单层级关系
        for (Menu menu:menuList) {
            //创建菜单节点对象
            MenuNode menuNode = new MenuNode();
            menuNode.setId(menu.getId());  //菜单编
            menuNode.setPid(menu.getPid());// 父级菜单编号
            menuNode.setHref(menu.getHref());        //链接地址
            menuNode.setSpread(menu.getSpread());   //是否展开
             menuNode.setIcon(menu.getIcon());       //菜单图标
            menuNode.setTarget(menu.getTarget());   //打开方式
            menuNode.setTitle(menu.getTitle());     //菜单名称
            //将对象添加到集合
            menuNodeList.add(menuNode);
            //将首页菜单信息添加到MenuInfo集合中
        }
            //保存HomeInfo信息
            homeInfo.put("title","首页");
            homeInfo.put("href","/admin/login");

            //保存logoInfo信息
            logoInfo.put("title","就业管理系统");  //logo标题
            logoInfo.put("image","/static/layui/images/tim.jpeg");//logo图片
            logoInfo.put("href","/admin/home.html");//首页地址

            //将菜单信息添加到MmenuInfo集合中
            map.put("menuInfo", TreeUtil.toTree(menuNodeList,0));
            map.put("homeInfo",homeInfo);
            map.put("logoInfo",logoInfo);

            return JSON.toJSONString(map);

        }
    }