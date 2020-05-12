<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="icon" href="favicon.png" type="image/png"/>
    <title>在线公开课-Y先生教育|java|大数据|HTML5|python|UI|PHP视频教程</title>

    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>

    <script>
        function addFavorite2() {
            var url = window.location;
            var title = document.title;
            var ua = navigator.userAgent.toLowerCase();
            if (ua.indexOf("360se") > -1) {
                alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
            } else if (ua.indexOf("msie 8") > -1) {
                window.external.AddToFavoritesBar(url, title); //IE8
            } else if (document.all) {
                try {
                    window.external.addFavorite(url, title);
                } catch (e) {
                    alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
                }
            } else if (window.sidebar) {
                window.sidebar.addPanel(title, url, "");
            } else {
                alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
            }
        }

        $(function () {


            //div 两个哪个显示呢？
            if (null != "${sessionScope.userAccount}" && "${sessionScope.userAccount}" != "") {
                $("#regBlock").css("display", "none");
                $("#userBlock").css("display", "block");
            } else {
                $("#regBlock").css("display", "block");
                $("#userBlock").css("display", "none");
            }
        });
    </script>
</head>

<body class="w100">
<header>
    <div class="container">
        <span>欢迎来到Y先生教育！</span>
        <!-- 此处这个标志用于修复一个小Bug -->
        <input type="hidden" id="isLogin" value="0">
        <div id="regBlock" style="display:none;float:right">
            <a href="javascript:;" id="reg_open"><img src="${pageContext.request.contextPath}/img/we.png">注册</a>
            <a href="javascript:;" id="login_open"><img src="${pageContext.request.contextPath}/img/we.png">登录</a>
        </div>

        <div id="userBlock" style="display:none;float:right">

            <a href="javascript:;" id="loginout">退出</a>
            <a href="${pageContext.request.contextPath}/user/showMyProfile" id="account">${sessionScope.userAccount}</a>
        </div>

        <a onclick="JavaScript:addFavorite2()"><img src="${pageContext.request.contextPath}/img/sc.png"
                                                    draggable="false">加入收藏</a>
        <a onclick="pyRegisterCvt()" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1550579289&site=qq&menu=yes"><img
                src="${pageContext.request.contextPath}/img/we.png" draggable="false">联系我们</a>
        <a class="color_e4"><img src="${pageContext.request.contextPath}/img/phone.png" draggable="false"> 0375-2089092&#x3000;&#x3000;0375-208-9051</a>
    </div>
</header>
<nav class="w100">
    <div class="container">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Y先生教育的logo"
             onclick="location.href='${pageContext.request.contextPath}/user/index'" draggable="false">
        <ul class="text_13 f_right">
            <li>
                <a onclick="location.href='${pageContext.request.contextPath}/user/index'" draggable="false">首页</a>
            </li>
            <li>
                <a onclick="location.href='${pageContext.request.contextPath}/user/showarticle'" draggable="false">查看帖子</a>
            </li>
            <li>
                <a onclick="location.href='${pageContext.request.contextPath}/user/article'" draggable="false">发帖求助</a>
            </li>
        </ul>
    </div>
</nav>
<div id="app">
    <!--面包屑导航-->
    <div class="container mian-nav">发帖求助</div>
    <div class="classify">
        <div class="container">
            <!--章-->
            <form id="regForm2" action="${pageContext.request.contextPath}/user/addTopic">
                发帖者:<input type="email" name="topic_user" value="${sessionScope.userAccount}" readonly="readonly"/><br>
                标题&nbsp：<input type="text" name="title"/><br>
                内容：<br><textarea rows="5" cols="30" name="content"></textarea><br><br>
                <label for="meeting">时间</label><input id="meeting" type="date" value="" name="topic_time" />
                <input type="submit"  value="发表">
                <input type="reset" value=" 重置"/>
            </form>
        </div>
    </div>
