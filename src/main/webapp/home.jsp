<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>邢台学院毕业生就业首页</title>
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
                <a class="fly-case-active" data-type="toTopNav" href="JavaScript:void(0);">首页</a>
            </li>
            <li data-id="room" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav" href="JavaScript:void(0);">信息填写</a>
            </li>
            <li data-id="login" class="layui-nav-item layui-hide-xs "><a class="fly-case-active" data-type="toTopNav"
                                                                         href="JavaScript:void(0);">密码修改</a></li>
        </ul>
    </div>
</div>
<!-- 顶部end -->

<!-- 中间区域开始 -->
<div class="shop-nav shop-index">
    <div class="shop-banner">
        <!-- 轮播图开始 -->
        <div class="layui-carousel" lay-filter="LAY-store-banner" id="LAY-store-banner" lay-anim lay-indicator="inside" >
            <div carousel-item>
                <div class="layui-this">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt7.png" alt="邢台学院"></a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt8.png" alt="邢台学院"></a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt9.png" alt="邢台学院"> </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt1.jpg" alt="邢台学院"> </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt3.jpg" alt="邢台学院"> </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt4.jpg" alt="邢台学院"> </a>
                    </div>
                </div>
            </div>


            <div class="layui-carousel-ind">
                <ul>
                    <li class="layui-this"></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                </ul>
            </div>
            <button class="layui-icon layui-carousel-arrow" lay-type="sub"></button>
            <button class="layui-icon layui-carousel-arrow" lay-type="add"></button>
        </div>
        <!-- 轮播图结束 -->

        <!-- 酒店楼层开始 -->
        <div class="shop-temp" id="getIndexFloor">
            <div class="temp-hot">
                <div class="layui-container">
                    <p class="temp-title-cn"><span></span>招聘公司<span></span></p>
                    <div class="layui-row layui-col-space20">
                        <c:forEach var="hire" items="${hireList}">
                        <div data-id="${hire.id}" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="/company/${hire.id}.html" data-type="toRoomInfo">
<%--                                <img src="/company/show/${hire.photo}" class="store-list-cover">--%>
                                <h2 class="layui-elip">${hire.companyName}</h2>
                            </a>
                        </div>
<%--                            <div class="mn z view view2 infoB" id="mn">--%>
<%--                            <div class="infoBox campus-index-front-list">--%>
<%--                                <ul class="infoTit">--%>
<%--                                    <li class="span4" style="width:740px">招聘公告名称</li>--%>
<%--                                    <li class="span"7 style="width:150px">发布时间</li>--%>
<%--                                </ul>--%>
<%--                                <ul class="infoList">--%>
<%--                                    <li class="span4"style="width:740px"><a href="/company/${hire.id}.html" target="_blank">${hire.companyName}</a></li>--%>
<%--                                    <li class="span7" style="width:150px">${hire.times}</li>--%>
<%--                                </ul>--%>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
        <!-- 酒店楼层结束 -->

    </div>
</div>
<!-- 中间区域结束 -->

<!-- 底部 -->
<div class="fly-footer">
    <p><a href="#">邢台学院</a> 2020 © <a href="#">test.cn</a></p>

</div>


<!-- 脚本开始 -->
<script src="${pageContext.request.contextPath}/static/front/layui/dist/layui.js"></script>
<script>
    layui.use(["form","element","carousel"], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            carousel = layui.carousel,
            $ = layui.$;

        //渲染轮播图
        carousel.render({
            elem: '#LAY-store-banner'
            ,width: '100%' //设置容器宽度
            ,height: '460' //设置容器高度
            ,arrow: 'always' //始终显示箭头
        });
    });
</script>
<!-- 脚本结束 -->
<ul class="layui-fixbar">
    <li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li>
</ul>
<div class="layui-layer-move"></div>

</body>
</html>
