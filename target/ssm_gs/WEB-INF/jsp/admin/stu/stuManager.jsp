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
<script src="${pageContext.request.contextPath}/static/layui/lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
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
                            <label class="layui-form-label">学生班级</label>
                            <div class="layui-input-inline">
                                <input type="text" name="classes" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">学生专业</label>
                            <div class="layui-input-inline">
                                <input type="text" name="major" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">学生学院</label>
                            <div class="layui-input-inline">
                                <input type="text" name="college" autocomplete="off" class="layui-input">
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
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>添加 </button>
                <!--批量导入按钮-->
                <button class="layui-btn layui-btn-primary layui-btn-sm" lay-event="mulAdd"><i class="layui-icon">批量导入</i></button>
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

                        <input type="text" name="stuno" lay-verify="required" autocomplete="off" placeholder="请输入学生学号"
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
                    <label class="layui-form-label">学生性别</label>
                    <div class="layui-input-block">
                        <input type="text" name="gender" lay-verify="required" autocomplete="off" placeholder="请输入学生性别"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学生学院</label>
                    <div class="layui-input-block">
                        <input type="text" name="college" lay-verify="required" autocomplete="off" placeholder="请输入学生学院"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学生专业</label>
                    <div class="layui-input-block">
                        <input type="text" name="major" lay-verify="required" autocomplete="off" placeholder="请输入学生专业"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学生班级</label>
                    <div class="layui-input-block">
                        <input type="text" name="classes" lay-verify="required" autocomplete="off" placeholder="请输入学生班级"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">入学时间</label>
                    <div class="layui-input-block">
                        <input type="text" name="start" id="start" readonly="readonly" lay-reqText="请输入入学时间" autocomplete="off"
                               placeholder="yyyy-MM-dd" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">毕业时间</label>
                    <div class="layui-input-block">
                        <input type="text" name="gradu" id="gradu" readonly="readonly" lay-reqText="请输入毕业时间" autocomplete="off"
                               placeholder="yyyy-MM-dd" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学历</label>
                    <div class="layui-input-block">
                        <input type="text" name="diploma" lay-verify="required" autocomplete="off" placeholder="请输入学生的学历"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">培养方式</label>
                    <div class="layui-input-block">
                        <input type="text" name="train" lay-verify="required" autocomplete="off" placeholder="请输入学生培养方式"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-row layui-col-xs12">
                    <div class="layui-input-block" style="text-align: center;">
                        <button type="button" class="layui-btn" lay-submit lay-filter="doSubmit">
                            <span class="layui-icon layui-icon-add-1"></span>提交
                        </button>
                        <button type="reset" class="layui-btn layui-btn-warm">
                            <span class="layui-icon layui-icon-refresh-1"></span>重置
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/lay/modules/form.js"></script>
<script>
    layui.use('upload', function(){
        var $ = layui.jquery
            ,upload = layui.upload;

        //选完文件后不自动上传
        upload.render({
            elem: '#test8'
            ,url: '${pageContext.request.contextPath}/excelUpload/ajaxUpload'
            ,auto: false
            ,accept: 'file' //普通文件
            //,multiple: true
            ,bindAction: '#test19'
            ,done: function(res){
                console.log(res)
                //上传完毕
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('导入失败');
                }
                //上传成功
                return layer.msg('导入成功');
            }
        });
    });
</script>
<script>
    layui.use(['jquery','form','table','laydate','layer'], function () {
        var $ = layui.jquery;
         var form = layui.form;
          var table = layui.table;
          var laydate = layui.laydate;
           var layer=layui.layer;
           // var element=layui.element;

        // //监听Tab切换
        // element.on('tab(toolbarDemo)', function (data) {
        //     layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
        //         tips: 1
        //     });
        // });

        //渲染日期组件
        laydate.render({
            elem:"#start",
            type:"date"
        });
        laydate.render({
            elem:"#gradu",
            type:"date"
        });

       var tableIns= table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/stu/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 60, title: 'ID', sort: true},
                {field: 'stuno', width:130, title: '学生学号',sort:true},
                {field: 'stuname', width:90, title: '学生姓名',align: 'center'},
                {field: 'gender', width: 80, title: '性别', sort: true,align: 'center'},
                {field: 'college', title: '学院', width: 100,align: 'center',sort: true},
                {field: 'major', width: 130, title: '专业',align: 'center'},
                {field: 'classes', width: 110, title: '班级', sort: true},
                {field: 'start', width: 100, title: '入学时间', sort: true},
                {field: 'gradu', width: 100, title: '毕业时间',sort: true},
                {field: 'diploma', width: 90, title: '文凭', sort: true,align: 'center'},
                {field: 'train', width: 100, title: '培养方式',align: 'center'},
                {field: 'stutel', width: 120, title: '电话',align: 'center'},
                {title: '操作', width: 150, toolbar: '#currentTableBar', align: "center"}
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
        // $('.demoTable .layui-btn').on('click', function(){
        //     var type = $(this).data('type');
        //     active[type] ? active[type].call(this) : '';
        // });
        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            tableIns.reload({
                where: data.field,
                page: {
                    curr: 1
                }
            });
            return false;
        });
        //监听表格头部工具栏事件
        //toolbar是头部工具栏事件
        //currentTableFilter是表格lay-filter过滤器的值
        table.on("toolbar(currentTableFilter)",function(obj){
            // var checkStatus = table.checkStatus(obj.config.id)
            //     , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case "add": //添加按钮
                    openAddWindow();//打开添加窗口
                    break;
                case 'mulAdd':
                   inputAll();
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

        function inputAll() {
        mainIndex= layer.open({
                //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                type: 1,
                title: "批量导入学生信息",
                area: ['420px', '330px'],
                content: $("#popmulAddTest")//引用的弹出层的页面层的方式加载添加界面表单
            });
        }
        //打开添加窗口
        function openAddWindow(){
         mainIndex = layer.open({
                type:1,//打开类型
                title:"添加学生",  //窗口事件
                area:["800px","400px"],//窗口宽高
                content:$("#addOrUpdateWindow"),//引用的内容窗口
                success:function () {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    //添加提交的请求
                    url="/admin/stu/addStu";
                }
            });
        }
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
                    url="/admin/stu/updateStu";
                }
            });
        }
        //监听表单提交事件
        form.on("submit(doSubmit)",function (data) {
            //发送ajax请求提交
            $.post(url,data.field,function (result) {
            if(result.success){
                //刷新数据表格
                tableIns.reload();
                //关闭窗口
                layer.close(mainIndex);
            }
            //提示信息
                layer.msg(result.message);
            },"json");
        //禁止页面刷新
            return false;
        });
        //删除该学生
        function deleteById(data) {
        //提示用户是否删除该学生
            layer.confirm("确定要删除[<font color='red'>"+data.stuname+"</font>]吗？",{icon:3,title:"提示"},function(index){
            //发送ajax请求
                $.post("/admin/stu/deleteById",{"id":data.id},function (result) {
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

    });
</script>
<%--这里是弹出层表单（批量导入）--%>
<div class="layui-row" id="popmulAddTest" style="display:none;">
    <div class="layui-col-md11">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px" method="">
            <div class="layui-form-item">
                <label class="layui-form-label">批量导入学生信息：</label>
                <div class="layui-upload-drag" id="test8" name="file">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button type="button" class="layui-upload layui-btn" id="test19">批量导入</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>