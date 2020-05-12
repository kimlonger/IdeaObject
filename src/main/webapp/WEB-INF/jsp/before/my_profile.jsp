<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, userDaos-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="icon" href="${pageContext.request.contextPath}/favicon.png" type="image/png">
    <title>在线公开课-Y先生教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<header>
    <div class="container top_bar clearfix">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="小禅院">
        <div id="tele">
            <span>0375-208-9092</span>
            <span>0375-208-9051</span>
        </div>
    </div>
    <menu>
        <div class="container clearfix">
            <ul class="clearfix f_left">
                <li><a href="${pageContext.request.contextPath}">首页</a></li>
                <!--<li><a href="  {pageContext.request.contextPath}/course/course/1">课程</a></li>-->
                <li class="menu_active"><a onclick="location.href='${pageContext.request.contextPath}/user/showMyProfile'" draggable="false">个人中心</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">轻松一刻 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="http://localhost:8081/uploadfile/game/a/index.html">中国象棋</a></li>
                        <li><a href="http://localhost:8081/uploadfile/game/b/index.html">吃豆人</a></li>
                        <li><a href="http://localhost:8081/uploadfile/game/c/index.html">超级玛丽</a></li>
                        <li><a href="http://localhost:8081/uploadfile/game/d/index.html">水果忍者</a></li>
                    </ul>
                <li class="menu_active"><a onclick="location.href='${pageContext.request.contextPath}/video/showHistory'" draggable="false">历史记录</a></li>

            </ul>
            <div id="user_bar">
                <a onclick="location.href='${pageContext.request.contextPath}/user/showMyProfile'" draggable="false">
                    <c:if test="${empty user.imgUrl}">
                        <img id="avatar" src="${pageContext.request.contextPath}/img/avatar_lg.png" alt="">
                    </c:if>
                    <c:if test="${not empty user.imgUrl}">
                        <img id="avatar" src="http://localhost:8081/uploadfile/images/${user.imgUrl}" alt="">
                    </c:if>
                </a>
                <a href="${pageContext.request.contextPath}/user/loginOut2" id="lay_out">退出</a>
            </div>
        </div>
    </menu>
</header>
<main>
    <div class="container">
        <h2>我的资料</h2>
        <div id="profile_tab">
            <ul class="profile_tab_header f_left clearfix">

                <li><a onclick="location.href='${pageContext.request.contextPath}/user/changeProfile'" draggable="false">更改资料</a></li>
                <li class="profile_tab_line">|</li>

                <li><a onclick="location.href='${pageContext.request.contextPath}/user/changeAvatar'" draggable="false">更改头像</a></li>
                <li class="profile_tab_line">|</li>
                <li><a onclick="location.href='${pageContext.request.contextPath}/user/passwordSafe'" draggable="false">密码安全</a></li>
            </ul>
            <div class="proflle_tab_body">
                <div class="proflle_tab_workplace clearfix">
                    <div class="profile_avatar_area">
                        <c:if test="${empty user.imgUrl}">
                            <img id="avatar" src="${pageContext.request.contextPath}/img/avatar_lg.png" alt="">
                        </c:if>

                        <c:if test="${not empty user.imgUrl}">
                            <img id="avatar" width="180px" heigth="180px" src="http://localhost:8081/uploadfile/images/${user.imgUrl}" alt="">
                        </c:if>
                        <p>
                            <c:if test="${not empty user.nickName}">
                                <span>${user.nickName}</span>
                            </c:if>
                            <c:if test="${empty user.nickName}">
                                <span>${user.email}</span>
                            </c:if>
                            欢迎回来！</p>
                    </div>
                    <ul class="profile_ifo_area">
                        <li><span class="dd">昵&#x3000;称：</span>${user.nickName}</li>
                        <li><span class="dd">性&#x3000;别：</span>
                            <c:if test="${user.sex=='woman'}">
                                女
                            </c:if>
                            <c:if test="${user.sex=='man'}">
                                男
                            </c:if>
                        </li>
                        <li><span class="dd">生&#x3000;日：</span>
                            <time data="1990-06-06">${user.birthday}</time>
                        </li>
                        <li><span class="dd">邮&#x3000;箱：</span>${user.email}</li>
                        <li><span class="dd">所在地：</span>${user.address}</li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</main>
<footer>
    <div class="container">
        <ul>
            <li><img src="${pageContext.request.contextPath}/img/footer_logo.png" alt="" id="foot_logo"></li>
            <li>版权所有：Y先生教育&#x3000;&#x3000;&#x3000;&copy;&nbsp;www.chengjian100.com</li>
            <li><img src="${pageContext.request.contextPath}/img/微信公众号.png" alt="" id="wxgzh"></li>
        </ul>
    </div>
</footer>
</body>
</html>