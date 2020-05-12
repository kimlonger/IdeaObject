<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, userDaos-scalable=no">
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="icon" href="favicon.png" type="image/png">
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <title>在线公开课-Y先生教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
    <script type="text/javascript">

        var regIsCommitOldPass = false;
        var regIsCommitPsw = false;

        $(function () {

            $("#oldPassword").blur(function () {


                var oldPass = $("#oldPassword").val();
                if (null != oldPass && oldPass != "") {

                    var params = {"password": oldPass};
                    // alert(params);
                    $.post("${pageContext.request.contextPath}/user/validatePassword", params, function (data) {
                        if (data == "success") {
                            regIsCommitOldPass = true;
                            $("#oldMsg").text("原密码正确").css("color", "green");
                        } else {
                            regIsCommitOldPass = false;
                            $("#oldMsg").text("原密码错误").css("color", "red");
                        }
                    });
                }
            });

            $("#newPassword02").blur(function () {
                var pass01 = $("#newPassword").val();
                var pass02 = $("#newPassword02").val();
                if (null == pass01 || "" == pass01 || null == pass02 || "" == pass02) {
                    $("#passMsg").text("密码不能为空").css("color", "red");
                    regIsCommitPsw = false;
                } else {
                    if (pass01 != pass02) {
                        regIsCommitPsw = false;
                        $("#passMsg").text("两次密码输入不一致，请重新输入").css("color", "red");
                    } else {
                        regIsCommitPsw = true;
                        $("#passMsg").text("");
                    }
                }

            });

            $("form").submit(function () {
                if (regIsCommitPsw && regIsCommitOldPass) {
                    return true;
                } else {
                    return false;
                }
            });
        });

    </script>
</head>

<body class="w100">
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
                <a href="user/showMyProfile">
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
                <h3><a onclick="location.href='${pageContext.request.contextPath}/user/showMyProfile'" draggable="false">返回个人中心</a></h3>
                <div class="proflle_tab_workplace clearfix">
                    <div class="profile_avatar_area">

                        <c:if test="${empty user.imgUrl}">
                            <img id="avatar" src="${pageContext.request.contextPath}/img/avatar_lg.png" alt="">
                        </c:if>

                        <c:if test="${not empty user.imgUrl}">
                            <img id="avatar" width="180px" height="180px" src="http://localhost:8081/uploadfile/images/${user.imgUrl}" alt="">
                        </c:if>

                    </div>
                    <div class="profile_ifo_area">
                        <form action="${pageContext.request.contextPath}/user/updatePassword">
                            <div class="form_group">
                                <span class="dd">旧&#x3000;密&#x3000;码：</span>
                                <input type="password" id="oldPassword" name="oldPassword"><span id="oldMsg"></span>
                            </div>
                            <div class="form_group">
                                <span class="dd">新&#x3000;密&#x3000;码：</span>
                                <input type="password" id="newPassword" name="password">
                            </div>
                            <div class="form_group">
                                <span class="dd">确认新密码：</span>
                                <input type="password" id="newPassword02" name="newPassword02"><span
                                    id="passMsg"></span>
                            </div>
                            <div class="form_submit dd">
                                <input type="submit" value="保&#x3000;存">
                                <a href="#">取消</a>
                            </div>
                        </form>
                    </div>
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