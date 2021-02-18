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
            <li data-id="editInfo" class="layui-nav-item layui-hide-xs layui-this">
                <a class="fly-case-active" data-type="toTopNav" href="edit.html">信息修改</a>
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
                    <legend>基本信息修改</legend>
                </fieldset>
                <c:forEach var="student" items="${stuList}">
                <div data-id="${student.id}" >
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学号:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuno" value="${student.stuno}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuname" value="${student.stuname}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">性别:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuname" value="${student.gender}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">学院:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="college" id="college" value="${student.college}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">专业:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="major" value="${student.major}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">班级:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="classes" value="${student.classes}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">入学日期:</label>
                            <div class="layui-input-inline">
                                <input type="text"  value="<fmt:formatDate value="${student.start}" pattern="yyyy-MM-dd"/>" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">毕业日期:</label>
                            <div class="layui-input-inline">
                                <input type="text"  value="<fmt:formatDate value="${student.gradu}" pattern="yyyy-MM-dd"/>" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学历:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="diploma" value="${student.diploma}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">培养方式:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="train" id="train" value="${student.train}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-elem-quote confrom">
                        <c:if test="${student.status=='1'}">基本信息待审核</c:if>
                        <c:if test="${student.status=='2'}">基本信息审核通过</c:if>
                        <c:if test="${student.status=='3'}">基本信息审核未通过</c:if>
                    </div>
                    <form class="layui-form" id="stuUpdate" lay-filter="stuUpdate" action="">
                        <div class="layui-form-item">
                            <input type="hidden" name="stuno" id="stuno" value="${sessionScope.currentUser.loginName}">
                            <div class="layui-inline">
                                <label class="layui-form-label">电话号码：</label>
                                <div class="layui-input-inline">
                                    <input name="stutel" type="text" id="stutel" lay-verify="required" value="${student.stutel}" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">高考考号：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="examno" id="examno" value="${student.examno}" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">身份证号：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="idcard" id="idcard" value="${student.idcard}" lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">生源地：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="stuaddr" id="stuaddr" value="${student.stuaddr}" lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">家庭住址：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="homeaddr" id="homeaddr" value="${student.homeaddr}" lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">民族：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="ethnic" id="ethnic" value="${student.ethnic}" lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">出生日期：</label>
                                <div class="layui-input-inline">
                                    <input type="date" name="birth" id="birth" value="<fmt:formatDate value="${student.birth}" pattern="yyyy-MM-dd"/>" autocomplete="off"
                                           placeholder="yyyy-MM-dd" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label"></label>
                                <div class="layui-input-inline">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn" lay-submit lay-filter="demoEditInfo">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
                </c:forEach>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                    <legend>就业信息修改</legend>
                </fieldset>
                <c:forEach var="stuEmp" items="${stuEmpList}">
                <div data-id="${stuEmp.id}">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学号:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuno" value="${stuEmp.stuno}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名:</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuname" value="${stuEmp.stuname}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-elem-quote confrom">
                        <c:if test="${stuEmp.status=='1'}">就业信息待审核</c:if>
                        <c:if test="${stuEmp.status=='2'}">就业信息审核通过</c:if>
                        <c:if test="${stuEmp.status=='3'}">就业信息审核未通过</c:if>
                    </div>
                        <form class="layui-form" id="stuEmpUpdate" lay-filter="stuEmpUpdate" action="">
                            <input type="hidden" name="stuno" value="${sessionScope.currentUser.loginName}">
                            <div class="layui-form-item">
                                <div class="master">
                                    <label>就业协议号：</label>
                                    <div class="layui-inline">
                                        <input name="employno" type="text" id="employno" lay-verify="required" value="${stuEmp.employno}" autocomplete="off" class="layui-input">
                                    </div>
                                        <label class="company">公司名：</label>
                                    <div class="layui-inline">
                                        <input type="text" name="company" id="company" value="${stuEmp.company}" autocomplete="off" class="layui-input">
                            </div>
                            </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">工作类别：</label>
                                    <div class="layui-input-inline">
                                        <input name="category" type="text" id="category" lay-verify="required" value="${stuEmp.category}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">单位性质：</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="employunit" id="employunit" value="${stuEmp.employunit}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">就业国家：</label>
                                    <div class="layui-input-inline">
                                        <input name="country" type="text" id="country" lay-verify="required" value="${stuEmp.country}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">就业城市：</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="city" id="city" value="${stuEmp.city}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">薪资：</label>
                                    <div class="layui-input-inline">
                                        <input type="number" name="salary" id="salary" value="${stuEmp.salary}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label"></label>
                                    <div class="layui-input-inline">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button type="button" class="layui-btn" lay-submit lay-filter="demoEditEmp">立即提交</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </form>
                            </div>
                </c:forEach>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                    <legend>考研信息修改</legend>
                </fieldset>
                <c:forEach var="stuMaster" items="${stuMasterList}">
                    <div data-id="${stuMaster.id}">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">学号:</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="stuno" value="${stuMaster.stuno}" disabled="disabled" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">姓名:</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="stuname" value="${stuMaster.stuname}" disabled="disabled" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-elem-quote confrom">
                            <c:if test="${stuMaster.status=='1'}">考研信息待审核</c:if>
                            <c:if test="${stuMaster.status=='2'}">考研信息审核通过</c:if>
                            <c:if test="${stuMaster.status=='3'}">考研信息审核未通过</c:if>
                        </div>
                        <form class="layui-form" id="stuMasterUpdate" lay-filter="stuMasterUpdate" action="">
                            <input type="hidden" name="stuno" value="${sessionScope.currentUser.loginName}">
                            <div class="layui-form-item" pane="">
                                <div class="master">
                                <label>考研结果：</label>
                                    <input type="radio" name="success" <c:if test="${stuMaster.success=='1'}">checked="checked"</c:if> value="1" title="成功"/>
                                    <input type="radio" name="success" <c:if test="${stuMaster.success=='2'}">checked="checked"</c:if> value="2" title="失败" />
                                </div>
                            </div>
                            <div class="layui-form-item" pane="">
                                <div class="master">
                                    <label>研究生类别：</label>
                                        <input type="radio" name="master" <c:if test="${stuMaster.master=='1'}">checked="checked"</c:if> value="1" title="全日制研究生"/>
                                        <input type="radio" name="master" <c:if test="${stuMaster.master=='2'}">checked="checked"</c:if> value="2" title="非全日制研究生" />
                            </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">升学院校：</label>
                                    <div class="layui-input-inline">
                                        <input name="university" type="text" id="university" value="${stuMaster.university}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">升学国家:</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="area" value="${stuMaster.area}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">升学城市：</label>
                                    <div class="layui-input-inline">
                                        <input name="city" type="text" value="${stuMaster.city}" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label"></label>
                                    <div class="layui-input-inline">
                                        <input type="hidden" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button type="button" class="layui-btn" lay-submit lay-filter="demoEditMaster">立即提交</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>

