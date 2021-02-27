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
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">选择薪资年份:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="year" placeholder="yyyy">
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch">查询</button>
        </div>
    </div>
</form>
<div id="container" style="height:500px;"></div>
<form class="layui-form" method="post" id="searchFrm1">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">选择行业年份:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="year1" placeholder="yyyy">
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch1">查询</button>
        </div>
    </div>
</form>
<div id="container1" style="height:500px;"></div>
<form class="layui-form" method="post" id="searchFrm2">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">选择薪资年份:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="year2" placeholder="yyyy">
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch2">查询</button>
        </div>
    </div>
</form>
<div id="main" style="height:500px;"></div>
<form class="layui-form" method="post" id="searchFrm3">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">选择平均薪资年份:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="year3" placeholder="yyyy">
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch3">查询</button>
        </div>
    </div>
</form>
<div id="main1" style="height:500px;"></div>
<form class="layui-form" method="post" id="searchFrm4">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">选择平均薪资年份:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="year4" placeholder="yyyy">
            </div>
        </div>
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search" id="doSearch4">查询</button>
        </div>
    </div>
</form>
<div id="main2" style="height:550px;"></div>

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
        laydate.render({
            elem: '#year1',//绑定渲染的元素
            type: 'year',//控件选择类型
            value: new Date()//默认选中当前年份
        });
        laydate.render({
            elem: '#year2',//绑定渲染的元素
            type: 'year',//控件选择类型
            value: new Date()//默认选中当前年份
        });
        laydate.render({
            elem: '#year3',//绑定渲染的元素
            type: 'year',//控件选择类型
            value: new Date()//默认选中当前年份
        });
        laydate.render({
            elem: '#year4',//绑定渲染的元素
            type: 'year',//控件选择类型
            value: new Date()//默认选中当前年份
        });
        //当点击查询按钮时调用getData()方法
        $("#doSearch").click(function () {
            getData();
        });
        //当点击查询按钮时调用getData1()方法
        $("#doSearch1").click(function () {
            getData1();
        });
        //当点击查询按钮时调用getData2()方法
        $("#doSearch2").click(function () {
            getData2();
        });
        //当点击查询按钮时调用getData3()方法
        $("#doSearch3").click(function () {
            getData3();
        });
        //当点击查询按钮时调用getData4()方法
        $("#doSearch4").click(function () {
            getData4();
        });
        /*
        获取数据
         */
        function getData() {
            //获取年月
            var year = $("#year").val();
            $.get("/admin/charts/getTotalEmp",{"year":year}, function (result) {
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
        /*
               获取数据
                */
        function getData1() {
            //获取年月
            var year = $("#year1").val();
            $.get("/admin/charts/getTotalCategory",{"year":year}, function (result) {
                var chartDom = document.getElementById('container1');
                var myChart = echarts.init(chartDom);
                var option;

                option = {
                    title: {
                        text: '所属行业统计',
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
        getData1();
        /**
         * 获取数据
         */
        function getData2() {
            //获取年份
            var year = $("#year2").val();
            //判断年份是否为空
            if(year=="" || year.length==0){
                //如果年份为空，则默认使用当前年份
                year = new Date().getFullYear();
            }
            //发送请求
                $.get("/admin/charts/getSalaryCharts",{"year":year},function(result){
                    // 基于准备好的dom，初始化echarts实例
                    var myChart = echarts.init(document.getElementById('main'),'light');
                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: '就业薪资统计',//标题
                            left: 'center'
                        },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        xAxis: {
                            data: result.keyList
                        },
                        yAxis: {},
                        series: [{
                            name: '人数',
                            type: 'bar',
                            data: result.valueList
                        }]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                },"json");
            }
        //调用方法
        getData2();
        /**
         * 获取数据
         */
        function getData3() {
            //获取年份
            var year = $("#year3").val();
            //判断年份是否为空
            if(year=="" || year.length==0){
                //如果年份为空，则默认使用当前年份
                year = new Date().getFullYear();
            }
            //发送请求
            $.get("/admin/charts/getSalaryAvgCharts",{"year":year},function(result){
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main1'),'light');
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '平均薪资统计',//标题
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    xAxis: {
                        data: result.keyList
                    },
                    yAxis: {},
                    series: [{
                        name: '年份',
                        type: 'bar',
                        data: result.valueList
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            },"json");
        }
        //调用方法
        getData3();
        /**
         * 获取数据
         */
        function getData4() {
            //获取年份
            var year = $("#year4").val();
            //判断年份是否为空
            if(year=="" || year.length==0){
                //如果年份为空，则默认使用当前年份
                year = new Date().getFullYear();
            }
            //发送请求
            $.get("/admin/charts/getProvinceCharts",{"year":year},function(result){
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main2'),'light');
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '工作省份统计',//标题
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    xAxis: {
                        data: result.keyList
                    },
                    yAxis: {},
                    series: [{
                        name: '省份',
                        type: 'bar',
                        data: result.valueList
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            },"json");
        }
        //调用方法
        getData4();
    });
</script>
</body>
</html>
