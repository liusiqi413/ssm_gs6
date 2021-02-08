<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
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
            <li data-id="index" class="layui-nav-item layui-hide-xs layui-this">
                <a class="fly-case-active" data-type="toTopNav" href="home.jsp">首页</a>
            </li>
            <li data-id="room" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav" href="info.jsp">信息填写</a>
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
                <p class="temp-title-cn"><span></span>信息填写<span></span></p>
                <%--隐藏域，保存当前登录用户的ID--%>
                <input type="hidden" id="currentStuId" value="${sessionScope.currentUser.id}">
                <!-- 示例-970 -->
                <ins class="adsbygoogle" style="display:inline-block;width:970px;height:90px" data-ad-client="ca-pub-6111334333458862" data-ad-slot="3820120620"></ins>

                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                    <legend>初始赋值演示</legend>
                </fieldset>

                <form class="layui-form" action="" lay-filter="example">
                    <div class="layui-form-item">
                        <label class="layui-form-label">输入框</label>
                        <div class="layui-input-block">
                            <input type="text" name="username" lay-verify="title" autocomplete="off" disabled="disabled" value="readonly" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码框</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">选择框</label>
                        <div class="layui-input-block">
                            <select name="interest" lay-filter="aihao">
                                <option value=""></option>
                                <option value="0">写作</option>
                                <option value="1">阅读</option>
                                <option value="2">游戏</option>
                                <option value="3">音乐</option>
                                <option value="4">旅行</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">复选框</label>
                        <div class="layui-input-block">
                            <input type="checkbox" name="like[write]" title="写作">
                            <input type="checkbox" name="like[read]" title="阅读">
                            <input type="checkbox" name="like[daze]" title="发呆">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">开关</label>
                        <div class="layui-input-block">
                            <input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">单选框</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="男" title="男" checked="">
                            <input type="radio" name="sex" value="女" title="女">
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">文本域</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" class="layui-textarea" name="desc"></textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>