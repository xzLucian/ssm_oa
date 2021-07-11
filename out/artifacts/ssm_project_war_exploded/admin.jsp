<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 管理界面大布局示例 - Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" ; content="multipart/form-data; charset=utf-8"/>

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/weathericon.css">
    <link rel="stylesheet" href="css/iconfont.css">
    <style type="text/css">
        .node_wrap {
            overflow: hidden;
            overflow-y: scroll;
            transition: 0.3s;
            background-color: #535c68;
            width: 500px;
            margin-left: 10px;
            margin-right: 10px;
            border-radius: 25px;
        }

        .node_wrap .item {
            padding: 0 20px 5px 20px;
            margin: 10px 0;
            border-bottom: 1px solid #130f40;

        }

        /*隐藏内容块的滑动条*/
        .node_wrap::-webkit-scrollbar {
            display: none;
        }

        /*控制内容块隐藏 隐藏时，整块向左边平移200%的宽度，并且将最大高度设置为0，否则页面会留有空白*/
        .node_wrap_hide {
            transform: translate(0, 0);
            max-height: 0;
        }

        /*控制内容块显示，显示时，整块向右边复原，并且将最大高度设置为300px，里面的内容即会将块撑开*/
        .node_wrap_show {
            transform: translate(0, -210%);
            max-height: 180px;
        }

        .index{
            padding: 5px;
            color: #fff;
            background-color: #130f40;
            border-radius: 25px;
        }
        .suggest{
            padding: 5px;
            margin-top: -5px;
            float: right;
            background-color: #30336b;
            border-radius: 25px;
        }
        .txt{
            margin-top: 5px;
        }
    </style>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body class="layui-layout-body">

<%--修改个人信息的表单start--%>
<form class="layui-form layui-form-panel" id="updateform" name="updateform" style="display: none;" method="post"
      lay-filter="first1">
    <%--隐藏域用来保存当前id--%>
    <input type="hidden" name="userid">
    <div class="layui-form-item" style="display: none;">
        <label class="layui-form-label">用户ID</label>
        <div class="layui-input-inline">
            <input type="text" name="userid" id="userid" lay-verify="required" required value="${user.userid}"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" id="username" lay-verify="required|username" required
                   value="${user.username}"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="text" name="userpass" id="userpass" lay-verify="required" required value="${user.userpass}"
                       autocomplete="off" class="layui-input" disabled="disabled">
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
            <input type="text" name="birthday" id="birthday" readonly="readonly" lay-verify="required"
                   placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" value="${user.birthday}">
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
                   value="${user.telephone}"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-inline">
            <input type="text" name="address" id="address" lay-verify="required" required value="${user.address}"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" name="email" id="email" lay-verify="required|email" required value="${user.email}"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">入职时间</label>
        <div class="layui-input-inline">
            <input type="text" name="entertime" id="entertime" readonly="readonly" lay-verify="required"
                   placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input" value="${user.entertime}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">工资</label>
        <div class="layui-input-inline">
            <input type="text" name="salary" id="salary" readonly="true" style="background:#CCCCCC"
                   lay-verify="required" value="${user.salary}" lay-verType="tips"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-inline">
            <select name="state" id="state" lay-verify="required" lay-filter="interest-search" lay-search
                    disabled="disabled">
                <%--             <option value=""></option>--%>
                <c:if test="${user.state == 1}">
                    <option value="1">启用</option>
                </c:if>
                <c:if test="${user.state == 0}">
                    <option value="0">禁用</option>
                </c:if>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="save" type="button">确认</button>
        </div>
    </div>
</form>
<%--修改个人信息的表单end--%>

<%--修改头像表单--%>
<form class="layui-form layui-form-panel" id="uploadform" name="uploadform" enctype="multipart/form-data" method="post"
      style="display: none;" lay-filter="first2">
    <div class="layui-form-item">
        <label class="layui-form-label">头像封面</label>
        <div class="layui-upload-drag" id="demo1">
            <i class="layui-icon"></i>
            <p>点击上传，或将文件拖拽到此处</p>
            <hr>
            <img class="layui-upload-img" id="demo2" style="max-width: 100px">
        </div>
    </div>
    <!--lay-submit lay-filter="submitBut"必须要有-->
    <div class="layui-form-item">
        <div class="layui-input-block">
            <!--  提交按钮 -->
            <button class="layui-btn" lay-submit lay-filter="submitBut" type="button">立即提交</button>
        </div>
    </div>
</form>
<%--修改头像表单end--%>

<%--修改密码表单start--%>
<%--修改头像表单--%>
<form class="layui-form layui-form-panel" id="updatepassword" name="updatepassword" method="post" style="display: none;" lay-filter="first3">
    <span></span>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input type="password" name="newpass" id="newpass" lay-verify="required|pass" required autocomplete="off"
                   class="layui-input" onkeyup="validate()">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-inline">
            <input type="password" name="confirmpass" id="confirmpass" lay-verify="required|pass" required
                   autocomplete="off" class="layui-input" onkeyup="validate()">
            <span class="tips" id="tips"></span>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="confirm" type="button">确认</button>
        </div>
    </div>
