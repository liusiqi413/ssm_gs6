<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>就业管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学生姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuname" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn"  lay-submit lay-filter="data-search-btn"><i class="layui-icon layui-icon-search"></i>搜索</button>
                            <button type="reset" class="layui-btn layui-btn-warm"><i class="layui-icon layui-icon-refresh-1"></i>重置
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <%-- 头部工具栏区域 --%>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <!--lay-event用来配合实现监听事件-->
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>添加 </button>
            </div>
        </script>

        <%-- 表格区域 --%>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <%-- 行工具栏区域 --%>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i class="layui-icon layui-icon-delete"></i>删除</a>
        </script>

        <script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
        <script>
            layui.use(['form', 'table','layer'], function () {
                var $ = layui.jquery,
                    form = layui.form,
                    layer=layui.layer,
                    table = layui.table;

                var tableIns= table.render({//渲染表格组件
                    elem: '#currentTableId',//绑定表格元素，推荐使用ID选择器
                    url: '${pageContext.request.contextPath}/admin/stu/master', //异步请求地址，数据接口。异步数据接口相关参数
                   // 加入分页后，默认使用page(当前页码)和limit(每页显示数量)作为参数名称
                    toolbar: '#toolbarDemo',  //绑定工具条模板
                    cols: [[  //表头
                        //filed属性：字段属性，该属性与实体类的属性名一致
                        //title属性：表示文本
                        //sort是否排序
                        {field: 'id', width: 60, title: 'ID', sort: true},
                        {field: 'stuno', width:120, title: '学生学号',sort:true,align: 'center'},
                        {field: 'stuname', width: 100, title: '学生姓名', sort: true,align: 'center'},
                        {field: 'success', title: '录取', minWidth: 60,align: 'center',sort: true},
                        {field: 'university', width: 120, title: '院校',align: 'center'},
                        {field: 'area', width: 100, title: '国家', sort: true,align: 'center'},
                        {field: 'city', width: 100, title: '城市',sort: true,align: 'center'},
                        {title: '操作', minWidth: 130, toolbar: '#currentTableBar', align: "center"}
                    ]],
                    page: true, //开启分页
                    done: function (res, curr, count) {
                        //判断当前页码是否是大于1并且当前页的数据量为0
                        if (curr > 1 && res.data.length == 0) {
                            var pageValue = curr - 1;
                            //刷新数据表格的数据
                            tableIns.reload({
                                page: {curr: pageValue}
                            });
                        }
                    }
                });

                // 监听搜索按钮提交事件
                form.on('submit(data-search-btn)', function (data) {
                    tableIns.reload({
                        where: data.field,  //查询条件
                        page: {
                            curr: 1
                        }
                    });
                    return false;  //禁止页面刷新
                });
            });

        </script>
</body>
</html>


