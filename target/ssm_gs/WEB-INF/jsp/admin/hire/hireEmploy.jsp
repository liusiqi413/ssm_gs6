<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/css/layui.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <style>
        .thumbBox{ height:200px; overflow:hidden; border:1px solid #e6e6e6; border-radius:2px; cursor:pointer; position:relative; text-align:center; line-height:200px;width: 210px;}
        .thumbImg{ max-width:100%; max-height:100%; border:none;}
        .thumbBox:after{ position:absolute; width:100%; height:100%;line-height:200px; z-index:-1; text-align:center; font-size:20px; content:"缩略图"; left:0; top:0; color:#9F9F9F;}
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <%-- 搜索条件 --%>
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">公司名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="companyName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn" lay-submit lay-filter="data-search-btn"><i
                                    class="layui-icon layui-icon-search"></i>搜索
                            </button>
                            <button type="reset" class="layui-btn layui-btn-warm"><i
                                    class="layui-icon layui-icon-refresh-1"></i>重置
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <%-- 表格工具栏 --%>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i
                        class="layui-icon layui-icon-add-1"></i>添加
                </button>
            </div>
        </script>

        <%-- 数据表格 --%>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <%-- 行工具栏 --%>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i
                    class="layui-icon layui-icon-edit"></i>编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i
                    class="layui-icon layui-icon-close"></i>删除</a>
        </script>

        <%-- 添加和修改窗口 --%>
        <div style="display: none;padding: 5px" id="addOrUpdateWindow">
            <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">
                <!-- 隐藏域，保存房型id -->
                <input type="hidden" name="id">
                <div class="layui-col-md12 layui-col-xs12">
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md9 layui-col-xs7">
                            <div class="layui-form-item magt3" style="margin-top: 8px;">
                                <label class="layui-form-label">公司名称</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="companyName" lay-verify="required"  placeholder="请输入公司名称">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">招聘岗位</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="hireType" lay-verify="required"  placeholder="请输入招聘岗位"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">需求专业</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="Request" lay-verify="required"  placeholder="请输入需求专业"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">招聘人数</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="numbers" placeholder="请输入招聘人数"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">薪资</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="salary" placeholder="请输入薪资"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">工作地点</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="place" lay-verify="required"  placeholder="请输入工作地点"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">详情</label>
                                <div class="layui-input-block">
                                    <textarea name="descs" id="descs" style="display: none;"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">联系方式</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="tel" lay-verify="required" placeholder="请输入工作地点"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3 layui-col-xs5">
                            <div class="layui-upload-list thumbBox mag0 magt3">
                                <input type="hidden" name="photo" id="photo" value="images/defaultimg.jpg">
                                <img class="layui-upload-img thumbImg" src="/company/show/images/defaultimg.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="text-align: center;">
                            <button type="button" class="layui-btn" lay-submit lay-filter="doSubmit" id="doSubmit"><span
                                    class="layui-icon layui-icon-add-1"></span>提交
                            </button>
                            <button type="reset" class="layui-btn layui-btn-warm"><span
                                    class="layui-icon layui-icon-refresh-1"></span>重置
                            </button>
                        </div>
                    </div>
                    </div>
            </form>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table', 'laydate', 'jquery', 'layer','upload','layedit'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            upload = layui.upload,
            layer = layui.layer,
            table = layui.table,
            layedit=layui.layedit;

        //渲染表格组件
        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/hire/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 60, title: '编号', align: "center"},
                {field: 'companyName', width: 150, title: '公司名称', align: "center"},
                {field: 'hireType', width: 150, title: '招聘岗位'},
                {field: 'request', width: 150, title: '需求专业'},
                {field: 'numbers', width:100, title: '招聘人数'},
                {field: 'salary', width:100, title: '薪资'},
                {field: 'place', width:100, title: '工作地点'},
                {field: 'descs', width:300, title: '详情'},
                {field: 'tel', width:100, title: '联系方式'},
                {field: 'times', width: 100, title: '发布时间'},
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
//渲染文件上传区域
        upload.render({
            elem:".thumbImg",//绑定元素
            url: '/admin/hire/uploadFile',//文件上传地址
            acceptMime: 'image/*',//规定打开文件选择框时，筛选出的文件类型
            field: 'file',//文件上传的字段值，等同于input标签的name属性值，该值必须与控制器中的方法参数名一致
            method: "post",//提交方式
            //文件上传成功后的回调函数
            done: function (res, index, upload) {
                //设置图片回显路径
                $(".thumbImg").attr("src",res.data.src);
                $('.thumbBox').css("background", "#fff");
                //给图片隐藏域赋值
                $("#photo").val(res.imagePath);
            }
        });
        //监听头部工具栏事件
        table.on("toolbar(currentTableFilter)",function (obj) {
            switch (obj.event) {
                case "add"://添加按钮
                    openAddWindow();//打开添加窗口
                    break;
            }
        });


        //监听行工具栏事件
        table.on("tool(currentTableFilter)",function (obj) {
            console.log(obj);
            switch (obj.event) {
                case "edit"://编辑按钮
                    openUpdateWindow(obj.data);//打开修改窗口
                    break;
                case "delete"://删除按钮
                    deleteById(obj.data);
                    break;
            }
        });

        var url;//提交地址
        var mainIndex;//打开窗口的索引
        var detailIndex;//富文本编辑器的索引
        /**
         * 打开添加窗口
         */
        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,//打开类型
                title: "添加招聘信息",//窗口标题
                area: ["800px", "500px"],//窗口宽高
                content: $("#addOrUpdateWindow"),//引用的内容窗口
                maxmin:true,//窗口在最大化
                success: function () {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    //添加的提交请求
                    url = "/admin/hire/addHire";
                    //重置默认图片,注意：显示图片必须在图片名称前加上/company/show
                    $(".thumbImg").attr("src","/company/show/images/defaultimg.jpg");
                    //重置图片隐藏域的值
                    $("#photo").val("images/defaultimg.jpg");
                }
            });
            //设置窗口最大化
            layer.full(mainIndex);
            //初始化文本编辑器
            detailIndex=layedit.build("descs",{
                uploadImage:{
                    url:"/admin/hire/uploadFile",//文件上传地址
                    type:"post"//提交方式
                }
            });
        }
        /**
         * 打开修改窗口
         */
        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,//打开类型
                title: "修改招聘信息",//窗口标题
                area: ["800px", "500px"],//窗口宽高
                content: $("#addOrUpdateWindow"),//引用的内容窗口
                maxmin:true,
                success: function () {
                    //表单数据回显
                    form.val("dataFrm",data);
                    //修改的提交请求
                    url = "/admin/hire/updateHire";
                    //图片回显
                    $(".thumbImg").attr("src","/company/show/"+data.photo);
                    //图片隐藏域的值回显
                    $("#photo").val(data.photo);
                }
            });
            //设置窗口打开时最大化显示
            layer.full(mainIndex);
            //初始化富文本编辑器
            detailIndex=layedit.build("descs",{
                uploadImage: {
                    url:"/admin/hire/uploadFile", //文件上传地址
                    type:"post"//提交方式
                }
            });
        }

        //监听表单提交事件
        form.on("submit(doSubmit)",function (data) {
            //将富文本编辑器的内容同步到textarea文本域中
            layedit.sync(detailIndex);
            //$("#dataFrm").serialize()一次性获取表单数据，要求表单标签必须有name属性值
            $.post(url,$("#dataFrm").serialize(),function(result){
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
            layer.confirm("确定要删除[<font color='red'>"+data.companyName+"</font>]吗？",{icon:3,title:"提示"},function(index){
                //发送ajax请求
                $.post("/admin/hire/deleteHire",{"id":data.id},function (result) {
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

</body>
</html>