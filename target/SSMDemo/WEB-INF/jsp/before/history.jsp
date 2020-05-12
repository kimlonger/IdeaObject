<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, userDaos-scalable=no">
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="icon" href="${pageContext.request.contextPath}/favicon.png" type="image/png">
    <title>在线公开课-Y先生教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
</head>

<body>
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
                <li class="menu_active"><a onclick="location.href='${pageContext.request.contextPath}/user/showMyProfile'" draggable="false">轻松一刻</a></li>
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
        <h2>历史记录</h2>
        <div id="profile_tab">
            <div class="proflle_tab_body">
                <div class="proflle_tab_workplace clearfix">
                    <div id="app">
                        <div class="classify">
                            <div class="container">
                                <!--章-->
                                <div class="section">
                                    <ul>
                                        <!--节-->
                                        <c:forEach items="${recordsList}" var="records" varStatus="i">
                                            <li class="section-main" onclick="getVideo(${records.video_id},${records.id})">
                                                <div class="thum" style="background-image: url('${records.video_img}')">
                                                    <!--http://vod.chengjian100.com/gkk/h5/c1/image/course/01.jpg-->
                                                </div>
                                                <p>
                                                    <c:if test="${(i.index+1)>=10}">
                                                        ${i.index+1}
                                                    </c:if>
                                                    <c:if test="${(i.index+1)<10}">
                                                        0${i.index+1}
                                                    </c:if> ${records.video_title}</p>
                                                <div class="classify-v-info">
                                    <span class="count" title="观看次数"><img
                                            src="${pageContext.request.contextPath}/img/count.png"
                                            alt="">${records.video_num}</span>
                                                    <span class="duration" title="时长"><img
                                                            src="${pageContext.request.contextPath}/img/player.png" alt="">${records.video_time}</span>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
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
<script type="text/javascript">

    function getVideo(video_id) {
        //alert("${sessionScope.userAccount}");
        //判断用户是否登录
        //alert($("#isLogin").val());
        if ((null != "${sessionScope.userAccount}" && "${sessionScope.userAccount}" != "") || ($("#isLogin").val() == 1)) {
            //如果登录
            location.href = "${pageContext.request.contextPath}/video/showVideo?videoId=" + video_id ;
        } else {
            //如果不登录，弹登录框
            $("#login").removeClass("hidden");
        }

    }
</script>
</body>
</html>