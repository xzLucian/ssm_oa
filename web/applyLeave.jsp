<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假申请</title>
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
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
</div>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button lay-event="addholiday" class="layui-btn layui-btn-radius" data-type="add" id="add"><i
                class="layui-icon layui-icon-add-1" style="font-size:20px;"></i>请假申请
        </button>
    </div>
</script>

<form class="layui-form layui-form-panel" id="add-form" name="add-form" style="display: none;" method="post"
      lay-filter="first1">
    <%--隐藏域用来保存当前id--%>
    <input type="hidden" name="id">
    <div class="layui-form-item" style="display: none;">
        <label class="layui-form-label">用户id：</label>
        <div class="layui-input-inline">
            <input type="text" name="userid" id="userid" lay-verify="required" required placeholder="${user.userid}"
                   autocomplete="off" class="layui-input" value="${user.userid}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用户名：</label>
        <div class="layui-input-inline">
            <input type="text" name="username" id="username" lay-verify="required" required
                   autocomplete="off" class="layui-input" disabled="disabled" value="${user.username}">
        </div>
    </div>

        <div class="layui-form-item">
            <label class="layui-form-label">请假类型</label>
            <div class="layui-input-inline">
                <select name="type" id="type" lay-verify="required" lay-filter="interest-search" lay-search>
                    <option value=""></option>
                    <option value="病假">病假</option>
                    <option value="事假">事假</option>
                </select>
            </div>
        </div>
        <input type="hidden" name="departmentid" id="departmentid" value="${user.departmentid}">
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
        <label class="layui-form-label">请假原因：</label>
        <div class="layui-input-inline">
            <textarea name="reason" id="reason" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">请假总时长：</label>
        <div class="layui-input-inline">
            <input type="text" name="totaltime" id="totaltime" lay-verify="required" placeholder="请输入请假时长："
                   lay-verType="tips"
                   autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="save" type="button">确定</button>
        </div>
    </div>
