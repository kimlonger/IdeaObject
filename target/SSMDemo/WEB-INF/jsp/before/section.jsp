<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="favicon.png" type="image/png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link href="${pageContext.request.contextPath}/css/video-js.css" rel="stylesheet" type="text/css">
    <title>在线公开课-Y先生教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/gVerify.js"></script>
    <script type="text/javascript">
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
    <script>
        function addFavorite3() {
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
    </script>
</head>
<body class="w100">
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<header>
    <div class="container">
        <span>欢迎来到Y先生教育！</span>
        <div id="regBlock" style="display:none;float:right">
            <a href="javascript:;" id="reg_open"><img src="${pageContext.request.contextPath}/img/we.png">注册</a>
            <a href="javascript:;" id="login_open"><img src="${pageContext.request.contextPath}/img/we.png">登录</a>
        </div>
        <div id="userBlock" style="display:none;float:right">
            <a href="javascript:;" id="loginout">退出</a>
            <a href="${pageContext.request.contextPath}/user/showMyProfile" id="account">${sessionScope.userAccount}</a>
        </div>
        <a onclick="JavaScript:addFavorite3()"><img src="${pageContext.request.contextPath}/img/sc.png"
                                                    draggable="false">加入收藏</a>
        <a onclick="pyRegisterCvt()" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1550579289&site=qq&menu=yes"><img
                src="${pageContext.request.contextPath}/img/we.png" draggable="false">联系我们</a>
        <a class="color_e4"><img src="${pageContext.request.contextPath}/img/phone.png" draggable="false"> 0375-208-9092&#x3000;&#x3000;0375-208-9051</a>

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
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">高端课程 <img src="" alt="" draggable="false"><span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <c:forEach items="${subjectList}" var="subject">
                        <li>
                            <a target="_blank"
                               href="${pageContext.request.contextPath}/course/course/${subject.id}">${subject.subject_name}</a>
                        </li>
                    </c:forEach>
                </ul>
            <li id="gkk" class="nav_choose">
                <a href="${pageContext.request.contextPath}/course/course/1 "draggable="false">在线公开课</a>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资料下载 <img src="${pageContext.request.contextPath}/img/nav_down.png.png" alt="" draggable="false"><span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <c:forEach items="${datatypeList}" var="datatype">
                        <li>
                            <a target="_blank"
                               href="${pageContext.request.contextPath}/means/means/${datatype.id}">${datatype.typename}</a>
                        </li>
                    </c:forEach>
                </ul>
            </li>
            <li id="talk" class="nav_choose">
                <a href="${pageContext.request.contextPath}/user/showarticle "draggable="false">社区互助</a>
            </li>
            <li id="aboutme" class="nav_choose">
                <a href="${pageContext.request.contextPath}/means/aboutme "draggable="false">关于我们</a>
            </li>
        </ul>
    </div>
</nav>

<div id="detail"></div>

<div>
    <!--面包屑导航-->
    <div class="container mian-nav">公开课/${subject_name}</div>

    <div class="intro">
        <div class="container">
            <div class="v-intro">
                <div class="left">
                    <video id="videoPlayer" src="${video.video_url}" class="video-js vjs-default-skin" controls
                           width="627" height="280"
                           poster="${video.image_url}" data-setup="{}">
                    </video>
                </div>
                <div class="right">
                    <p class="right-title">${video.title}</p>
                    <div class="avatar">
                        <span style="background-image: url(${video.speaker.head_img_url})"></span>
                        <p><b>讲师：${video.speaker.speaker_name}</b><br><i>${video.speaker.speaker_desc}</i></p>
                    </div>
                    <p class="video-intro">
                        <span>本节内容：</span> ${video.detail}
                    </p>
                </div>
            </div>

            <div class="kcjs">
                <p class="title">课程介绍</p>
                <p class="content">${course.course_desc}</p>
            </div>

        </div>
    </div>
    <!--目录-->
    <div class="catalog">
        <div class="container">
            <p class="title">目录</p>

            <c:forEach items="${course.videoList}" var="video">
                <div class="chapter" onclick="load(${video.id})">
                    <p class="biaoti"><a
                            href="${pageContext.request.contextPath}/video/showVideo?videoId=${video.id}">${video.title}</a></p>
                    <p class="lecturer">${video.detail}</p>
                    <p class="lecturer">讲师：${video.speaker.speaker_name}</p>
                    <div class="v-info">
                        <span class="count"><img src="${pageContext.request.contextPath}/img/count.png"
                                                 alt="">${video.play_num}</span>
                        <span class="duration"><img src="${pageContext.request.contextPath}/img/player.png"
                                                    alt="">${video.time}</span>
                    </div>
                </div>
            </c:forEach>


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
                <li>e-mail:16639424152@163.com</li>
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

<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/video.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<%-- 
    <script src="${pageContext.request.contextPath}/js/vue.js"></script>
    <script src="${pageContext.request.contextPath}/js/axios.js"></script>
    <script src="${pageContext.request.contextPath}/js/vueSection.js"></script> --%>
<script type="text/javascript">
    $("#loginout2").click(function () {
        location.href = "${pageContext.request.contextPath}/user/loginOut2"

        <%--$.get("${pageContext.request.contextPath}/userDaos/loginOut", null, function () {--%>
        <%--    /* $("#regBlock").css("display","block");--%>
        <%--    $("#userBlock").css("display","none"); */--%>
        <%--    location.href = "index.jsp";--%>
        <%--});--%>

    });
</script>
</body>

</html>
