package com.entity;

public class Teacher {
    private Integer id;//编号
    private String loginName;//登录名称
    private String loginPwd;//登录密码
    private String name;//真实姓名
    private Integer gender;//性别 1-女 2-男
    private Integer deptId;//所属院系
    private String salt;//加密盐值

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPwd() {
        return loginPwd;
    }

    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }


}