<script>
    layui.use(['jquery','form','laydate','layer'], function () {
            var $ = layui.jquery;
            var form = layui.form;
            var laydate = layui.laydate;
            var layer = layui.layer;
            //渲染日期组件
            laydate.render({
                elem: "#birth",
                type: "date"
            });
            //监听提交
            form.on('submit(demoEditInfo)', function (data) {
                $.post("/updateInfo", data.field, function (result) {
                    if (result.success) {
                        //刷新数据表格
                        form.render(null, 'stuUpdate');
                        //提示信息
                        layer.alert("修改成功");
                    } else {
                        //提示信息
                        layer.alert("修改失败");
                    }
                }, "json");
                return false;
            });
        //监听提交
        form.on('submit(demoEditEmp)', function (data) {
            $.post("/updateEditEmp", data.field, function (result) {
                if (result.success) {
                    //刷新数据表格
                    form.render(null, 'stuEmpUpdate');
                    //提示信息
                    layer.alert("修改成功");
                } else {
                    //提示信息
                    layer.alert("修改失败");
                }
            }, "json");
            return false;
        });
        //监听提交
        form.on('submit(demoEditMaster)', function (data) {
            $.post("/updateEditMaster", data.field, function (result) {
                if (result.success) {
                    //刷新数据表格
                    form.render(null, 'stuEmpUpdate');
                    //提示信息
                    layer.alert("修改成功");
                } else {
                    //提示信息
                    layer.alert("修改失败");
                }
            }, "json");
            return false;
        });
        });
</script>
</body>
</html>