</form>
<%--修改密码表单end--%>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">OA System</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <!-- 头像图片 -->
                    <img src="${user.imageurl}" class="layui-nav-img" id="icon" name="icon">
                    ${user.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" id="personal">个人信息</a></dd>
                    <dd><a href="javascript:;" id="uploadImage">修改头像</a></dd>
                    <dd><a href="javascript:;" id="updatePass">修改密码</a></dd>
                    <dd><a href="<%=path%>/user_logout;">退了</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <%--<a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                      <dd><a href="javascript:;">列表一</a></dd>
                      <dd><a href="javascript:;">列表二</a></dd>
                      <dd><a href="javascript:;">列表三</a></dd>
                      <dd><a href="">超链接</a></dd>
                    </dl>--%>
                </li>
                <li class="layui-nav-item">
                    <%-- <a href="javascript:;">解决方案</a>
                     <dl class="layui-nav-child">
                       <dd><a href="javascript:;">列表一</a></dd>
                       <dd><a href="javascript:;">列表二</a></dd>
                       <dd><a href="">超链接</a></dd>
                     </dl>--%>
                </li>
                <%-- <li class="layui-nav-item"><a href="">云市场</a></li>
                 <li class="layui-nav-item"><a href="">发布商品</a></li>--%>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab layui-tab-card" lay-filter="tests" lay-allowclose="true" style="margin: 0px;">
            <ul class="layui-tab-title">
                <li class="layui-this">首页</li>
            </ul>
            <div class="layui-tab-content" style="height: 100%;padding: 0px;">
                <div class="layui-tab-item layui-show">
                    <div class="container">
                        <div class="weather-side"></div>
                        <div class="info-side">
                            <div class="today-info-container"></div>
                            <div class="week-container">
                                <ul class="week-list"></ul>
                            </div>
                            <div class="location-container">
                                <button class="location-button" id="location-button"><span>生活指数</span></button>
                            </div>
                            <div id="list_wrap" class="node_wrap node_wrap_show">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--内容主体区域--%>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="layui/layui.js" charset="utf-8"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script src="js/weather.js"></script>
<script type="text/javascript">
    // 获取标题元素
    var block_wrap = document.getElementById('location-button');

    //给标题元素添加点击事件，通过点击控制class的添加&去除达成动画效果
    block_wrap.onclick = function () {
        // 获取标题元素className集合
        let classArray = this.className.split(/\s+/)

        // 获取内容块元素
        let list_wrap = document.getElementById('list_wrap')

        // 判断标题元素是否有类active，如若存在，则说明列表展开，这时点击则是隐藏内容块，否则显示内容块
        if (classArray.includes('active')) {
            // 隐藏内容块
            block_wrap.classList.remove('active')
            list_wrap.classList.remove('node_wrap_show')
            list_wrap.classList.add('node_wrap_hide')
            console.log(this.className.split(/\s+/))
            return
        } else {
            // 显示内容块
            block_wrap.classList.add('active')
            list_wrap.classList.add('node_wrap_show')
            list_wrap.classList.remove('node_wrap_hide')
            return
        }
    }
</script>
<%--<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>--%>
<script>
    //验证两次输入的密码是否一致
    function validate() {
        var password = document.getElementById("newpass").value;
        var repassword = document.getElementById("confirmpass").value;
        if (password != repassword) {
            document.getElementById("tips").innerHTML = "<br><font color='red'>两次输入的密码不一致</font>";
            return false;
        } else {
            // document.getElementById("tips").innerHTML = "<br><font color='green'>两次密码输入一致!</font>";
            document.getElementById("tips").innerHTML = "";
            return true;
        }
    }

    /*动态加载选项卡*/
    layui.use(['element', 'layer', 'laydate', 'form', 'upload','jquery'], function () {
        var element = layui.element;
        var laydate = layui.laydate;
        var form = layui.form;
        var upload = layui.upload;
        var $ = layui.jquery;
        //渲染表单组件
        form.render();
        layer.msg("欢迎回来,${user.username}！", {icon: 6, time: 1000, shift: 5})
        //渲染日期组件
        laydate.render({
            elem: "#entertime",
            type: "date"
        })
        //自定义表单验证规则
        form.verify({
            username: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                    return '用户名不能有特殊字符';
                }
                if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if (/^\d+\d+\d$/.test(value)) {
                    return '用户名不能全为数字';
                }
            }
            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            // , pass: [/^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格']
        });
        var update;
        //修改用户密码
        $('#updatePass').on('click', function () {
            update = layer.open({
                type: 1,
                area: ['400px', '300px'],
                shadeClose: true, //点击遮罩关闭
                content: $("#updatepassword"),
                success: function () {

                }
            });
        });
        form.on("submit(confirm)", function (data) {
            $.ajax({
                url: 'user_updatePass',
                data: {//参数对应后台接受的参数名称，把图片地址传给后台
                    'userid': ${user.userid},
                    'newPass': $("#newpass").val()
                },
                type: 'post',
                dataType: 'json',
                success: function (res) {
                    if (res.code == 200) {
                        //ajax执行成功后提示添加成功
                        layer.msg('修改密码成功！');
                        layer.close(update);
                    } else {
                        layer.msg('修改密码失败！');
                    }
                }
            })
            return false;
        })

        $.ajax({
            url: 'menu_selectMenu',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var menu = ""; //定义变量存储
                for (var i = 0; i < data.length; i++) {
                    menu += "<li class='layui-nav-item '>"
                    if (data[i].pid == 'root') { //取出父元素的菜单，拼进页面
                        menu += "<a href='javascript:;'>" + data[i].title + "</a>"
                        for (var j = 0; j < data.length; j++) { //继续遍历这几条数据
                            if (data[j].pid == data[i].menuid) { //取出这个父元素所对应的子元素
                                menu += "<dl class='layui-nav-child'>"
                                menu += "<dd>"
                                menu += "<a name=" + data[j].url + " id='menuids'  target='option'>" + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + data[j].title + "</a>"
                                menu += "</dd>"
                                menu += "</dl>"
                            }
                        }
                    }
                    menu += "</li>";
                }
                $(".layui-nav-tree").html(menu);
                var element = layui.element;
                element.init()//初始化element事件，使菜单展开
                //监听导航点击
                element.on('nav(test)', function (elem) {
                    //console.log(elem)
                    //layer.alert(elem.text());
                });
            }
        });
        //添加选项卡
        $(document).on("click", "#menuids", function () {
            // alert($(this).attr("name"));
            // if (layui.jquery(".layui-tab-title li[lay-id='" + $(this).text() + "']").length > 0) {
            //选项卡已经存在
            layui.element.tabDelete('tests', $(this).text())
            // layui.element.tabChange('tests', $(this).text());
            //layer.msg('切换-' +$(this).text());
            // } else {
            //动态控制iframe高度
            var tabheight = layui.jquery(window).height() - 30;
            contentTxt = '<iframe frameborder="0" src="' + $(this).attr("name") + '" scrolling="no" width="100%" height="' + (tabheight) + 'PX"></iframe>';
            //新增一个Tab项
            layui.element.tabAdd('tests', {
                title: $(this).text(),
                content: contentTxt,
                id: $(this).text()
            });
            //切换刷新
            // layui.element.tabDelete('tests', $(this).text())
            layui.element.tabChange('tests', $(this).text())
            //layer.msg('新增-' + $(this).text())
            // }
        });
        var open;
        //修改个人信息监听start
        $('#personal').on('click', function () {
            open = layer.open({
                type: 1,
                area: ['800px', '500px'],
                shadeClose: true, //点击遮罩关闭
                content: $("#updateform"),
                success: function () {

                }
            });
        });

        //  监听表单提交事件
        form.on("submit(save)", function (data) {
            $.ajax({
                url: 'update_user',
                data: JSON.stringify(data.field),
                type: 'post',
                dataType: 'json',
                contentType: "application/json",
                success: function (res) {
                    if (res.code == 200) {
                        layer.msg('修改个人信息成功！');
                        layer.close(open);
                    } else {
                        layer.msg('修改个人信息失败！');
                    }
                },
                error: function () {
                    console.log("无返回值");
                }
            })
        })
        var pic;
        //修改头像监听start
        $('#uploadImage').on('click', function () {
            pic = layer.open({
                type: 1,
                area: ['500px', '360px'],
                shadeClose: true, //点击遮罩关闭
                content: $("#uploadform"),
                success: function () {

                }
            });
        });
        <%--上传头像--%>
        var sqlimgurl = '';
        upload.render({
            elem: '#demo1',
            url: 'user_uploadImg',//这里填写你的上传地址
            accept: 'images',
            method: 'post',
            filed: 'headpic',
            acceptMime: 'image/*'
            , before: function (obj) {
                /*如果您不想用上面的URL 进行上传,也可以在这里,添加你的上传方式*/
                obj.preview(function (index, file, result) {
                    $('#demo2').attr('src', result);//图片链接（base64）
                });
            }, done: function (res) {
                if (res.code == 0) {//长传成功
                    layer.msg('上传成功');
                    console.log(res.data.src);
                    sqlimgurl = res.data.src;
                    $("#icon").attr('src', sqlimgurl);

                    <%--$("#demo1").prop("src","${pageContext.request.contextPath}/");--%>
                    <%--$("#headpic").val(res.data.src);--%>
                } else {
                    layer.msg('图片上传失败!');
                }
            }
            , error: function () {
                console.log("error");
            }
        });

        form.on("submit(submitBut)", function (data) {
            $.ajax({
                url: 'user_updateImg',
                data: {//参数对应后台接受的参数名称，把图片地址传给后台
                    'imageurl': $("#icon").attr('src'),
                    'userid': ${user.userid},
                },
                type: 'post',
                // dataType:'json',
                // contentType: "application/json",
                //执行成功执行的方法
                success: function (res) {
                    if (res.code == 0) {
                        //ajax执行成功后提示添加成功
                        layer.msg('添加图片成功');
                        layer.close(pic);
                    } else {
                        layer.msg('添加图片失败');
                    }
                }
            })
            return false;
        })
    });


</script>
<%--选项卡事项--%>
</body>
</html>
