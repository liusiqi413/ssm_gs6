package com.controller.admin;

import com.alibaba.fastjson.JSON;
import com.entity.Teacher;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.TeacherService;
import com.utils.DataGridViewResult;
import com.utils.SystemConstant;
import com.vo.TeacherVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/teacher")
public class TeacherController {


    @Resource
    private TeacherService teacherService;


    /**
     * 教师登录
     * @param username
     * @param password
     * @param session
     * @return
     */
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session){
        Map<String,Object> map = new HashMap<String,Object>();
        //调用老师登录的方法
        Teacher teacher = teacherService.login(username, password);
        //判断对象是否为空，不为空表示登录成功
        if(teacher!=null){
            //保存当前登录用户
            session.setAttribute(SystemConstant.LOGINUSER,teacher);
            map.put(SystemConstant.SUCCESS,true);//成功
        }else{
            map.put(SystemConstant.SUCCESS,false);//失败
            map.put(SystemConstant.MESSAGE,"账号密码错误，登录失败");
        }
        return JSON.toJSONString(map);
    }
    /*
    查询
     */
    @RequestMapping("/list")
    public DataGridViewResult list(TeacherVo teacherVo){
        //设置分页信息
        PageHelper.startPage(teacherVo.getPage(),teacherVo.getLimit());
//            调用分页查询方法
        List<Teacher> teacherList=teacherService.findTeacherList(teacherVo);
//            创建分页对象
        PageInfo<Teacher> pageInfo=new PageInfo<Teacher>(teacherList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
    /*
    添加老师
     */
    @RequestMapping("/addTeacher")
    public String addTeacher(Teacher teacher,HttpSession session){
        Map<String,Object> map=new HashMap<String, Object>();
        //获取当前登录用户
        Teacher loginUser=(Teacher)session.getAttribute(SystemConstant.LOGINUSER);
        if(teacherService.addTeacher(teacher)>0){
                map.put(SystemConstant.SUCCESS,true);//成功
                map.put(SystemConstant.MESSAGE,"添加成功");
            }else{
                map.put(SystemConstant.SUCCESS,false);//失败
                map.put(SystemConstant.MESSAGE,"添加失败");
            }
            //将map集合以JSON格式返回
            return JSON.toJSONString(map);
        }
    /*
修改老师
 */
    @RequestMapping("/updateTeacher")
    public String updateTeacher(Teacher teacher,HttpSession session){
        Map<String,Object> map=new HashMap<String, Object>();
        //获取当前登录用户
        Teacher loginUser=(Teacher)session.getAttribute(SystemConstant.LOGINUSER);
        if(teacherService.updateTeacher(teacher)>0){
            map.put(SystemConstant.SUCCESS,true);//成功
            map.put(SystemConstant.MESSAGE,"修改成功");
        }else{
            map.put(SystemConstant.SUCCESS,false);//失败
            map.put(SystemConstant.MESSAGE,"修改失败");
        }
        //将map集合以JSON格式返回
        return JSON.toJSONString(map);
    }
    /*
   删除学生
    */
    @RequestMapping("/deleteById")
    public String deleteById(int id){
        Map<String,Object> map=new HashMap<String, Object>();
        if(teacherService.deleteById(id)>0){
            map.put("success",true);
            map.put("message","删除成功");
        }else{
            map.put("success",false);
            map.put("message","删除失败");
        }
        return JSON.toJSONString(map);
    }
    /**
     * 重置密码
     * @param id
     * @return
     */
    @RequestMapping("/resetPwd")
    public String resetPwd(int id){
        Map<String,Object> map = new HashMap<String,Object>();
        //调用重置密码的方法
        if(teacherService.resetPwd(id)>0){
            map.put(SystemConstant.SUCCESS, true);
            map.put(SystemConstant.MESSAGE, "密码重置成功");
        }else{
            map.put(SystemConstant.SUCCESS, false);
            map.put(SystemConstant.MESSAGE, "密码重置失败");
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/saveTeacherRole")
    public String saveTeacherRole(String roleIds,Integer teachId){
        Map<String,Object> map=new HashMap<String, Object>();
        //调用保存员工角色的方法
        if(teacherService.saveTeacherRole(roleIds,teachId)){
            map.put(SystemConstant.MESSAGE,"角色分配成功");
        }else{
            map.put(SystemConstant.MESSAGE,"角色分配失败");
        }
        return JSON.toJSONString(map);
    }
    @RequestMapping("/checkTeacherName")
    public String checkTeacherName(String loginName){
        //创建map集合保存结果信息
        Map<String,Object> map=new HashMap<String, Object>();
        //调用注册的方法
        if(teacherService.findTeacherByLoginName(loginName)!=null){
            map.put(SystemConstant.EXIST,true);
            map.put(SystemConstant.MESSAGE,"已有相同老师登录名，请重新输入！");
        }else{
            map.put(SystemConstant.EXIST,false);
        }
        return JSON.toJSONString(map);
    }
    }
