<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, userDaos-scalable=no">
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="icon" href="favicon.png" type="image/png">
    <title>在线公开课-Y先生教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">

        $(function(){

           var sex = '${userDaos.sex}';
           $("input[name='sex']").each(function(i,obj){
               //obj是dom对象     不是jquery对象
               //alert(obj+","+i);
               //alert(obj.value+","+sex);
               if($(obj).val()==sex){
                 // obj.checked=true;
                 $(obj).attr("checked",true);
               }
           });
           var address ='${user.address}'; //""  河南-平顶山

           if(null!=address && address!=""){
               var arr=address.split("-");

	            $("#city").citySelect({
		            prov: arr[0],  //默认省份
		            city: arr[1],  //默认城市
		            nodata: "none"
		        });
           }else{
                $("#city").citySelect({
		            prov: "河南",  //默认省份
		            city: "平顶山",  //默认城市
		            nodata: "none"
		        });
           }

         });

         function commitForm(){

            var address= $(".prov").val()+"-"+$(".city").val();

            $("#address").val(address);

           // $("form").commit();
             return true;
         }
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
                    <h3><a onclick="location.href='${pageContext.request.contextPath}/user/showMyProfile'" draggable="false">返回个人中心</a></h3>
                    <div class="proflle_tab_workplace clearfix">
                        <div class="profile_avatar_area">
                            <img width="180px" height="180px"  src="http://localhost:8081/uploadfile/images/${user.imgUrl}">
                        </div>
                        <div class="profile_ifo_area">
                            <!--http://localhost/video/userDaos/changeProfile-->
                            <form action="updateUser" method="post">
                                <input name="id" type="hidden" value="${user.id}">
                                <div class="form_group">
                                    <span class="dd">昵&#x3000;称：</span><input type="text" name="nickName" value="${user.nickName}" >
                                </div>
                                <div class="form_group">
                                    <span class="dd">性&#x3000;别：</span>
                                    <input type="radio" id="man" value="man" name="sex"><label for="man">男</label>
                                    <input type="radio" id="woman" value="woman" name="sex"><label for="woman">女</label>
                                </div>
                                <div class="form_group">
                                    <span class="dd">生&#x3000;日：</span>  <!-- 1990-10-04 -->
                                    <input type="text"  name="birthday" value="${user.birthday}">
                                </div>
                                <div class="form_group">
                                    <span class="dd">邮&#x3000;箱：</span>
                                    <span >${user.email}</span>
                                </div>
                                <div class="form_group">
                                    <span class="dd">所在地：</span>
                                    <div id="city">
                                        <select class="prov" name="prov"></select>
                                        <select class="city" disabled="disabled" name="city"></select>
                                    </div>
                                    <input type="hidden" name="address" id="address"/>
                                </div>
                                <div class="form_submit dd">
                                    <input type="submit" onclick="return commitForm();"  value="保&#x3000;存">
                                    <a href="changeProfile">重置</a>
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

<script src="${pageContext.request.contextPath}/js/jquery.cityselect.min.js"></script>

</html>