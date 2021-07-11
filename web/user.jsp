<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息</title>
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
                            <label class="layui-form-label">角色名称</label>
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
            ,url:'user_queryAll'
            ,toolbar: '#toolbarDemo'
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'userid', title:'用户id', fixed: 'left',  sort: true,width:'100'}
                ,{field:'username', title:'用户名',width:'130'}
                // ,{field:'userpass', title:'密码'}
                ,{field:'sex', title:'性别'}
                ,{field:'birthday', title:'出生日期'}
                ,{field:'departmentname', title:'所属部门',width:'110'}
                ,{field:'telephone', title:'电话',width:'100'}
                ,{field:'address', title:'地址',width:'120'}
                ,{field:'email', title:'邮箱',width:'180'}
                ,{field:'entertime', title:'入职时间',width:'150'}
                ,{field:'salary', title:'工资',width:'100'}
                ,{field:'rolename', title:'职位',width:'80'}
                ,{field:'state', title:'状态', templet:'#state', sort: true,width:'130'}
                ,{field:'imageurl', title:'头像地址',width:'80'}
                // ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:'200'}
            ]]
            ,page: true
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
    });
</script>
</body>
</html>

