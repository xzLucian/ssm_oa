<%--
  Created by IntelliJ IDEA.
  User: 熊
  Date: 2021/1/8
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示菜单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<%--表格--%>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button lay-event="addMenu" class="layui-btn layui-btn-radius"  data-type="add" id="add" ><i class="layui-icon layui-icon-add-1" style="font-size:20px;"></i>新增菜单</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<%--新增修改模态框--%>

<form class="layui-form layui-form-panel" id="add-form" name="add-form" style="display: none;" method="post"
      lay-filter="first1">
    <%--隐藏域用来保存当前id--%>
    <input type="hidden" name="id">
    <div class="layui-form-item">
        <label class="layui-form-label">菜单id：</label>
        <div class="layui-input-inline">
            <input type="text" name="menuid" id="menuid" lay-verify="required" required placeholder="请输入菜单id"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单标题：</label>
        <div class="layui-input-inline">
            <input type="text" name="title" id="title" lay-verify="required" required placeholder="请输入菜单标题"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <select name="state" id="state" lay-verify="required" lay-filter="interest-search" lay-search>
                <option value=""></option>
                <option value="1">启用</option>
                <option value="0">禁用</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单地址：</label>
        <div class="layui-input-inline">
            <input type="text" name="url" id="url" lay-verify="required"
                   placeholder="请输入菜单地址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单上级id：</label>
        <div class="layui-input-inline">
            <input type="text" name="pid" id="pid" lay-verify="required" placeholder="请输入菜单上级id" lay-verType="tips"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">菜单logo图：</label>
        <div class="layui-input-inline">
            <input type="text" name="iconCls" id="iconCls" lay-verify="required" placeholder="请输入菜单logo图"
                   lay-verType="tips" autocomplete="off" class="layui-input">
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
            ,url:'menu_selectMenuList'
            ,toolbar: '#toolbarDemo'
            ,title: '菜单数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'menuid', title:'菜单id',  fixed: 'left',  sort: true}
                ,{field:'title', title:'菜单标题'}
                // ,{field:'state', title:'菜单状态'}
                // , {field: 'state', title: '菜单状态', width: 100, templet: function (data) {
                //         if (data.state == 1) {
                //             return '<div> <input type="checkbox" checked="" name="codeSwitch" lay-skin="switch" id="open" lay-filter="switchTest" switchId=' + data.menuid + '' +
                //                 ' lay-text="启用|禁用"  value=' + data.state + '></div>';
                //         }
                //         return '<div> <input type="checkbox" lay-skin="switch" name="codeSwitch"  switchId=' + data.menuid + ' lay-filter="switchTest"' +
                //             'lay-text="启用|禁用" value=' + data.state + '></div>';
                //     }
                // }
                ,{field:'url', title:'菜单地址'}
                ,{field:'pid', title:'菜单上级id',  sort: true}
                ,{field:'iconCls', title:'菜单logo图'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });

        //工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'addMenu':
                    openAddWindow();//开启添加菜单的表单
                    break;
            };
        });
        //工具条事件
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if (layEvent === 'del') { //删除
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    console.log(data.id);
                    //向服务端发送删除指令
                    $.ajax({
                        url: 'menu_delete',
                        type: 'get',
                        data: {"menuid": data.menuid},//向服务器端发送要删除的id
                        success: function (res) {
                            if (res.code==200) {
                                layer.msg("删除成功", {icon: 6});
                            }else {
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
        var url;
        var indexs;
        //添加菜单信息
        function openAddWindow() {
            indexs=layer.open({
                type:1,//弹出层的类型
                title:'添加菜单信息',
                area: ['800px','600px'],
                content:$("#add-form"),//引用的窗口代码
                success:function () {
                    //清空表单数据
                    $("#add-form")[0].reset();
                    url = "menu_insert";
                }
            });
        }
        //打开修改菜单信息
        function openUpdateWindow(data) {
            indexs=layer.open({
                type:1,//弹出层的类型
                title:'修改菜单信息',
                area: ['800px','600px'],
                content:$("#add-form"),//引用的窗口代码
                success:function () {
                    form.val("first1", data);
                    url = "menu_doUpdateMenu";
                }
            });
        }

        //save按钮监听事件
        form.on("submit(save)", function (data) {
            $.ajax({
                url: url,
                data: JSON.stringify(data.field),
                type: 'post',
                dataType:'json',
                contentType: "application/json;charset=UTF-8",
                success: function (res) {
                    console.log(res);
                    if (res.code==200) {
                        layer.alert('success', {icon: 1});
                        table.reload('test');
                        layer.close(indexs);
                    } else {
                        layer.alert('error', {icon: 2});
                    }
                },
                error: function () {
                    console.log("无返回值");
                }
            })
        })
        /**
         * 监听开关 状态 操作
         */
        form.on('switch(switchTest)', function (data) {
            /**
             * 禁用标签
             * 状态 赋值为 0
             */
            // var layerIndex = layer.load(3);
            if ((this.checked ? 'true' : 'false') == 'false') {
                $.ajax({
                    url: 'menu_modifyState',
                    data: {
                        state: 0,
                        menuid: data.elem.getAttribute("switchId")
                    },
                    type: 'POST', //HTTP请求类型
                    success: function (data) {
                        layer.alert('禁用成功', {icon: 1});
                        // console.log(data);
                    }, error: function () {
                        // console.log("禁用失败");
                        layer.alert('禁用成功', {icon: 1});
                    }

                })
            } else {
                /**
                 * 启动标签
                 * 状态 赋值为 1
                 */
                $.ajax({
                    url: 'menu_modifyState',
                    data: {
                        state: 1,
                        menuid: data.elem.getAttribute("switchId")
                    },
                    type: 'POST',
                    success: function (data) {
                        layer.alert('启用成功', {icon: 1});
                    }, error: function () {
                        layer.alert('启用失败', {icon: 1});
                    }

                })
            }
        });
    });
</script>
</body>
</html>
