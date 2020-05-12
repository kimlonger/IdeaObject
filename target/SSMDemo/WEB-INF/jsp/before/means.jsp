<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
    <link rel="icon" href="favicon.png" type="image/png"/>
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
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">高端课程 <img src="${pageContext.request.contextPath}/img/nav_down.png.png" alt="" draggable="false"><span class="caret"></span></a>
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

<div id="app">
    <!--面包屑导航-->
    <div class="container mian-nav">资料下载</div>
    <div class="classify">
        <div class="container">
            <!--章-->
                <div class="section">
                    <ul>
                        <!--节-->
                        <c:forEach items="${datasList}" var="datasList" varStatus="i">
                            <li class="section-main" >
                                <div class="thum" style="background-image: url('${datasList.img_url}')">
                                    <!--http://vod.chengjian100.com/gkk/h5/c1/image/course/01.jpg-->
                                </div>
                                <p>
                                    <c:if test="${(i.index+1)>=10}">
                                        ${i.index+1}
                                    </c:if>
                                    <c:if test="${(i.index+1)<10}">
                                        0${i.index+1}
                                    </c:if> ${datasList.title}</p>
                                <div class="classify-v-info">
                                    <span class="count" title="观看次数"><img
                                            src="${pageContext.request.contextPath}/img/count.png"
                                            alt="">${datasList.dlnum}</span>
                                    <span class="duration" title="作者"><img
                                            src="${pageContext.request.contextPath}/img/player.png" alt="">${datasList.author}</span>
                                    <span> <a href="${datasList.data_url}" download="${datasList.title}">下载</a></span>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
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
            <form id="regForm" action="/user/insertUser">
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
</body>
</html>