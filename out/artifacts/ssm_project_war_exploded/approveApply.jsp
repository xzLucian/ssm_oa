<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示用户</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
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
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
</div>

<%--新增修改模态框结束--%>
<script type="text/html" id="state">
    {{# if(d.state ==0){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.id}} lay-filter="switchTest" lay-text="已处理|未处理" disabled="disabled">
    {{# } else if(d.state ==1){}}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.id}} lay-filter="switchTest" lay-text="已同意|未处理"
           checked disabled="disabled">
    {{# } else{ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.id}} lay-filter="switchTest" lay-text="已驳回|未处理"
           checked disabled="disabled">
    {{# } }}
</script>
<script type="text/html" id="isApply">
    {{# if(d.isApply ==0){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.id}} lay-filter="switchTest" lay-text="已处理|未处理" disabled="disabled">
    {{# } else if(d.isApply ==1){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.id}} lay-filter="switchTest" lay-text="已同意|未处理"
           checked disabled="disabled">
    {{# } else{ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.id}} lay-filter="switchTest" lay-text="已驳回|未处理"
           checked disabled="disabled">
    {{# } }}
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" id="agreebtn" lay-event="agree">同意</a>
    <a class="layui-btn layui-btn-xs" id="disagressbtn" lay-event="disagree">驳回</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        //温馨提示：默认由前端自动合计当前行数据。从 layui 2.5.6 开始： 若接口直接返回了合计行数据，则优先读取接口合计行数据。
        //详见：https://www.layui.com/doc/modules/table.html#totalRow
        table.render({
            elem: '#test'
            , id: 'testReload'//此ID用于绑定搜索后表单重载
            , url: 'user_applyLeave'
            , toolbar: '#toolbarDemo'
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', fixed: 'left', sort: true,width:'70'}
                // , {field: 'userid', title: '用户id'}
                , {field: 'username', title: '用户名',width:'100'}
                , {field: 'departmentid', title: '部门',width:'100'}
                , {field: 'type', title: '请假类型',width:'100'}
                , {field: 'reason', title: '请假原因',width:'100'}
                , {field: 'starttime', title: '开始时间',width:'100'}
                , {field: 'endtime', title: '结束时间',width:'100'}
                , {field: 'totaltime', title: '时间差',width:'100'}
                , {field: 'state', title: '一级审核', templet: '#state', sort: true,width:'110'}
                , {field: 'isApply', title: '二级审核', templet: '#isApply', sort: true,width:'110'}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo',width:'180'}
            ]]
            , page: true
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
        var indexs;
        var $ = layui.$;
        var userid = 0;
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            console.log(data.id);

            if (layEvent === 'agree') {
                $.ajax({
                    url: 'user_updateLeave',
                    type: 'GET',
                    data: {"id": data.id, "state": 1},//向服务器端发送要修改的id
                    success: function (res) {
                        if (res.code == 200) {
                            layer.msg("处理成功", {icon: 6});
                            table.reload("testReload");
                        } else {
                            layer.msg("处理失败", {icon: 2});
                        }
                    },
                    error: function () {
                        console.log("无返回值");
                    }
                });
            }else if(layEvent === 'disagree'){
                $.ajax({
                    url: 'user_updateLeave',
                    type: 'GET',
                    data: {"id": data.id, "state": 2},//向服务器端发送要修改的id
                    success: function (res) {
                        if (res.code == 200) {
                            layer.msg("处理成功", {icon: 6});
                            table.reload("testReload");
                        } else {
                            layer.msg("处理失败", {icon: 2});
                        }
                    },
                    error: function () {
                        console.log("无返回值");
                    }
                });
            }else if(layEvent === 'delete'){
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    console.log(data.id);
                    //向服务端发送删除指令
                    $.ajax({
                        url: '',
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
        // form.on('switch(switchTest)', function (data) {
        //     layer.msg('开关checked：' + (this.checked ? 1 : 0), {
        //         offset: '6px'
        //     });
        //     layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        //     $.ajax({
        //         url: 'user_updateLeave',
        //         type: 'GET',
        //         data: {"id": data.value, "state": this.checked ? 1 : 0},//向服务器端发送要修改的id
        //         success: function (res) {
        //             if (res.code == 200) {
        //                 layer.msg("处理成功", {icon: 6});
        //             } else {
        //                 layer.msg("处理失败", {icon: 2});
        //             }
        //         },
        //         error: function () {
        //             console.log("无返回值");
        //         }
        //     });
        // });
    });


</script>
</body>
</html>
