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
                <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="batchDelete"><i class="layui-icon layui-icon-delete"></i>批量删除</button>
            </div>
        </script>

        <%-- 表格区域 --%>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <%-- 行工具栏区域 --%>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i class="layui-icon layui-icon-delete"></i>删除</a>
        </script>
        <%-- 添加和修改窗口 --%>
        <div style="display: none;padding: 5px" id="addOrUpdateWindow">
            <form class="layui-form" style="width:90%;"method="post" id="dataFrm" lay-filter="dataFrm">
                <div class="layui-form-item">
                    <%-- 隐藏域 --%>
                    <input type="hidden" name="id">
                    <label class="layui-form-label">学生学号</label>
                    <div class="layui-input-block">

                        <input type="text" name="stuno" id="stuNo" lay-verify="required" autocomplete="off" placeholder="请输入学生学号"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学生姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="stuname" lay-verify="required" autocomplete="off"
                               placeholder="请输入学生姓名" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row layui-col-xs12">
                    <div class="layui-input-block" style="text-align: center;">
                        <button type="button" class="layui-btn" lay-submit lay-filter="doSubmit"><span
                                class="layui-icon layui-icon-add-1"></span>提交
                        </button>
                        <button type="reset" class="layui-btn layui-btn-warm"><span
                                class="layui-icon layui-icon-refresh-1"></span>重置
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
        <script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
        <script>
            layui.use(['jquery','form','table','layer'], function () {
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
                        {type:"checkbox",fixed:"left",width:50,align:"center"},
                        {field: 'id', width: 60, title: 'ID', sort: true},
                        {field: 'stuno', width:130, title: '学生学号',sort:true,align: 'center'},
                        {field: 'stuname', width: 100, title: '学生姓名', sort: true,align: 'center'},
                        {field: 'success', title: '录取', width: 80,align: 'center',sort: true,templet:function (d) {
                            return d.success==1?"是":"否";
                            }},
                        {field: 'university', width: 130, title: '院校',align: 'center'},
                        {field: 'area', width: 90, title: '国家', sort: true,align: 'center'},
                        {field: 'city', width: 90, title: '城市',sort: true,align: 'center'},
                        {title: '操作', width: 150, toolbar: '#currentTableBar', align: "center"}
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
                //监听表格头部工具栏事件
                //toolbar是头部工具栏事件
                //currentTableFilter是表格lay-filter过滤器的值
                table.on("toolbar(currentTableFilter)",function(obj){
                    switch (obj.event) {
                        case "add": //添加按钮
                            openAddWindow();//打开添加窗口
                            break;
                        case "batchDelete":   //打开批量删除
                            batchDeleteMaster();
                            break;
                    }
                });
                table.on("tool(currentTableFilter)",function(obj){
                    switch (obj.event) {
                        case "edit": //修改按钮
                            openUpdateWindow(obj.data);//打开修改窗口
                            break;
                        case "delete"://删除按钮
                            deleteById(obj.data);
                            break;
                    }
                });
                var url;//提交地址
                var mainIndex;//打开窗口的索引

                //打开添加窗口
                function openAddWindow(){
                    mainIndex = layer.open({
                        type:1,//打开类型
                        title:"添加学生考研信息",  //窗口事件
                        area:["800px","400px"],//窗口宽高
                        content:$("#addOrUpdateWindow"),//引用的内容窗口
                        success:function () {
                            //清空表单数据
                            $("#dataFrm")[0].reset();
                            //添加提交的请求
                            url="/admin/stu/addStuMaster";
                        }
                    });
                }
                //打开修改窗口
                function openUpdateWindow(data){
                    mainIndex = layer.open({
                        type:1,//打开类型
                        title:"修改学生考研信息",  //窗口事件
                        area:["800px","400px"],//窗口宽高
                        content:$("#addOrUpdateWindow"),//引用的内容窗口
                        success:function () {
                            //表单数据回显
                            form.val("dataFrm",data);//参数1：lay-filter值 参数2：回显的数据
                            //添加提交的请求
                            url="/admin/stu/updateStuMaster";
                        }
                    });
                }
                var flag = false;//定义变量，标识是否存在
                $("#stuNo").blur(function () {
                    var stuno=$("#stuNo").val().trim();
                    if(stuno.length>0){
                        $.get("/admin/stu/checkStuMaster",{"stuno":stuno},function(result){
                            if(result.exist){
                                layer.alert(result.message,{icon:5});
                                //修改状态为true，表示已存在
                                flag = true;
                            }else{
                                flag = false;//不存在
                            }
                        },"json");
                    }
                });
                //监听表单提交事件
                form.on("submit(doSubmit)",function (data) {
                    if(flag){
                        layer.alert("已有相同学号，请确认后重新输入！",{icon:5})
                    }else {
                        //发送ajax请求提交
                        $.post(url, data.field, function (result) {
                            if (result.success) {
                                layer.alert(result.message, {icon: 6});
                                //刷新数据表格
                                tableIns.reload();
                                //关闭窗口
                                layer.close(mainIndex);
                            }
                            //提示信息
                            layer.msg(result.message);
                        }, "json");
                    }
                    //禁止页面刷新
                    return false;
                });
                //删除该学生
                function deleteById(data) {
                    //提示用户是否删除该学生
                    layer.confirm("确定要删除[<font color='red'>"+data.stuname+"</font>]吗？",{icon:3,title:"提示"},function(index){
                        //发送ajax请求
                        $.post("/admin/stu/deleteStuMasterById",{"id":data.id},function (result) {
                            if (result.success){
                                layer.alert(result.message,{icon:1});
                                //刷新表格数据
                                tableIns.reload();
                            }else{
                                layer.alert(result.message,{icon:2});
                            }
                        },"json");
                        //关闭提示框
                        layer.close(index);
                    });
                }
                function batchDeleteMaster() {
                    //获取表格对象
                    var checkStatus=table.checkStatus('currentTableId');
                    //判断是否选中行
                    if(checkStatus.data.length>0) {
                        //定义数组，保存选中行的ID
                        var idArr = [];
                        //循环遍历获取选中行
                        for (let i = 0; i < checkStatus.data.length; i++) {
                            //将选中的ID值添加到数组的末尾
                            idArr.push(checkStatus.data[i].id);
                        }
                        //将数组转成字符串
                        var ids = idArr.join(",");
                        //提示用户是否要删除
                        layer.confirm("确定要删除这<font color='red'>"+checkStatus.data.length+"</font>条数据嘛？",{icon:3,title:"提示"},function (index) {
                            //发送ajax请求
                            $.post("/admin/stu/batchDeleteMaster", {"ids": ids}, function (result) {
                                if (result.success) {
                                    layer.alert(result.message, {icon: 1});
                                    //刷新表格
                                    tableIns.reload();
                                } else {
                                    layer.alert(result.message, {icon: 2});
                                }
                            }, "json");
                            layer.close(index);
                        });
                    }else{
                        layer.msg("请选择要删除的学生");
                    }
                }
            });

        </script>
</body>
</html>