</form>
<%--&lt;%&ndash;新增修改模态框结束&ndash;%&gt;--%>
<%--<script type="text/html" id="state">--%>
<%--    {{# if(d.state ==0){ }}--%>
<%--    <input type="checkbox" name="switch" lay-skin="switch" value={{d.userid}} lay-filter="switchTest" lay-text="已处理|未处理"--%>
<%--           disabled="disabled">--%>
<%--    {{# } else { }}--%>
<%--    <input type="checkbox" name="switch" lay-skin="switch" value={{d.userid}} lay-filter="switchTest"--%>
<%--           disabled="disabled" lay-text="已处理|未处理" checked>--%>
<%--    {{# } }}--%>
<%--</script>--%>
<%--新增修改模态框结束--%>
<script type="text/html" id="state">
    {{# if(d.state ==0||d.isApply==0){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.id}} lay-filter="switchTest" lay-text="已处理|未处理" disabled="disabled">
    {{# } else if(d.state ==1&&d.isApply==1){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.id}} lay-filter="switchTest" lay-text="已同意|未处理"
           checked disabled="disabled">
    {{# } else if(d.state ==2||d.isApply==2){ }}
    <input type="checkbox" name="switch" lay-skin="switch" value={{d.id}} lay-filter="switchTest" lay-text="已驳回|未处理"
           checked disabled="disabled">
    {{# } }}
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
</script>

<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use(['table', 'layer', 'form', 'laydate', 'jquery'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var $ = layui.jquery;
        //渲染日期组件
        laydate.render({
            elem: '#test-range'
            ,type: 'datetime'
            ,range: ['#starttime', '#endtime']
            ,done: function(value){
                // console.log(calculateTime(value));
                $('#totaltime').val(calculateTime(value));
            }
        });
        //计算两个时间戳的差值并将其转换成时间格式的字符串
        function calculateTime(timeRange){
            var time="";
            var arr= splitAndchange(timeRange,'-',2);
            runTime = parseInt((arr[1]-arr[0]) / 1000);
            var year = Math.floor(runTime / 86400 / 365);
            runTime = runTime % (86400 * 365);
            var month = Math.floor(runTime / 86400 / 30);
            runTime = runTime % (86400 * 30);
            var day = Math.floor(runTime / 86400);
            runTime = runTime % 86400;
            var hour = Math.floor(runTime / 3600);
            runTime = runTime % 3600;
            var minute = Math.floor(runTime / 60);
            runTime = runTime % 60;
            var second = runTime;
            console.log(day);
            switch (true) {
                case month>=1: time+=month+"个月";
                case day>=1: time+=day+"天";break;
                default: break;
            }
            return time;
            // switch (true) {
            // case year==0: return month+"个月"+day+"天"+hour+"小时"+minute+"分钟"+second+"秒"; break;
            // case year==0&&month==0: return day+"天"+hour+"小时"+minute+"分钟"+second+"秒"; break;
            // case year==0&&month==0&&day==0: return hour+"小时"+minute+"分钟"+second+"秒"; break;
            // case year==0&&month==0&&day==0&&hour==0: return minute+"分钟"+second+"秒"; break;
            // case year==0&&month==0&&day==0&&hour==0&&minute==0: return second+"秒"; break;
            // default :return year+"年"+month+"个月"+day+"天"+hour+"小时"+minute+"分钟"+second+"秒";
            // }
            // console.log(year,month,day,hour,minute,second);
        }

        //将value中的字符串拆分成两个时间然后转换成时间戳
        function splitAndchange(str,cha,num){
            var x=str.indexOf(cha);
            for(var i=0;i<num;i++){
                x=str.indexOf(cha,x+1);
            }
            return [Date.parse(new Date(str.substring(0,x))),Date.parse(str.substring(x+2,str.length))];
        }

        table.render({
            elem: '#test'
            , id: 'testReload'//此ID用于绑定搜索后表单重载
            , url: 'user_LeaveHistory'
            , toolbar: '#toolbarDemo'
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'id', fixed: 'left', sort: true}
                // , {field: 'userid', title: '用户id'}
                , {field: 'username', title: '用户名'}
                , {field: 'departmentid', title: '部门'}
                , {field: 'type', title: '请假类型'}
                , {field: 'reason', title: '请假原因'}
                , {field: 'starttime', title: '开始时间'}
                , {field: 'endtime', title: '结束时间'}
                , {field: 'totaltime', title: '时间差'}
                , {field: 'state', title: '一级审核', templet: '#state', sort: true}
                // , {field: 'isApply', title: '二级审核', templet: '#isApply', sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo'}
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
        //工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'addholiday':
                    openAddWindow();//开启添加数据的表单
                    break;
            }
            ;
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            userid = obj.data.userid;
            if (layEvent == 'edit') {
                if (obj.data.isApply == 1) {
                    layer.msg("由于您的申请已处理，不可操作");
                } else {
                    openUpdateWindow(data);//开启添加数据的表单
                }
            }
        });
        var url;
        var indexs;

        //添加菜单信息
        function openAddWindow() {
            indexs = layer.open({
                type: 1,//弹出层的类型
                title: '添加菜单信息',
                area: ['600px', '600px'],
                content: $("#add-form"),//引用的窗口代码
                success: function () {
                    //清空表单数据
                    $("#add-form")[0].reset();
                    url = "user_insertLeave";
                }
            });
        }

        //打开修改菜单信息
        function openUpdateWindow(data) {
            indexs = layer.open({
                type: 1,//弹出层的类型
                title: '修改菜单信息',
                area: ['600px', '600px'],
                content: $("#add-form"),//引用的窗口代码
                success: function () {
                    form.val("first1", data);
                    url = "user_updateTable";
                }
            });
        }

        //save按钮监听事件
        form.on("submit(save)", function (data) {
            console.log(JSON.stringify(data.field));
            $.ajax({
                url: url,
                data: JSON.stringify(data.field),
                type: 'post',
                dataType: 'json',
                contentType: "application/json;charset=UTF-8",
                success: function (res) {
                    if (res.code == 200) {
                        layer.alert('success', {icon: 1});
                        table.reload('testReload');
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
    });


</script>
</body>
</html>
