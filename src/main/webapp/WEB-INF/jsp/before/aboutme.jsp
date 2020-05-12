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
        <h2>关于我们</h2>
        <div id="profile_tab">
            <div class="proflle_tab_body">
                <div class="proflle_tab_workplace clearfix">
                    <div id="app">
                        <div class="classify">
                            <div class="container">
                                <!--章-->
                                <div class="section">
                                    <p>网站使用了当下流行的MVC三层软件设计典范，选择面向对象的java编程语言开发，基于B/S架构和Mybatis+Spring+SpringMVC框架开发。	</p>
                                    <p>考虑到使用者对网站安全性及可信度的需求，在数据库的选用上最终采用MySQL，使用安全的数据映射方式与数据库进行连接，用以确保使用 	</p>
                                    <p>对网站数据的安全访问。网站主要针对在线公开课的用户、视频课程以及课件资料等进行高效管理， 网站可分为视频展示模块、网站可分为  	</p>
                                    <p>视频展示模块、用户个人中心模块、资料下载模块和后台的管理系统等。前端在设计上注重使用者的交互体验，采用可响应式的前端框架使和	</p>
                                    <p>异步响应的AJAX技术，提高网站的观赏性与流畅性，设计了视频分类选择、在线播放、留言互动等功能,用户可以在学习的时候与大家交流学	</p>
                                    <p>习心得，共同进步。网站目前已完成预期功能设计，运行流畅。使用本网站可以加强用户对知识的理解掌握,从而提升学习效率，为社会培养	</p>
                                    <p>具有自主学习能力的高质量人才</p>
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