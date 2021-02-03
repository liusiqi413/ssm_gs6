<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="icon" href="${pageContext.request.contextPath}/static/front/images/favicon.ico">
    <title>首页</title>
<body>
<!-- 顶部start -->
<div class="layui-header header header-store" style="background-color: #393D49;">
    <div class="layui-container">
        <a class="logo" href="index.html">
            <img src="${pageContext.request.contextPath}/static/front/images/logo.png" alt="layui">
        </a>
        <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
        <ul class="layui-nav" id="layui-nav-userinfo">
            <li data-id="index" class="layui-nav-item layui-hide-xs"><a class="fly-case-active" data-type="toTopNav"
                                                                        href="JavaScript:void(0);">首页</a></li>
            <li data-id="room" class="layui-nav-item layui-hide-xs layui-this"><a class="fly-case-active"
                                                                                  data-type="toTopNav"
                                                                                  href="JavaScript:void(0);">信息填写</a></li>
            <li data-id="login" class="layui-nav-item layui-hide-xs "><a class="fly-case-active" data-type="toTopNav"
                                                                         href="JavaScript:void(0);">密码修改</a></li>
            <span class="layui-nav-bar" style="left: 560px; top: 55px; width: 0px; opacity: 0;"></span></ul>
    </div>
</div>
<!-- 顶部end -->

<!-- 中间区域开始 -->
<div class="shop-nav shop-index">
</div>
<!-- 中间区域结束 -->

<!-- 房间详情start -->
<div class="layui-container shopdata">
    <div class="layui-card shopdata-intro">
        <div class="layui-card-header">
				<span class="layui-breadcrumb layui-hide-xs" style="visibility: visible;">
						 <a><cite>招聘详情</cite></a> </span>
        </div>
        <div class="layui-card-body layui-row">
            <div class="layui-col-md6">
                <div class="intro-img photos"> <img id="coverImg" src="/company/show/${hire.photo}" alt="招聘公司封面" layer-index="0"> </div>
            </div>
            <div class="layui-col-md6">
                <div class="intro-txt">
                    <h1 class="title" id="roomName">${hire.companyName}</h1>
                    <input type="hidden" id="id" name="id" value="1">
                    <div class="store-attrs">
                        <div class="summary">
                            <p class="reference"><span>招聘岗位</span> <span id="roomNumber">${hire.hireType}</span></p>
                            <p class="reference"><span>招聘要求</span> <span id="bedType">${hire.request}</span></p>
                            <p class="reference"><span>招聘人数</span> <span id="broadband">${hire.numbers}</span></p>
                            <p class="reference"><span>招聘薪资</span> ￥<span id="standardPrice">${hire.salary}</span></p>
                            <p class="reference"><span>工作地点</span><span>${hire.place}</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-card shopdata-content">
        <div class="layui-card-body detail-body layui-text">
            <div class="layui-elem-quote"> 温馨提示：抵制招聘诈骗，加强自我保护，以任何理由索取财物，均涉嫌违法，请提高警惕！</div>
            <div id="roomContent">
                ${hire.descs}
            </div>
            <p class="reference"><span>联系方式</span><span>${hire.tel}</span></p>
            <p class="reference"><span>发布时间</span><span>${hire.times}</span></p>
        </div>
    </div>
</div>
<!-- 房间详情end -->

<!-- 底部 -->
<div class="fly-footer">
    <p><a href="#">邢台学院</a> 2020 © <a href="#">test.cn</a></p>

</div>


<!-- 脚本开始 -->
<script src="${pageContext.request.contextPath}/static/front/layui/dist/layui.js"></script>
<script>
    layui.use(["form","element","carousel","layer","laydate"], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            carousel = layui.carousel,
            laydate = layui.laydate,
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

