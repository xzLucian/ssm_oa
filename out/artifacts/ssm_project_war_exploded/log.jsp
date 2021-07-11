<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>开发者日志</title>
    <style>
        .clear {
            clear: both
        }

        .timeline-box {
            background: #fff;
            padding: 20px 8px;
            position: relative;
            opacity: 0.7;
        }

        .timeline-main {
            position: relative;
        }

        .timeline-main > h1 {
            font-size: 18px;
            background: #fff;
            z-index: 1;
            position: relative;
            color: #484348;
            margin-left: 33%;
            margin-left: -moz-calc(35% - 7px);
            margin-left: -webkit-calc(35% - 7px);
            margin-left: calc(35% - 7px)
        }

        .timeline-main > h1 > i {
            padding-right: 10px;
            font-size: 20px
        }

        .timeline-main > h1 > span {
            display: none
        }

        .timeline-main h2,
        .timeline-main h3 {
            width: 31%;
            text-align: right
        }

        .timeline-main h2,
        .timeline-main h2 > a {
            font-size: 16px;
            margin: 5px 0;
            color: #6bc30d
        }

        .timeline-main h3,
        .timeline-main h3 > a {
            font-size: 14px;
            margin: 2px 0;
            color: #ff5722
        }

        .timeline-month > ul > li {
            padding: 10px 0
        }

        .timeline-month > ul > li .h4 {
            display: inline-block;
            width: 31%;
            text-align: right;
            float: left
        }

        .date {
            display: inline-block;
            padding: 2px 5px;
            color: #484348;
            font-size: 15px;
            margin-top: 5px
        }

        .dot-circle {
            color: #484348;
            width: 8%;
            text-align: center;
            font-size: 22px;
            z-index: 1;
            position: relative;
            background: #fff;
            float: left
        }

        .content {
            max-width: 50%;
            float: left;
            padding: 20px;
            margin-left: 10px;
            position: relative;
            z-index: 1;
            background: #484348;
            color: #fff
        }

        .content img {
            width: 100%
        }

        .content::before {
            position: absolute;
            left: -20px;
            top: 6px;
            height: 0;
            width: 0;
            content: '';
            border: 10px solid rgba(255, 255, 255, 0);
            border-top: 6px solid rgba(255, 255, 255, 0);
            border-bottom: 6px solid rgba(255, 255, 255, 0);
            border-right-color: #484348
        }

        .timeline-line {
            position: absolute;
            left: 35%;
            top: 0;
            height: 100%;
            width: 2px;
            background: #484348;
            z-index: 0
        }

        .timeline-year {
            margin: 10px 0
        }

        @media (min-width: 768px) {
            .timeline-box {
                background: #fff;
                padding: 40px 15px;
                position: relative;
            }

            .timeline-main > h1 {
                font-size: 26px;
                margin-left: 16%;
                margin-left: -moz-calc(18% - 13px);
                margin-left: -webkit-calc(18% - 13px);
                margin-left: calc(18% - 13px)
            }

            .timeline-main > h1 > i {
                font-size: 30px
            }

            .timeline-main > h1 > span {
                display: inline
            }

            .timeline-main h2,
            .timeline-main h3 {
                width: 16%
            }

            .timeline-main h2,
            .timeline-main h2 > a {
                font-size: 24px
            }

            .timeline-main h3,
            .timeline-main h3 > a {
                font-size: 20px
            }

            .timeline-month > ul > li .h4 {
                width: 16%
            }

            .dot-circle {
                width: 4%;
                font-size: 22px
            }

            .content {
                max-width: 70%
            }

            .timeline-line {
                left: 18%
            }
        }

        @media (min-width: 992px) {
            .timeline-main > h1 {
                font-size: 34px;
                background: #fff;
                z-index: 1;
                position: relative;
                color: #484348;
                margin-left: 17%;
                margin-left: -moz-calc(18% - 16px);
                margin-left: -webkit-calc(18% - 16px);
                margin-left: calc(18% - 16px)
            }

            .timeline-main > h1 > i {
                font-size: 36px
            }

            .timeline-main h2,
            .timeline-main h2 > a {
                font-size: 30px
            }

            .timeline-main h3,
            .timeline-main h3 > a {
                font-size: 24px
            }
        }
    </style>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body>
<div class="timeline-box shadow">
    <div class="timeline-main">
        <h1><i class="fa fa-clock-o"></i>OA</h1>
        <div class="timeline-line"></div>
        <div class="timeline-year">
            <h2><a class="yearToggle">2021 年</a><i class="fa fa-caret-down fa-fw"></i></h2>
            <div class="timeline-month">
                <ul>
                    <li>
                        <div class="h4 animated fadeInLeft">
                            <p class="date">6月1日</p>
                        </div>
                        <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                        <div class="content animated fadeInRight">
                            完成SSM后台环境的搭建，加入Layui框架。<i class="layui-icon"></i></div>
                        <div class="clear"></div>
                    </li>
                    <li>
                        <div class="h4 animated fadeInLeft">
                            <p class="date">06月15日</p>
                        </div>
                        <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                        <div class="content animated fadeInRight">
                            完成数据表格的增删查改，并实现角色授权功能。<strong><em>（V1.0）</em></strong><i class="layui-icon layui-icon-fonts-code" style="font-size: 30px; color: #1E9FFF;"></i>
                        </div>
                        <div class="clear"></div>
                    </li>
                    <li>
                        <div class="h4 animated fadeInLeft">
                            <p class="date">06月17日</p>
                        </div>
                        <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                        <div class="content animated fadeInRight">
                            加入登录功能，部门管理，请假管理，会议室管理等功能。<strong><em>（V2.0）</em></strong><i class="layui-icon layui-icon-chart-screen" style="font-size: 30px; color: #1E9FFF;"></i>
                        </div>
                        <div class="clear"></div>
                    </li>
                    <li>
                        <div class="h4 animated fadeInLeft">
                            <p class="date">06月18日</p>
                        </div>
                        <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>
                        <div class="content animated fadeInRight">layui-icon-upload-circle
                            1、实现头像上传功能以及修改头像功能。
                            <br>2、处理请假申请和批准，会议室申请和批准流程逻辑。<strong><em>（V3.0）</em></strong><i class="layui-icon layui-icon-upload-circle" style="font-size: 30px; color: #1E9FFF;"></i>
                        </div>
                        <div class="clear"></div>
                    </li>
                    <li>
                        <div class="h4 animated fadeInLeft">
                            <p class="date">06月19日</p>
                        </div>
<%--                        <p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>--%>
                        <div class="content animated fadeInRight">
                            优化请假管理和会议室管理细节逻辑
                            <br>整体修改页面布局。<strong><em>（V4.0）</em></strong><i class="layui-icon layui-icon-layouts" style="font-size: 30px; color: #1E9FFF;"></i>
                        </div>
                        <div class="clear"></div>
                    </li>
                    <li>
                        <div class="h4 animated fadeInLeft">
                            <p class="date">06月20日</p>
                        </div>
                        <%--<p class="dot-circle animated "><i class="fa fa-dot-circle-o"></i></p>--%>
                        <div class="content animated fadeInRight">
                            主页面设计<strong><em>（V4.1）</em></strong><i class="layui-icon layui-icon-layouts" style="font-size: 30px; color: #1E9FFF;"></i>
                        </div>
                        <div class="clear"></div>
                    </li>
                </ul>
            </div>
        </div>
        <h1 style="padding-top:4px;padding-bottom:2px;margin-top:40px;"><i class="fa fa-hourglass-end"></i>THE END</h1>
    </div>
</div>

</body>
</html>
