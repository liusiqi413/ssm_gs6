<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" class="fly-html-layui fly-html-store">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/front/layui/dist/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/front/css/global.css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/front/css/global(1).css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/front/css/store.css" charset="utf-8">
    <link rel="icon" href="${pageContext.request.contextPath}/static/layui/images/tim.jpeg">
    <title>修改密码</title>
</head>
<body>
<div class="layui-header header header-store" style="background-color: #393D49;">
    <div class="layui-container">
        <a class="logo" href="home.html">
            <img src="${pageContext.request.contextPath}/static/front/images/logo.png" alt="layui">
        </a>
        <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
        <ul class="layui-nav" id="layui-nav-userinfo">
            <li data-id="index" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav" href="home.html">首页</a>
            </li>
            <li data-id="addInfo" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav" href="info.html">信息填写</a>
            </li>
            <li data-id="editInfo" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav" href="edit.html">信息修改</a>
            </li>
            <li data-id="login" class="layui-nav-item layui-hide-xs layui-this">
                <a class="fly-case-active" data-type="toTopNav" href="reset.jsp">密码修改</a></li>
        </ul>
    </div>
</div>
<div class="layuimini-container">
    <div class="layuimini-main">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend></legend>
        </fieldset>
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">原密码：</label>
                <div class="layui-input-inline">
                    <input name="passWord" type="password"  id="oldPwd" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码：</label>
                <div class="layui-input-inline">
                    <input type="password" name="passWord" id="newPwd" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码：</label>
                <div class="layui-input-inline">
                    <input type="password" name="passWord" id="conformPwd" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form','jquery','layer'], function () {
        var $ = layui.jquery,
            form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            pass: [
                /^[\S]{6,12}$/
                , '密码必须6到12位，且不能出现空格'
            ]
        });
        var flag = false;//定义变量，标识是否存在
        var loginName='${sessionScope.currentUser.loginName}';
        //当用户名输入框失去焦点事件触发验证
        $("#oldPwd").blur(function () {
            //获取密码
            var loginPwd=$("#oldPwd").val().trim();
            //判断密码是否为空，不为空则发送请求验证
            if(loginPwd.length>0){
                $.get("/reset",{"loginName":loginName,"loginPwd":loginPwd},function(result){
                    if(result.exist){
                        //修改状态为true，表示已存在
                        flag = true;
                    }else{
                        flag = false;//不存在
                        layer.alert(result.message,{icon:5});
                    }
                },"json");
            }else{
                layer.msg("旧密码不能为空！");
            }
        });
        /*
        比较新旧密码是否一致
         */
        $("#conformPwd").blur(function () {
            var loginPas=$("#oldPwd").val().trim();
            var newPas=$("#newPwd").val().trim();
            var confirm=$("#conformPwd").val().trim();
            if(confirm!=newPas){
                layer.alert("俩次密码不一致",{icon:5});
                flag=false;
            }else if(loginPas==newPas){
                layer.alert("新密码不能为以前的旧密码",{icon:5});
                flag=false;
            }
            else{

            }
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            if(flag){
                var newloginPwd=$("#newPwd").val().trim();
                $.post("/updateUserPassword",{"loginName":loginName,"passWord":newloginPwd},function (result) {
                    if (result.success){
                        //提示信息
                        layer.alert(result.message);
                        window.setTimeout("location.href='/login.jsp'",3000);
                    }
                }, "json");
            }else {
                var oldLogin=$("#oldPwd").val().trim();
                var newLogin=$("#newPwd").val().trim();
                var newconfirm=$("#conformPwd").val().trim();
                if(newconfirm!=newLogin){
                    layer.alert("新密码和确认密码不一致，请重新输入！",{icon:5})
                }else if(oldLogin==newLogin){
                    layer.alert("新密码不能为旧密码，请重新输入！",{icon:5})
                }else{
                    layer.alert("旧密码错误！",{icon:5});
                }
            }
            return false;
        });

    });
</script>
</body>
</html>
