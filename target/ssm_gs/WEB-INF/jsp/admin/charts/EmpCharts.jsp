<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>就业统计</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
</head>
<body>
<!-- 搜索条件开始 -->
<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">--%>
<%--    <legend>查询条件</legend>--%>
<%--</fieldset>--%>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">选择毕业年份:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="year"  readonly="readonly" placeholder="yyyy">
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch">查询</button>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->

<!-- 报表界面开始 -->
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="container" style="height:550px;"></div>
<!-- 报表界面结束 -->

<script src="${pageContext.request.contextPath}/static/echarts/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/echarts/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['jquery','form','layer','laydate'],function () {
        var $ = layui.jquery;
        var form = layui.form;
        var layer = layui.layer;
        var laydate = layui.laydate;
        //初始化时间选择器
        laydate.render({
            elem: '#year',//绑定渲染的元素
            type: 'year',//控件选择类型
            value: new Date()//默认选中当前年份
        });

        //当点击查询按钮时调用getData()方法
        $("#doSearch").click(function () {
            getData();
        });

        /*
        获取数据
         */
        function getData() {
            //获取年月
            var date = $("#year").val();
            $.get("/admin/charts/getTotalEmp",{"date":date}, function (result) {
                var chartDom = document.getElementById('container');
                var myChart = echarts.init(chartDom);
                var option;

                option = {
                    title: {
                        text: '就业统计',
                        // subtext: '虚构数据',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b} : {c} ({d}%)'
                    },
                    legend: {
                        bottom: 10,
                        left: 'center',
                        data: result
                    },
                    series: [
                        {
                            type: 'pie',
                            radius: '65%',
                            center: ['50%', '50%'],
                            selectedMode: 'single',
                            data: result,
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };

                myChart.setOption(option);

            }, "json");
        }

        //调用方法
        getData();
    });
</script>
</body>
</html>
