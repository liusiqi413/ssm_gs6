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
    <link rel="icon" href="${pageContext.request.contextPath}/static/front/images/favicon.ico">
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
                        <img src="${pageContext.request.contextPath}/static/front/images/xt7.png" alt="酒店系统"></a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt8.png" alt="酒店系统"></a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt9.png" alt="酒店系统"> </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt1.jpg" alt="酒店系统"> </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt3.jpg" alt="酒店系统"> </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/front/images/xt4.jpg" alt="酒店系统"> </a>
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
                    <p class="temp-title-cn"><span></span>酒店1楼<span></span></p>
                    <div class="layui-row layui-col-space20">
                        <div data-id="1" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/950f5d78-d2a2-4e60-843a-60cbd0bd2651.jpg" class="store-list-cover">
                                <h2 class="layui-elip">经济舒适单人间</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.100 </span></p>
                            </a>
                        </div>
                        <div data-id="7" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/47e28094-4ebf-40b3-9ea3-55f77c71c865.jpg" class="store-list-cover">
                                <h2 class="layui-elip">商务双床房</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.101 </span></p>
                            </a>
                        </div>
                        <div data-id="13" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/acfae30b-e1d6-4d94-b7d4-fccba740fe62.jpg" class="store-list-cover">
                                <h2 class="layui-elip">普通标准间</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.102 </span></p>
                            </a>
                        </div>
                        <div data-id="19" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/7e45a065-8ffa-4044-9ff4-4eeba5d4c6a4.jpg" class="store-list-cover">
                                <h2 class="layui-elip">豪华总统套房</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.103 </span></p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="temp-normal" style="background-color: #f2f2f2">
                <div class="layui-container">
                    <p class="temp-title-cn"> <span></span> <a href="">酒店2楼</a> <span></span> </p>
                    <div class="layui-row layui-col-space20 shoplist">
                        <div data-id="2" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/950f5d78-d2a2-4e60-843a-60cbd0bd2651.jpg" class="store-list-cover">
                                <h2 class="layui-elip">经济舒适单人间</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.200</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div data-id="8" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/47e28094-4ebf-40b3-9ea3-55f77c71c865.jpg" class="store-list-cover">
                                <h2 class="layui-elip">商务双床房</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.201</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div data-id="14" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/acfae30b-e1d6-4d94-b7d4-fccba740fe62.jpg" class="store-list-cover">
                                <h2 class="layui-elip">普通标准间</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.202</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div data-id="20" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/7e45a065-8ffa-4044-9ff4-4eeba5d4c6a4.jpg" class="store-list-cover">
                                <h2 class="layui-elip">豪华总统套房</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.203</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="temp-hot">
                <div class="layui-container">
                    <p class="temp-title-cn"><span></span>酒店3楼<span></span></p>
                    <div class="layui-row layui-col-space20">
                        <div data-id="3" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/950f5d78-d2a2-4e60-843a-60cbd0bd2651.jpg" class="store-list-cover">
                                <h2 class="layui-elip">经济舒适单人间</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.300 </span></p>
                            </a>
                        </div>
                        <div data-id="9" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/47e28094-4ebf-40b3-9ea3-55f77c71c865.jpg" class="store-list-cover">
                                <h2 class="layui-elip">商务双床房</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.301 </span></p>
                            </a>
                        </div>
                        <div data-id="15" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/acfae30b-e1d6-4d94-b7d4-fccba740fe62.jpg" class="store-list-cover">
                                <h2 class="layui-elip">普通标准间</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.302 </span></p>
                            </a>
                        </div>
                        <div data-id="21" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/7e45a065-8ffa-4044-9ff4-4eeba5d4c6a4.jpg" class="store-list-cover">
                                <h2 class="layui-elip">豪华总统套房</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.303 </span></p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="temp-normal" style="background-color: #f2f2f2">
                <div class="layui-container">
                    <p class="temp-title-cn"> <span></span> <a href="">酒店4楼</a> <span></span> </p>
                    <div class="layui-row layui-col-space20 shoplist">
                        <div data-id="4" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/950f5d78-d2a2-4e60-843a-60cbd0bd2651.jpg" class="store-list-cover">
                                <h2 class="layui-elip">经济舒适单人间</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.400</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div data-id="10" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/47e28094-4ebf-40b3-9ea3-55f77c71c865.jpg" class="store-list-cover">
                                <h2 class="layui-elip">商务双床房</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.401</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div data-id="16" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/acfae30b-e1d6-4d94-b7d4-fccba740fe62.jpg" class="store-list-cover">
                                <h2 class="layui-elip">普通标准间</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.402</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div data-id="22" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/7e45a065-8ffa-4044-9ff4-4eeba5d4c6a4.jpg" class="store-list-cover">
                                <h2 class="layui-elip">豪华总统套房</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.403</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="temp-hot">
                <div class="layui-container">
                    <p class="temp-title-cn"><span></span>酒店5楼<span></span></p>
                    <div class="layui-row layui-col-space20">
                        <div data-id="5" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/950f5d78-d2a2-4e60-843a-60cbd0bd2651.jpg" class="store-list-cover">
                                <h2 class="layui-elip">经济舒适单人间</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.500 </span></p>
                            </a>
                        </div>
                        <div data-id="11" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/47e28094-4ebf-40b3-9ea3-55f77c71c865.jpg" class="store-list-cover">
                                <h2 class="layui-elip">商务双床房</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.501 </span></p>
                            </a>
                        </div>
                        <div data-id="17" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/acfae30b-e1d6-4d94-b7d4-fccba740fe62.jpg" class="store-list-cover">
                                <h2 class="layui-elip">普通标准间</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.502 </span></p>
                            </a>
                        </div>
                        <div data-id="23" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/7e45a065-8ffa-4044-9ff4-4eeba5d4c6a4.jpg" class="store-list-cover">
                                <h2 class="layui-elip">豪华总统套房</h2>
                                <p class="price"> <span title="金额"> ￥1 </span> <span title="房号" style="color:  #fff;background: #0e88cc;padding: 3px;text-align: center;border: 1px solid #4cffb3;font-size: 13px;"> NO.503 </span></p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="temp-normal" style="background-color: #f2f2f2">
                <div class="layui-container">
                    <p class="temp-title-cn"> <span></span> <a href="">酒店6楼</a> <span></span> </p>
                    <div class="layui-row layui-col-space20 shoplist">
                        <div data-id="6" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/950f5d78-d2a2-4e60-843a-60cbd0bd2651.jpg" class="store-list-cover">
                                <h2 class="layui-elip">经济舒适单人间</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.600</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div data-id="12" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/47e28094-4ebf-40b3-9ea3-55f77c71c865.jpg" class="store-list-cover">
                                <h2 class="layui-elip">商务双床房</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.601</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div data-id="18" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/acfae30b-e1d6-4d94-b7d4-fccba740fe62.jpg" class="store-list-cover">
                                <h2 class="layui-elip">普通标准间</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.602</span>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div data-id="24" class="layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
                            <a class="template store-list-box fly-case-active" href="JavaScript:void(0);" data-type="toRoomInfo">
                                <img src="http://qiniu.goodym.cn/7e45a065-8ffa-4044-9ff4-4eeba5d4c6a4.jpg" class="store-list-cover">
                                <h2 class="layui-elip">豪华总统套房</h2>
                                <div> <label class="layui-badge-rim store-list-pay"> ￥1 </label>
                                    <div class="store-list-colorbar" title=""> <span class="store-color-bar" style="color:  #fff;background: #cc9812;padding: 3px;text-align: center;">NO.603</span>
                                    </div>
                                </div>
                            </a>
                        </div>
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
