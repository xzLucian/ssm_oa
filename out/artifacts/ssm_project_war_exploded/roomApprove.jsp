<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会议室审批</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
</head>
<body>
<%--表格--%>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<%--编辑模态框结束--%>
<script type="text/html" id="state">
    {{# if(d.state ==0){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.comid}} lay-filter="switchTest" lay-text="已处理|未处理">
    {{# } else { }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.comid}} lay-filter="switchTest" lay-text="已处理|未处理"
           checked>
    {{# } }}
</script>
<script src="layui/layui.js" charset="utf-8"></script>

<script>
    layui.use(['table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        table.render({
            elem: '#test'
            ,id:"testReload"
            , url: 'communicate_selectAll'
            , toolbar: '#toolbarDemo'
            , title: '会议室表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'comid', title: '申请表ID', fixed: 'left', sort: true}
                , {field: 'roomname', title: '会议室名称'}
                , {field: 'username', title: '申请人'}
                , {field: 'title', title: '会议标题'}
                , {field: 'starttime', title: '起始日期'}
                , {field: 'endtime', title: '结束日期'}
                , {field: 'state', title: '状态', templet: '#state'}
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
            userid = obj.data.userid;
            if (layEvent == "update") {
                openUpdateWindow(data);
            } else if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    console.log(data.id);
                    //向服务端发送删除指令
                    $.ajax({
                        url: 'room_delete',
                        type: 'get',
                        data: {"userid": data.userid},//向服务器端发送要删除的id
                        success: function (res) {
                            if (res.code == 200) {
                                layer.msg("删除成功", {icon: 6});
                                table.reload("testReload");
                            } else {
                                layer.msg("删除失败", {icon: 2});
                            }
                        },
                        error: function () {
                            console.log("无返回值");
                        }
                    });
                });
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 1 : 0), {
                offset: '6px'
            });
            $.ajax({
                url: 'communicate_updateState',
                type: 'GET',
                data: {"comid": data.value, "state": this.checked ? 1 : 0},//向服务器端发送要修改的id
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
    });


</script>
</body>
</html>
