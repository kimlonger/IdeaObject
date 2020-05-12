<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
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
            </li>
            <li id="gkk" class="nav_choose">
                <a onclick="location.href='${pageContext.request.contextPath}/course/course/1'" draggable="false">在线公开课</a>
            </li>
        </ul>
    </div>
</nav>
<main>
    <div class="container">
        <h2>回复讨论</h2>
        <div id="profile_tab">
            <ul class="profile_tab_header f_left clearfix">
            </ul>
            <div class="proflle_tab_body">
                <div class="proflle_tab_workplace clearfix">
                    <div class="profile_avatar_area">
                        <c:if test="${empty user.imgUrl}">
                            <img id="avatar" width="100" height="100" src="${pageContext.request.contextPath}/img/avatar_lg.png" alt="">

                        </c:if>

                        <c:if test="${not empty user.imgUrl}">
                            <img id="avatar" width="100" height="100" src="http://localhost:8081/uploadfile/images/${user.imgUrl}" alt="">
                        </c:if>
                        <p>
                            <c:if test="${not empty user.nickName}">
                                <span>${user.nickName}</span>
                            </c:if>
                            <c:if test="${empty user.nickName}">
                                <span>${user.email}</span>
                            </c:if>
                           </p>
                    </div>
                    <ul class="profile_ifo_area">
                        <form id="regForm2" >
                            发帖者:<input type="text"  value="${user.nickName}" name="topic_user" readonly="readonly"/><br>
                            时间&nbsp：<input type="text" value="${topic.topic_time}" name="time" readonly="readonly"/><br>
                            标题&nbsp：<input type="text" value="${topic.title}" name="title" readonly="readonly"/><br>
                            内容：<br><textarea rows="5" cols="30" placeholder="${topic.content}" name="content" readonly="readonly"></textarea><br><br>

                        </form>
                    </ul>
                    <!--添加留言-->
            <div>
                <form class="layui-form" action="${pageContext.request.contextPath}/user/addcomment" method="post" style="width:80%;">
                    <input name="c_userid" value="${sessionScope.userAccount}" hidden="hidden"/>
                    <input name="c_otherid" value="${topic.topic_user}" hidden="hidden"/>
                    <input name="c_contentid" value="${topic.id}" hidden="hidden"/>
                    <input name="c_state" value="0" hidden="hidden"/>
                    <div class="layui-input-block" style="margin-left: 0;">
                        <textarea id="c_content" name="c_content" placeholder="请输入你的留言" class="layui-textarea" style="height: 100px ; width: 300px;"></textarea>
                    </div>
                    <br/>
                    <div class="layui-input-block" style="text-align: left;margin-left: 0;">
                        <input type="submit" class="layui-btn" value="留言">
                    </div>
                </form>
            </div>
                    <!-- 留言信息列表展示 -->
                    <div>
                        <ul>
                            <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                            <c:forEach items="${commentList}" var="comment">
                            <!-- 如果留言信息是在本文章下的才显示 -->
                                <c:if test="${comment.c_contentid eq topic.id && comment.c_otherid eq topic.topic_user}">
                            <li style="border-top: 1px dotted #01AAED">
                                <br/>
                                <div style="text-align: left;color:#444">
                                    <div>
                                        <span style="color:#01AAED">${comment.c_userid}</span>
                                    </div>
                                    <div>${comment.c_content}</div>
                                </div>
                                <div>
                                    <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                                        <p>
                                            <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
                                        </p>
                                        <hr style="margin-top: 7px;"/>
                                    </div>
                                    <!-- 回复表单默认隐藏 start-->
                                    <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                        <form action="${pageContext.request.contextPath}/user/addreply" method="post" class="layui-form">
                                            <input name="r_contentid" id="contentid" value="${topic.id}" hidden="hidden"/>
                                            <input name="r_userid" id="userid" value="${sessionScope.userAccount}" hidden="hidden"/>
                                            <input name="r_otherid" id="otherid" value="${topic.topic_user}" hidden="hidden"/>
                                            <input name="r_state" id="state" value="0" hidden="hidden"/>
                                            <div class="layui-form-item">
                                                <textarea name="r_content" id="content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                                            </div>
                                            <div class="layui-form-item">
                                                <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>

                                <c:forEach items="${replyList}" var="reply">
                                    <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                                    <c:if test="${reply.r_contentid eq comment.c_contentid && reply.r_userid eq comment.c_userid}">
                                        <div style="text-align: left;margin-left:61px;color: #444">
                                            <div>
                                                <span style="color:#5FB878">${reply.r_userid}&nbsp;&nbsp;回复${reply.r_otherid}</span>
                                            </div>
                                            <div>${reply.r_content}</div>
                                        </div>
                                        <div>
                                            <div class="comment-parent" style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                                                <p>
                                                    <a href="javascript:;" style="text-decoration: none;" οnclick="btnReplyClick(this)">回复</a>
                                                </p>
                                                <hr style="margin-top: 7px;"/>
                                            </div>
                                            <!-- 回复表单默认隐藏 -->
                                            <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                                <form action="${pageContext.request.contextPath}/user/addreply" method="post" class="layui-form">
                                                    <input name="r_contentid" id="r_contentid" value="${reply.r_contentid}" hidden="hidden"/>
                                                    <input name="r_userid" id="r_userid" value="${sessionScope.userAccount}" hidden="hidden"/>
                                                        <%--  <input name="rCreatime" id="rCreatime" value="<%=nowDate%>" hidden="hidden"/>--%>
                                                    <input name="r_otherid" id="r_otherid" value="${comment.c_userid}" hidden="hidden"/>


                                                    <div class="layui-form-item">
                                                        <textarea name="r_content" id="r_content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                                                    </div>
                                                    <div class="layui-form-item">
                                                        <button id="replyBtn1" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                                    </div>
                                                </form>
                                            </div>

                                        </div>
                                    </c:if>
                                </c:forEach>
                            </li>

                                </c:if>
                            </c:forEach>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
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
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<!-- 加载Layui的配置 -->
<script src="${pageContext.request.contextPath}/js/layui.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function btnReplyClick(elem) {
        var $ = layui.jquery;
        if($(this)){
        }else if(!$(this)){
            $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-show');
        }
        $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-hide');
        if ($(elem).text() !== "回复") {
            $(elem).text('回复')
        } else {
            $(elem).text('收起')
        }
    }
    $("#replyBtn").click(function(){
        var r_contentid = $("#r_contentid").val();
        var r_userid = $("#r_userid").val();
        var r_otherid = $("#r_otherid").val();
        var r_content = $("#r_content").val();
        var r_state= $("#r_state").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/user/addreply',
            type: 'POST',
            data: [{
                r_contentid: r_contentid,
                r_userid: r_userid,
                r_otherid: r_otherid,
                r_content: r_content,
                r_state:r_state
            }],
            success: function(data){
                layer.open({
                    title: '提示信息',
                    content: '留言成功',
                    btn: ['确定'],
                    /* btn1: function(index){
                       /!*  $("body").html(data);*!/
                     }*/
                });
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '出现未知错误'
                });
            }
        });
    });

</script>
</body>
</html>