<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
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
                            <label class="layui-form-label">用户名称</label>
                            <div class="layui-input-inline">
                                <!--注意此处input标签里的id-->
                                <input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
                            </div>
                        </div>

                        <div class="layui-inline">
                            <!--注意此处button标签里的type属性-->
                            <button type="button" class="layui-btn layui-btn-primary" lay-submit data-type="reload"
                                    lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
        <!--注意此处table标签里的id-->
        <%--数据表格--%>
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
</div>
<%--搜索框ending--%>

<%--按钮start--%>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button lay-event="addUser" class="layui-btn layui-btn-radius" data-type="add" id="add"><i
                class="layui-icon layui-icon-add-1" style="font-size:20px;"></i>新增用户
        </button>
        <button lay-event="batchAdd" type="button" class="layui-btn layui-btn-radius" id="file">
            <i class="layui-icon">&#xe67c;</i>数据导入
        </button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="updateRole">编辑角色</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<%--按钮ending--%>

<%--增加和修改表单start--%>
<form class="layui-form layui-form-panel" id="add-form" name="add-form" style="display: none;" method="post"
      lay-filter="first1">
    <div class="layui-form-item" style="display: none;">
        <label class="layui-form-label">用户ID</label>
        <div class="layui-input-inline">
            <input type="text" name="userid" id="userid"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" id="username" lay-verify="required|username" required
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" id="password">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="text" name="userpass" id="userpass" lay-verify="required|pass" required
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <select name="sex" id="sex" lay-verify="required" lay-filter="interest-search" lay-search>
                <option value=""></option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">出生日期</label>
        <div class="layui-input-inline">
            <input type="text" name="birthday" id="birthday" lay-verify="required" required
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属部门</label>
        <div class="layui-input-inline">
            <select id="selectDep" lay-filter="mySelect" name="departmentid">
                <option value="0" disabled>---请选择---</option>
                <c:forEach items="${department}" var="dep">
                    <option value="${dep.departmentid}">${dep.departmentname}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" name="telephone" id="telephone" lay-verify="required|phone" required
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-inline">
            <input type="text" name="address" id="address" lay-verify="required" required
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" name="email" id="email" lay-verify="required|email" required
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">入职时间</label>
        <div class="layui-input-inline">
            <input type="text" name="entertime" id="entertime" readonly="readonly" lay-verify="required"
                   placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">工资</label>
        <div class="layui-input-inline">
            <input type="text" name="salary" id="salary" lay-verify="required" lay-verType="tips"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="save" type="button">确认</button>
        </div>
    </div>
</form>
<%--增加和修改表单ending--%>

<%--编辑角色模态框开始--%>
<div id="edit-main" style="display: none;width: 230px;margin: 26px auto;">
    <div class="layui-form" lay-filter="myDiv">
        <select id="selectRole" lay-filter="mySelect">
            <option value="0" disabled>---请选择---</option>
        </select>
    </div>
    <div class="layui-form-item" style="position: relative;top: 116px;right: 42px;">
        <div class="layui-input-block">
            <button class="layui-btn btns" id="savaRole" lay-submit lay-demo="getChecked" lay-filter="save">立即提交
            </button>
        </div>
    </div>
