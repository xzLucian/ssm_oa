<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会议室申请</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <!--注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的-->
</head>
<body>
<%--表格--%>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button lay-event="add" class="layui-btn layui-btn-radius" data-type="add" id="add"><i
                class="layui-icon layui-icon-add-1" style="font-size:20px;"></i>会议室申请
        </button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
</script>
<form class="layui-form layui-form-panel" id="add-form" name="add-form" style="display: none;" method="post"
      lay-filter="first1">

    <div class="layui-form-item" style="display: none;">
        <label class="layui-form-label">申请表ID：</label>
        <div class="layui-input-inline">
            <input type="text" name="comid" id="comid" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">会议室</label>
        <div class="layui-input-inline">
            <select id="selectRoom" lay-filter="mySelect" name="roomid">
                <option value="0" disabled>---请选择---</option>
                <c:forEach items="${room}" var="r">
                    <option value="${r.roomid}">${r.roomname}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">申请人：</label>
        <div class="layui-input-inline">
            <input type="text" name="userid" id="userid" lay-verify="required"
                   autocomplete="off" class="layui-input" value="${user.userid}" style="display: none;">
            <input type="text" name="username" id="username" lay-verify="required"
                   autocomplete="off" class="layui-input" value="${user.username}" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">会议标题：</label>
        <div class="layui-input-inline">
            <input type="text" name="title" id="title" lay-verify="required" placeholder="请输入会议标题："
                   lay-verType="tips" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">日期范围</label>
            <div class="layui-inline" id="test-range">
                <div class="layui-input-inline">
                    <input type="text" id="starttime" name="starttime" class="layui-input" placeholder="开始日期">
                </div>
                <div class="layui-form-mid">-</div>
                <div class="layui-input-inline">
                    <input type="text" id="endtime" name="endtime" class="layui-input" placeholder="结束日期">
                </div>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="save" type="button">确定</button>
        </div>
    </div>
</form>
<%--新增修改模态框结束--%>

<%--编辑模态框结束--%>
<script type="text/html" id="state">
    {{# if(d.state ==0){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.userid}} lay-filter="switchTest" lay-text="已通过|未审核"
           disabled="disabled">
    {{# } else { }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.userid}} lay-filter="switchTest" lay-text="已通过|未审核"
           checked disabled="disabled">
    {{# } }}
</script>
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table', 'layer', 'form', 'laydate', 'jquery'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        // var $ = layui.jquery;
        //渲染日期组件
        laydate.render({
            elem: '#test-range'
            , type: 'datetime'
            , range: ['#starttime', '#endtime']
            , done: function (value) {
                // console.log(calculateTime(value));
                // $('#totaltime').val(calculateTime(value));
            }
        });
        table.render({
            elem: '#test'
            , id: 'testReload'//此ID用于绑定搜索后表单重载
            , url: 'communicate_selectMine'
            , toolbar: '#toolbarDemo'
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'comid', title: '申请表ID', fixed: 'left', sort: true}
                , {field: 'roomname', title: '会议室'}
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
                if (obj.data.state == 1) {
                    layer.msg("由于您的申请已处理，不可操作");
                } else {
                    openUpdateWindow(data);//开启添加数据的表单
                }
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
        //工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'add':
                    openAddWindow();//开启添加菜单的表单
                    // // //加载下拉菜单并显示
                    // $("#selectRoom").empty();
                    // $("#selectRoom").append('<option disabled  value=0>---请选择---</option>');
                    // $.ajax({
                    //     type: "post",
                    //     url: "room_selectRoom",
                    //     // async: false, // 同步
                    //     data: "",
                    //     success: function (res) {
                    //         // if (res == 100) {
                    //         //     $("#selectRoom").append("<option selected value='0'>尚未有会议室</option>");
                    //         // }
                    //         for (var i = 0; i < res.data.length; i++) {
                    //             var roomid = res.data[i].roomid;
                    //             var roomname = res.data[i].roomname;
                    //             $("#selectRoom").append("<option value=" + roomid + ">" + roomname + "</option>");
                    //         }
                    //         //渲染下拉列表框
                    //         layui.form.render('select');
                    //     }
                    // });
                    break;
            }
            ;
        });


        var url;
        var mainindex;

        //添加菜单信息
        function openAddWindow() {
            mainindex = layer.open({
                type: 1,//弹出层的类型
                title: '申请会议信息',
                area: ['600px', '600px'],
                content: $("#add-form"),//引用的窗口代码
                success: function () {
                    //清空表单数据
                    $("#add-form")[0].reset();
                    url = "communicate_insert"

                }
            });
        }

        //打开修改菜单信息
        function openUpdateWindow(data) {
            mainindex = layer.open({
                type: 1,//弹出层的类型
                title: '会议申请信息',
                area: ['600px', '600px'],
                content: $("#add-form"),//引用的窗口代码
                success: function () {
                    form.val("first1", data);
                    url = "communicate_update";
                }
            });
        }

        //save按钮监听事件
        form.on("submit(save)", function (data) {
            console.log($("#selectRoom").val());
            $.ajax({
                url: url,
                //JSON.stringify(data.field),
                data: JSON.stringify(data.field),
                type: 'post',
                dataType: 'json',
                contentType: "application/json;charset=UTF-8",
                success: function (res) {
                    console.log(res);
                    if (res.code == 200) {
                        layer.alert('成功', {icon: 1});
                        table.reload("testReload");
                        layer.close(mainindex);
                    } else {
                        layer.alert('失败', {icon: 2});
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
