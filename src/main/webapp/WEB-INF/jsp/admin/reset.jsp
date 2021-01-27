<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
            <legend></legend>
        </fieldset>

        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">原密码：</label>
                <div class="layui-input-inline">
                    <input name="loginPwd" type="password"  id="oldPwd" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码：</label>
                <div class="layui-input-inline">
                    <input type="password" name="loginPwd" id="newPwd" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码：</label>
                <div class="layui-input-inline">
                    <input type="password" name="loginPwd" id="conformPwd" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
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
        var loginName='${sessionScope.loginUser.loginName}';
        //当用户名输入框失去焦点事件触发验证
        $("#oldPwd").blur(function () {
            //获取密码
            var loginPwd=$("#oldPwd").val().trim();
            //判断密码是否为空，不为空则发送请求验证
            if(loginPwd.length>0){
                $.get("/admin/teacher/reset",{"loginName":loginName,"loginPwd":loginPwd},function(result){
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
                $.post("/admin/teacher/updateTeacherPassword",{"loginName":loginName,"loginPwd":newloginPwd},function (result) {
                    if (result.success){
                    //提示信息
                    layer.msg(result.message);}
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