</div>
<%--编辑模态框结束--%>
<%--状态切换脚本start--%>
<script type="text/html" id="state">
    {{# if(d.state ==0){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.userid}} lay-filter="switchTest" lay-text="开启|停用">
    {{# } else { }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.userid}} lay-filter="switchTest" lay-text="开启|停用"
           checked>
    {{# } }}
</script>
<%--状态切换脚本ending--%>

<script src="layui/layui.js" charset="utf-8"></script>

<script>
    layui.use(['table', 'layer', 'form', 'laydate','upload'], function () {
        var laydate = layui.laydate;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var upload = layui.upload;
        //渲染日期组件
        laydate.render({
            elem: "#entertime",
            type: "date"
        });
        laydate.render({
            elem: "#birthday",
            type: "date"
        });
        //自定义表单验证规则
        form.verify({
            username: function(value, item){ //value：表单的值、item：表单的DOM对象
                if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '用户名不能有特殊字符';
                }
                if(/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if(/^\d+\d+\d$/.test(value)){
                    return '用户名不能全为数字';
                }
            }
            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            // ,pass: [/^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格']

        });
        //数据表格渲染
        table.render({
            elem: '#test'
            , id: 'testReload'
            , url: 'user_queryAll'
            , toolbar: '#toolbarDemo'
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'userid', title: '用户id', fixed: 'left', sort: true, width: '100'}
                , {field: 'username', title: '用户名', width: '130'}
                // ,{field:'userpass', title:'密码'}
                , {field: 'sex', title: '性别'}
                , {field: 'birthday', title: '出生日期'}
                , {field: 'departmentname', title: '所属部门', width: '110'}
                , {field: 'telephone', title: '电话', width: '100'}
                , {field: 'address', title: '地址', width: '120'}
                , {field: 'email', title: '邮箱', width: '180'}
                , {field: 'entertime', title: '入职时间', width: '150'}
                , {field: 'salary', title: '工资', width: '100'}
                , {field: 'rolename', title: '职位', width: '80'}
                , {field: 'state', title: '状态', templet: '#state', sort: true, width: '130'}
                , {field: 'imageurl', title: '头像地址', width: '80'}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: '200'}
            ]]
            , page: true
        });
        //文件上传渲染
        upload.render({
            elem: '#file'
            ,url: 'upload_file' //改成您自己的上传接口
            ,accept: 'file' //普通文件
            ,method: 'post'
            ,done: function(res){
                layer.alert(res.msg);
                table.reload("testReload");
                // console.log(res);
            }
        });
        var indexs;
        var $ = layui.$;
        var userid = 0;
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            userid = obj.data.userid;
            //判断点击的是否是修改角色信息
            if (layEvent === 'updateRole') {
                //清空下拉列表框
                $("#selectRole").empty();
                $("#selectRole").append('<option disabled  value=0>---请选择---</option>');
                $.ajax({
                    type: "post",
                    url: "role_selectRole",
                    data: "",
                    async: false, // 同步
                    success: function (datas) {
                        //发生同步请求查询用户的角色
                        $.ajax({
                            type: "post",
                            url: "role_selectRoleIdByUserId",
                            async: false, // 同步
                            data: "userid=" + data.userid,
                            success: function (msg) {
                                if (msg == 0) {
                                    $("#selectRole").append("<option selected value=0>尚未有角色</option>");
                                }
                                for (var i = 0; i < datas.data.length; i++) {
                                    var roleid = datas.data[i].roleid;
                                    var rolename = datas.data[i].rolename;
                                    if (msg == roleid) {
                                        $("#selectRole").append("<option selected value=" + roleid + ">" + rolename + "</option>");
                                    } else {
                                        $("#selectRole").append("<option value=" + roleid + ">" + rolename + "</option>");
                                    }
                                }
                            }
                        });
                        //渲染下拉列表框
                        layui.form.render('select');
                    }
                });
                indexs = layer.open({
                    type: 1,//弹出层的类型
                    title: '编辑角色',
                    area: ['400px', '300px'],
                    content: $("#edit-main")//引用的窗口代码
                });
            } else if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    console.log(data.id);
                    //向服务端发送删除指令
                    $.ajax({
                        url: 'delete_user',
                        type: 'get',
                        data: {"userid": data.userid},//向服务器端发送要删除的id
                        success: function (res) {
                            if (res.code == 200) {
                                layer.msg("删除成功", {icon: 6});
                            } else {
                                layer.msg("删除失败", {icon: 2});
                            }
                        },
                        error: function () {
                            console.log("无返回值");
                        }
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                //打开更新窗口 并对数据进行更新
                openUpdateWindow(data);
                //同步更新缓存对应的值
            }
        });

        //提交修改角色的按钮
        $("#savaRole").click(function () {
            $.ajax({
                type: "post",
                url: "role_updateUserRole",
                data: "userid=" + userid + "&roleid=" + $("#selectRole").val(),
                success: function (msg) {
                    layer.msg(msg);
                    table.reload("testReload");
                }
            });
            //关闭指定弹出层
            layer.close(indexs);
        });
        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 1 : 0), {
                offset: '6px'
            });
            // layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
            $.ajax({
                url: 'user_updateState',
                type: 'GET',
                data: {"userid": data.value, "state": this.checked ? 1 : 0},//向服务器端发送要修改的id
                success: function (res) {
                    if (res.code == 200) {
                        layer.msg("处理成功", {icon: 6});
                    } else {
                        layer.msg("处理失败", {icon: 2});
                    }
                },
                error: function () {
                    console.log("无返回值");
                }
            });
        });
        //以下是搜索框进行监测
        var $ = layui.$, active = {
            reload: function () {
                var demoReload = $('#demoReload');
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        keyword: demoReload.val()
                    }
                });
            }
        };

        $('#btn .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
            $('#demoReload').val('');//清空搜索栏
        });
        //工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'addUser':
                    openAddWindow();//开启添加菜单的表单
                    break;
            }
            ;
        });
        var url;
        var mainindex;

        //添加菜单信息
        function openAddWindow() {
            var openButton = document.querySelector("#password");
            openButton.style.display="block";
            mainindex = layer.open({
                type: 1,//弹出层的类型
                title: '添加菜单信息',
                area: ['800px', '600px'],
                content: $("#add-form"),//引用的窗口代码
                success: function () {
                    //清空表单数据
                    $("#add-form")[0].reset();
                    url = "user_insert";
                }
            });
        }

        //打开修改菜单信息
        function openUpdateWindow(data) {
            var updateButton = document.querySelector("#password");
            updateButton.style.display="none";
            mainindex = layer.open({
                type: 1,//弹出层的类型
                title: '修改菜单信息',
                area: ['800px', '600px'],
                content: $("#add-form"),//引用的窗口代码
                success: function () {
                    form.val("first1", data);
                    url = "update_user";
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
