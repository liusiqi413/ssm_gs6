<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>就业管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/css/layui.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/public.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui_ext/dtree/font/dtreefont.css">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <!-- 表格工具栏 -->
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
            </div>
        </script>

        <!-- 数据表格 -->
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <!-- 行工具栏 -->
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="grantMenu"><i class="layui-icon layui-icon-edit"></i>分配菜单</a>
        </script>

        <!-- 分配菜单的弹出层 开始 -->
        <div style="display: none;" id="selectRoleMenuDiv">
            <ul id="roleTree" class="dtree" data-id="0"></ul>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.extend({
        dtree:"${pageContext.request.contextPath}/static/layui_ext/dtree/dtree",//dtree脚本路径
    }).use(['form','table','layer','jquery','dtree'], function () {
        var $ = layui.jquery,
            form = layui.form,
            layer=layui.layer,
            table = layui.table,
            dtree=layui.dtree
        //渲染表格组件
        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/role/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 100, title: '角色编号', align: "center"},
                {field: 'rolename', width: 150, title: '角色名称', align: "center"},
                {field: 'roledesc', width: 200, title: '角色描述', align: "center"},
                {title: '操作', width: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            page: true
        });
        table.on("tool(currentTableFilter)",function(obj){
            switch (obj.event) {
                case "grantMenu": //分配菜单按钮
                    openGrantMenuWindow(obj.data);//打开分配菜单的窗口
                    break;
            }
        });
        function openGrantMenuWindow(data) {
            mainIndex = layer.open({
                type: 1,//打开类型
                area: ["400px", "550px"],
                title: "分配[<font color='red'>" + data.rolename + "</font>]的菜单",
                content: $("#selectRoleMenuDiv"),//引用的内容窗口
                btn:['确定','取消']
                ,yes:function(index,layero){
                    //获取复选框选中的值
                    var params=dtree.getCheckbarNodesParam("roleTree");
                    //判断是否有选中的复选框
                    if(params.length>0){
                        //定义数组，保存选中的值
                        var idArr=[];
                        //循环获取选中的值
                        for(var i=0;i<params.length;i++){
                        idArr.push(params[i].nodeId);//nodeId是选中的树节点的值，固定不能修改
                        }
                        //将数组转化为字符串
                        var ids=idArr.join(",");//选中的id值
                        //发送ajax请求，保存选中的菜单ID
                        $.post("/admin/role/saveRoleMenu",{"ids":ids,"roleId":data.id},function (result) {
                            layer.msg(result.message);
                        },"json");
                    }else{
                        layer.msg("请选择要分配菜单");
                    }

                }
                ,btn2:function(index,layero){

                },
                success:function () {
                    dtree.render({
                        elem:"#roleTree",
                        url:"/admin/role/initMenuTree?roleId="+data.id, //请求地址
                        dataStyle: "layuiStyle",  //使用layui风格的数据格式
                        dataFormat: "list",  //配置data的风格为list
                        response:{message:"msg",statusCode:0},  //修改response中返回数据的定义
                        checkbar:true,//开启复选框
                        checkbarType:"all" //默认就是all
                    });
                }
            });
        }
    });

</script>
</body>
</html>
