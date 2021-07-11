<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<%--搜索框--%>
<div class="layuimini-container">
    <div class="layuimini-main">
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px" id="btn">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">部门名称</label>
                            <div class="layui-input-inline">
                                <!--注意此处input标签里的id-->
                                <input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
                            </div>
                        </div>

                        <div class="layui-inline">
                            <!--注意此处button标签里的type属性-->
                            <button type="button" class="layui-btn layui-btn-primary" lay-submit data-type="reload" lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
        <!--注意此处table标签里的id-->
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
</div>
<%--表格--%>
<%--<table class="layui-hide" id="test" lay-filter="test"></table>--%>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button lay-event="add" class="layui-btn layui-btn-radius" data-type="add" id="add"><i
                class="layui-icon layui-icon-add-1" style="font-size:20px;"></i>新增部门
        </button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<form class="layui-form layui-form-panel" id="add-form" name="add-form" style="display: none;" method="post"
      lay-filter="first1">
    <div class="layui-form-item" style="display: none;">
        <label class="layui-form-label">部门ID：</label>
        <div class="layui-input-inline">
            <input type="text" name="departmentid" id="departmentid" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门名字：</label>
        <div class="layui-input-inline">
            <input type="text" name="departmentname" id="departmentname" lay-verify="required" required placeholder="请输入部门名字:"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">部门电话：</label>
        <div class="layui-input-inline">
            <input type="text" name="departmentphone" id="departmentphone" lay-verify="required|Machine"
                   placeholder="010-xxxxxxxx" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门人数：</label>
        <div class="layui-input-inline">
            <input type="text" name="departmentnumber" id="departmentnumber" lay-verify="required|OnlyNumber" placeholder="请输入部门人数："
                   lay-verType="tips"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="save" type="button">确定</button>
        </div>
    </div>
</form>
<%--新增修改模态框结束--%>
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table','layer','form'], function(){
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        //温馨提示：默认由前端自动合计当前行数据。从 layui 2.5.6 开始： 若接口直接返回了合计行数据，则优先读取接口合计行数据。
        //详见：https://www.layui.com/doc/modules/table.html#totalRow
        table.render({
            elem: '#test'
            ,id:'testReload'//此ID用于绑定搜索后表单重载
            ,url:'department_selectAll'
            ,toolbar: '#toolbarDemo'
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'departmentid', title:'部门id', fixed: 'left',  sort: true}
                ,{field:'departmentname', title:'部门名称'}
                ,{field:'departmentphone', title:'部门电话'}
                ,{field:'departmentnumber', title:'部门人数'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,page: true
        });
        //自定义表单验证规则
        form.verify({
            Machine:[/0\d{2,3}-[1-9]\d{6,7}/,'填写的内容不符合规范！']
            , OnlyNumber:[/^\d+$|^\d+[.]?\d+$/,'只能输入数字！']

        });
        var indexs;
        var $ = layui.$;
        var userid = 0;
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            departmentid = obj.data.departmentid;
            if (layEvent == "update") {
                openUpdateWindow(data);
            } else if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    console.log(data.departmentid);
                    //向服务端发送删除指令
                    $.ajax({
                        url: 'department_delete',
                        type: 'get',
                        data: {"departmentid": departmentid},//向服务器端发送要删除的id
                        success: function (res) {
                            if (res.code == 200) {
                                layer.msg(res.msg, {icon: 6});
                            } else {
                                layer.msg(res.msg, {icon: 2});
                            }
                        },
                        error: function () {
                            console.log("无返回值");
                        }
                    });
                });
            }
        });
        //工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'add':
                    openAddWindow();//开启添加菜单的表单
                    break;
            }
            ;
        });
        //以下是搜索框进行监测
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        keyword: demoReload.val()
                    }
                });
            }
        };

        $('#btn .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
            $('#demoReload').val('');//清空搜索栏
        });
        var url;
        var mainindex;

        //添加菜单信息
        function openAddWindow() {
            mainindex = layer.open({
                type: 1,//弹出层的类型
                title: '添加菜单信息',
                area: ['400px', '300px'],
                content: $("#add-form"),//引用的窗口代码
                success: function () {
                    //清空表单数据
                    $("#add-form")[0].reset();
                    url = "department_insert";
                }
            });
        }

        //打开修改菜单信息
        function openUpdateWindow(data) {
            mainindex = layer.open({
                type: 1,//弹出层的类型
                title: '修改菜单信息',
                area: ['400px', '300px'],
                content: $("#add-form"),//引用的窗口代码
                success: function () {
                    form.val("first1", data);
                    url = "department_update";
                }
            });
        }

        //save按钮监听事件
        form.on("submit(save)", function (data) {
            $.ajax({
                url: url,
                data: JSON.stringify(data.field),
                type: 'post',
                dataType: 'json',
                contentType: "application/json;charset=UTF-8",
                success: function (res) {
                    console.log(res);
                    if (res.code == 200) {
                        layer.alert(res.msg, {icon: 1});
                        table.reload('testReload');
                        layer.close(mainindex);
                    } else {
                        layer.alert(res.msg, {icon: 2});
                    }
                },
                error: function () {
                    console.log("无返回值");
                }
            })
        })
    });
</script>
</body>
</html>





