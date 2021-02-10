<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" class="fly-html-layui fly-html-store">
<head>
    <meta charset="utf-8">
    <title>邢台学院</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/front/layui/dist/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/front/css/global.css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/front/css/global(1).css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/front/css/store.css" charset="utf-8">
    <link rel="icon" href="${pageContext.request.contextPath}/static/layui/images/tim.jpeg">
</head>
<body>
<!-- 顶部start -->
<div class="layui-header header header-store" style="background-color: #393D49;">
    <div class="layui-container">
        <a class="logo" href="index.html">
            <img src="${pageContext.request.contextPath}/static/front/images/logo.png" alt="layui">
        </a>
        <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
        <ul class="layui-nav" id="layui-nav-userinfo">
            <li data-id="index" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav" href="home.html">首页</a>
            </li>
            <li data-id="room" class="layui-nav-item layui-hide-xs layui-this">
                <a class="fly-case-active" data-type="toTopNav" href="info.html">信息填写</a>
            </li>
            <li data-id="login" class="layui-nav-item layui-hide-xs "><a class="fly-case-active" data-type="toTopNav"
                                                                         href="JavaScript:void(0);">密码修改</a></li>
        </ul>
    </div>
</div>
<!-- 顶部end -->
<div class="shop-nav shop-index">
    <div class="shop-banner">
        <div class="shop-temp" id="getIndexFloor">
            <div class="layui-container">
                <!-- 示例-970 -->
                <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                    <legend>信息填写</legend>
                </fieldset>
                <c:forEach var="student" items="${stuList}">
                <div data-id="${student.id}" >
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学号</label>
                            <div class="layui-input-block">
                                <input type="text" name="stuno" id="stuno" value="${student.stuno}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuname" value="${student.stuname}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuname" value="${student.gender}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">学院</label>
                            <div class="layui-input-block">
                                <input type="text" name="college" id="college" value="${student.college}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">专业</label>
                            <div class="layui-input-inline">
                                <input type="text" name="major" value="${student.major}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">班级</label>
                            <div class="layui-input-inline">
                                <input type="text" name="classes" value="${student.classes}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">入学日期</label>
                            <div class="layui-input-block">
                                <input type="text"  value="<fmt:formatDate value="${student.start}" pattern="yyyy-MM-dd"/>" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">毕业日期</label>
                            <div class="layui-input-inline">
                                <input type="text"  value="<fmt:formatDate value="${student.gradu}" pattern="yyyy-MM-dd"/>" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学历</label>
                            <div class="layui-input-inline">
                                <input type="text" name="diploma" value="${student.diploma}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">培养方式</label>
                            <div class="layui-input-block">
                                <input type="text" name="train" id="train" value="${student.train}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    </div>
                </c:forEach>
                <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                    <label class="layui-form-label">电话号码：</label>
                    <div class="layui-input-inline">
                        <input name="stutel" type="text" id="stutel" lay-verify="required" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
                    </div>
                    </div>
                    <div class="layui-inline">
                    <label class="layui-form-label">高考考号：</label>
                    <div class="layui-input-inline">
                        <input type="text" name="examno" id="examno" autocomplete="off" class="layui-input">
                    </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                    <label class="layui-form-label">身份证号：</label>
                    <div class="layui-input-inline">
                        <input type="text" name="idcard" id="idcard" placeholder="请输入身份证号" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                    </div>
                    <div class="layui-inline">
                    <label class="layui-form-label">生源地：</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stuaddr" id="stuaddr" placeholder="请输入生源地" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                    <label class="layui-form-label">家庭住址：</label>
                    <div class="layui-input-inline">
                        <input type="text" name="homeaddr" id="homeaddr" placeholder="请输入家庭住址" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                    </div>
                    <div class="layui-inline">
                    <label class="layui-form-label">民族：</label>
                    <div class="layui-input-inline">
                        <input type="text" name="ethnic" id="ethnic" placeholder="请输入民族" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                    <label class="layui-form-label">出生日期</label>
                    <div class="layui-input-block">
                        <input type="date" name="birth" id="birth" lay-reqText="请输入入学时间" autocomplete="off"
                               placeholder="yyyy-MM-dd" class="layui-input">
                    </div>
                </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demoInfo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
                </form>
            </div>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>

<script>
    layui.use(['jquery','form','table','laydate','layer'], function () {
        var $ = layui.jquery;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
        var layer = layui.layer;
        //渲染日期组件
        laydate.render({
            elem:"#birth",
            type:"date"
        });
        //监听提交
        form.on('submit(demoInfo)', function(data){
            $.post()
        });
    });
</script>
</body>
</html>