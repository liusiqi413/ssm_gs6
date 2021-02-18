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
                            <label class="layui-form-label">审核状态</label>
                            <div class="layui-input-inline">
                                <select name="status" autocomplete="off" class="layui-input">
                                    <option value="">全部</option>
                                    <option value="1">待审核</option>
                                    <option value="2">审核通过</option>
                                    <option value="3">审核未通过</option>
                                </select>
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
<%--                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>添加 </button>--%>
                <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="batchDelete"><i class="layui-icon layui-icon-delete"></i>批量删除</button>
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="batchConfirm"><i class="layui-icon layui-icon-edit"></i>批量通过</button>
                <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="batchFail"><i class="layui-icon layui-icon-close-fill"></i>批量未通过</button>
            </div>
        </script>

        <%-- 表格区域 --%>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <%-- 行工具栏区域 --%>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i class="layui-icon layui-icon-delete"></i>删除</a>
        </script>
        <script type="text/html" id="currentTableBars">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="pass"><i class="layui-icon layui-icon-ok-circle"></i>通过</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="fail"><i class="layui-icon layui-icon-close-fill"></i>未通过</a>
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
                <div class="layui-form-item">
                    <label class="layui-form-label">就业协议书</label>
                    <div class="layui-input-block">
                        <input type="text" name="employno" lay-verify="required" autocomplete="off"
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
            layui.use(['jquery','form', 'table','layer'], function () {
                var $ = layui.jquery,
                    form = layui.form,
                    layer=layui.layer,
                    table = layui.table;
    //表格用变量接收
                var tableIns= table.render({
                    elem: '#currentTableId',
                    url: '${pageContext.request.contextPath}/admin/stu/employ',
                    toolbar: '#toolbarDemo',
                    cols: [[
                        {type:"checkbox",fixed:"left",width:50,align:"center"},
                        {field: 'id', width: 60, title: 'ID', sort: true},
                        {field: 'stuno', width:130, title: '学生学号',sort:true,align: 'center'},
                        {field: 'stuname', width: 100, title: '学生姓名', sort: true,align: 'center'},
                        {field: 'employno', title: '就业协议书', width:150,align: 'center',sort: true},
                        {field: 'company', width: 180, title: '公司名',align: 'center'},
                        {field: 'category', width: 120, title: '工作类别', sort: true,align: 'center'},
                        {field: 'employunit', width: 130, title: '就业单位性质', sort: true,align: 'center'},
                        {field: 'country', width: 100, title: '就业国家',sort: true,align: 'center'},
                        {field: 'city', width: 100, title: '就业城市',sort: true,align: 'center'},
                        {field: 'status', width: 120, title: '状态', align: "center",templet:function (d) {
                                if(d.status==1){
                                    return "待审核";
                                }else if(d.status==2){
                                    return "审核通过";
                                }else if(d.status==3){
                                    return "审核未通过";
                                }
                            }},
                        {title: '操作', width:180, toolbar: '#currentTableBar', align: "center"},
                        {title: '审核', width:180, toolbar: '#currentTableBars', align: "center"}
                    ]],
                    page: true,
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

                // 监听搜索操作
                form.on('submit(data-search-btn)', function (data) {
                    tableIns.reload({
                        where: data.field, //键值对，查询条件
                        page: {
                            curr: 1  //从第一页开始查
                        }
                    });
                    return false;  //禁止刷新
                });
                //监听表格头部工具栏事件
                //toolbar是头部工具栏事件
                //currentTableFilter是表格lay-filter过滤器的值
                table.on("toolbar(currentTableFilter)",function(obj){
                    switch (obj.event) {
                        // case "add": //添加按钮
                        //     openAddWindow();//打开添加窗口
                        //     break;
                        case "batchDelete":   //打开批量删除
                            batchDeleteEmp();
                            break;
                        case "batchConfirm"://批量审核按钮
                            batchConfirm();//确认
                            break;
                        case "batchFail"://批量审核按钮
                            batchFail();//确认
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
                        case "pass"://审核通过按钮
                            pass(obj.data);
                            break;
                        case "fail"://审核未通过按钮
                            fail(obj.data);
                            break;
                    }
                });
                var url;//提交地址
                var mainIndex;//打开窗口的索引

                // //打开添加窗口
                // function openAddWindow(){
                //     mainIndex = layer.open({
                //         type:1,//打开类型
                //         title:"添加学生就业信息",  //窗口事件
                //         area:["800px","400px"],//窗口宽高
                //         content:$("#addOrUpdateWindow"),//引用的内容窗口
                //         success:function () {
                //             //清空表单数据
                //             $("#dataFrm")[0].reset();
                //             //添加提交的请求
                //             url="/admin/stu/addStuEmp";
                //         }
                //     });
                // }
                //打开修改窗口
                function openUpdateWindow(data){
                    mainIndex = layer.open({
                        type:1,//打开类型
                        title:"修改学生",  //窗口事件
                        area:["800px","400px"],//窗口宽高
                        content:$("#addOrUpdateWindow"),//引用的内容窗口
                        success:function () {
                            //表单数据回显
                            form.val("dataFrm",data);//参数1：lay-filter值 参数2：回显的数据
                            //添加提交的请求
                            url="/admin/stu/updateStuEmp";
                        }
                    });
                }
                var flag = false;//定义变量，标识是否存在
                $("#stuNo").blur(function () {
                    var stuno=$("#stuNo").val().trim();
                    if(stuno.length>0){
                        $.get("/admin/stu/checkStuEmp",{"stuno":stuno},function(result){
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
                        //禁止页面刷新
                        return false;
                    }
                });
                //删除该学生
                function deleteById(data) {
                    //提示用户是否删除该学生
                    layer.confirm("确定要删除[<font color='red'>"+data.stuname+"</font>]吗？",{icon:3,title:"提示"},function(index){
                        //发送ajax请求
                        $.post("/admin/stu/deleteStuEmpById",{"id":data.id},function (result) {
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
                function batchDeleteEmp() {
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
                            $.post("/admin/stu/batchDeleteEmp", {"ids": ids}, function (result) {
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
                /**
                 * 审核通过
                 * @param data
                 */
                function pass(data) {
                    //判断当前状态是否审核
                    if(data.status!=2){
                        //发送请求
                        $.post("/admin/stu/pass",{"id":data.id},function(result){
                            if(result.success){
                                //刷新数据表格
                                tableIns.reload();
                            }
                            layer.msg(result.message);
                        },"json");
                    }else{
                        layer.msg("该生已审核通过，无需重复操作");
                    }
                }
                /**
                 * 审核未通过
                 * @param data
                 */
                function fail(data) {
                    //判断当前状态是否审核
                    if(data.status!=3){
                        //发送请求
                        $.post("/admin/stu/fail",{"id":data.id},function(result){
                            if(result.success){
                                //刷新数据表格
                                tableIns.reload();
                            }
                            layer.msg(result.message);
                        },"json");
                    }else{
                        layer.msg("该生审核未通过，无需重复操作");
                    }
                }
                /**
                 * 批量通过
                 */
                function batchConfirm() {
                    //获取选中行
                    var checkStatus = table.checkStatus('currentTableId');
                    //定义变量，保存选中行的数量
                    var length = checkStatus.data.length;
                    //判断当前是否有选中行
                    if(length>0){
                        //判断选中行中是否有包含(已确认)的状态，如果包含已确认或已入住，此时提示用户“只能操作状态为待确认的订单”
                        for (var i = 0; i < length; i++) {
                            if(checkStatus.data[i].status!=1){
                                layer.alert("只能操作状态为<font color='blue'>待审核</font>的学生!",{icon:0});
                                return;
                            }
                        }
                        //提示用户是否确认
                        layer.confirm("确定要审核通过这些学生吗?",{icon:3,title:"提示"},function (index) {
                            //获取选中行数据
                            var data = checkStatus.data;
                            //声明数组，保存选中行的ID值
                            var idArr = [];
                            //循环遍历选中行的数据
                            for (var i = 0; i < length; i++) {
                                //将选中行的ID放到数组中
                                idArr.push(data[i].id);
                            }
                            //将数组转换成字符串
                            var ids = idArr.join(",");
                            //发送请求
                            $.post("/admin/stu/batchConfirm",{"ids":ids},function(result){
                                if(result.success){
                                    //刷新数据表格
                                    tableIns.reload();
                                }
                                layer.msg(result.message);
                            },"json");
                        });
                    }else{
                        layer.msg("请选择要审核通过的学生");
                    }
                }
                /**
                 * 批量未通过
                 */
                function batchFail() {
                    //获取选中行
                    var checkStatus = table.checkStatus('currentTableId');
                    //定义变量，保存选中行的数量
                    var length = checkStatus.data.length;
                    //判断当前是否有选中行
                    if(length>0){
                        //判断选中行中是否有包含(已确认)的状态，如果包含已确认或已入住，此时提示用户“只能操作状态为待确认的订单”
                        for (var i = 0; i < length; i++) {
                            if(checkStatus.data[i].status!=1){
                                layer.alert("只能操作状态为<font color='blue'>待审核</font>的学生!",{icon:0});
                                return;
                            }
                        }
                        //提示用户是否确认
                        layer.confirm("确定要未通过这些学生吗?",{icon:3,title:"提示"},function (index) {
                            //获取选中行数据
                            var data = checkStatus.data;
                            //声明数组，保存选中行的ID值
                            var idArr = [];
                            //循环遍历选中行的数据
                            for (var i = 0; i < length; i++) {
                                //将选中行的ID放到数组中
                                idArr.push(data[i].id);
                            }
                            //将数组转换成字符串
                            var ids = idArr.join(",");
                            //发送请求
                            $.post("/admin/stu/batchFail",{"ids":ids},function(result){
                                if(result.success){
                                    //刷新数据表格
                                    tableIns.reload();
                                }
                                layer.msg(result.message);
                            },"json");
                        });
                    }else{
                        layer.msg("请选择要未通过的学生");
                    }
                }
            });

        </script>
</body>
</html>

