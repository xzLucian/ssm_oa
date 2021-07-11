<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会议室管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<%--表格--%>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button lay-event="add" class="layui-btn layui-btn-radius" data-type="add" id="add"><i
                class="layui-icon layui-icon-add-1" style="font-size:20px;"></i>新增会议室
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
        <label class="layui-form-label">会议室ID：</label>
        <div class="layui-input-inline">
            <input type="text" name="roomid" id="roomid" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">会议室名字：</label>
        <div class="layui-input-inline">
            <input type="text" name="roomname" id="roomname" lay-verify="required" required placeholder="请输入会议室名:"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">容纳人数：</label>
        <div class="layui-input-inline">
            <input type="text" name="peoplenum" id="peoplenum" lay-verify="required"
                   placeholder="请输入容纳人数" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">会议地址：</label>
        <div class="layui-input-inline">
            <input type="text" name="roomaddress" id="roomaddress" lay-verify="required" placeholder="请输入会议地址："
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

<script type="text/html" id="state">
    {{# if(d.state ==0){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.roomid}} lay-filter="switchTest" lay-text="开启|停用">
    {{# } else { }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.roomid}} lay-filter="switchTest" lay-text="开启|停用"
           checked>
    {{# } }}
</script>
<script type="text/html" id="isapply">
    {{# if(d.isapply ==0){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.roomid}} lay-filter="switchApply" lay-text="占用|空闲" disabled="disabled">
    {{# } else { }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.roomid}} lay-filter="switchApply" lay-text="占用|空闲"
           checked disabled="disabled">
    {{# } }}
</script>
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        table.render({
            elem: '#test'
            ,id:'testReload'
            , url: 'room_queryAll'
            , toolbar: '#toolbarDemo'
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'roomid', title: '会议id', fixed: 'left', sort: true}
                , {field: 'roomname', title: '会议室名字'}
                , {field: 'peoplenum', title: '容纳人数'}
                , {field: 'roomaddress', title: '会议地址'}
                , {field: 'state', title: '会议室状态', templet: '#state'}
                , {field: 'isapply', title: '申请状态', templet: '#isapply'}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo'}
            ]]
            , page: true
        });
        var indexs;
        var $ = layui.$;
        var userid = 0;
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            roomid = obj.data.roomid;
            if (layEvent == "update") {
                openUpdateWindow(data);
            } else if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    console.log(data.roomid);
                    //向服务端发送删除指令
                    $.ajax({
                        url: 'room_delete',
                        type: 'get',
                        data: {"roomid": roomid},//向服务器端发送要删除的id
                        success: function (res) {
                            if (res.code == 200) {
                                layer.msg(res.msg, {icon: 6});
                                table.reload("testReload");
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
        //会议室状态修改
        form.on('switch(switchTest)', function (data) {
            //value={{d.userid}}
            console.log(data.value);//就是id
            layer.msg('开关checked：' + (this.checked ? 1 : 0), {
                offset: '6px'
            });
            $.ajax({
                url: 'room_updateRoomState',
                type: 'GET',
                data: {"roomid": data.value, "state": this.checked ? 1 : 0},//向服务器端发送要修改的id
                success: function (res) {
                    if (res.code == 200) {
                        layer.msg(res.msg, {icon: 6});
                        table.reload("testReload");
                    } else {
                        layer.msg(res.msg, {icon: 2});
                    }
                },
                error: function () {
                    console.log("无返回值");
                }
            });
        });
        //会议室申请状态监听
        form.on('switch(switchApply)', function (data) {
            console.log(data.value);//就是id
            layer.msg('开关checked：' + (this.checked ? 1 : 0), {
                offset: '6px'
            });
            $.ajax({
                url: 'room_updateApplyState',
                type: 'GET',
                data: {"roomid": data.value, "isapply": this.checked ? 1 : 0},//向服务器端发送要修改的id
                success: function (res) {
                    if (res.code == 200) {
                        layer.msg(res.msg, {icon: 6});
                        table.reload("testReload");
                    } else {
                        layer.msg(res.msg, {icon: 2});
                    }
                },
                error: function () {
                    console.log("无返回值");
                }
            });
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
                    url = "room_insert";
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
                    url = "room_update";
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
                        layer.alert('success', {icon: 1});
                        table.reload('testReload');
                        layer.close(mainindex);
                    } else {
                        layer.alert('error', {icon: 2});
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