</div>
<!--页脚-->
<footer>
    <ul>
        <li>
            <img src="${pageContext.request.contextPath}/img/footer_logo.png" alt="" draggable="false">
        </li>
        <li class="mt25">
            <h3>校区地址</h3>
            <ul>
                <li>地址<br>河南省洛阳市伊滨区洛阳师范学院</li>
            </ul>
        </li>
        <li class="mt25">
            <h3>联系我们</h3>
            <ul id="foo_icon">
                <li>河南省洛阳市伊滨区洛阳师范学院枣园宿舍</li>
                <li>e-mail:zy@chengjian100.com</li>
                <li>电话:0375-208-9092 0375-208-9051</li>
                <li class="erwei">
                    <br>
                    <div>
                        <img class="weixin" src="${pageContext.request.contextPath}/img/微信公众号.png" alt=""
                             draggable="false">
                        <img class="weibo" src="${pageContext.request.contextPath}/img/微博公众号.png" alt=""
                             draggable="false">
                    </div>
                </li>
            </ul>
        </li>
    </ul>
    <div class="record">Y先生教育 &copy; 豫ICP备13012610号;洛阳师范学院</div>
</footer>
<!--登录注册弹出框-->
<div class="mask hidden" id="login">
    <div class="mask_content">
        <div class="mask_content_header">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="" class="ma">
        </div>
        <div class="mask_content_body">
            <form id="loginForm" action="#">
                <h3>快速登录</h3>
                <input type="email" id="loginEmail" placeholder="请输入邮箱" name="email">
                <input type="password" id="loginPassword" placeholder="请输入密码" name="password">
                <div id="forget">
                    <a href="${pageContext.request.contextPath}/user/forgetPassword">忘记密码？</a>
                    &#x3000;<a href="#" onclick="quickShow()">快速注册</a>
                </div>

                <input type="submit" onclick="return commitLogin()" value="登&#x3000;录">
            </form>
        </div>
        <div class="mask_content_footer">
            <span id="login_close">关&#x3000;闭</span>
        </div>
    </div>
</div>
<div class="mask hidden" id="reg">
    <div class="mask_content">
        <div class="mask_content_header">
            <img src="${pageContext.request.contextPath}/img/logo.png" alt="" class="ma">
        </div>
        <div class="mask_content_body">
            <form id="regForm" action="${pageContext.request.contextPath}/user/insertUser">
                <h3>新用户注册</h3>
                <input type="email" id="regEmail" placeholder="请输入邮箱" name="email"><span id="emailMsg"></span>
                <input type="password" id="regPsw" placeholder="请输入密码" name="password">
                <input type="password" id="regPswAgain" placeholder="请再次输入密码" name="psw_again"><span
                    id="passMsg"></span>
                <div id="yzm" class="form-inline">
                    <input type="text" name="yzm" style="width: 45%; display: inline-block;">
                    <div id="v_container" style="width: 45%;height: 40px;float:right;"></div>
                </div>
                <input type="submit" onclick="return commitRegForm();" value="注&#x3000;册">
            </form>
        </div>
        <div class="mask_content_footer">
            <span id="reg_close">关&#x3000;闭</span>
        </div>
    </div>
</div>

<!--<script src="${pageContext.request.contextPath}/js/readmore.js"></script>-->
<script src="${pageContext.request.contextPath}/js/gVerify.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<script type="text/javascript">

    function getVideo(videoId,course_id) {
        //alert("${sessionScope.userAccount}");
        //判断用户是否登录
        //alert($("#isLogin").val());
        if ((null != "${sessionScope.userAccount}" && "${sessionScope.userAccount}" != "") || ($("#isLogin").val() == 1)) {
            //如果登录
            location.href = "${pageContext.request.contextPath}/video/showVideo?videoId=" + videoId + "&course_id=" + course_id+ "&subjectName=" + '${subject.subject_name}';
        } else {
            //如果不登录，弹登录框
            $("#login").removeClass("hidden");
        }

    }
</script>
</body>
</html>