<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.User" %>
<%@ page import="threeblog.service.Service" %>
<%
	User user = new User();
	Service service = new Service();
	int user_id = 10240;
	if (session.getAttribute("user_id") == null) {
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("<script>alert(`会话过期，将重新登录！`)</script>");
		String content = 0 + ";URL= " +request.getContextPath()+ "/jsp/login/sign_in.jsp";
		response.setHeader("REFRESH ", content);
	} else {
		user_id = Integer.valueOf((String) session.getAttribute("user_id"));
		user = service.getUserFromId(user_id);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>我的主页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/city.js"></script>  

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>

<script src="${pageContext.request.contextPath}/js/jquery-rebox.js"></script>

<!--头部show的js-->
<script>
$(function(){
    $('#owl-demo').owlCarousel({
        items: 1,
        autoPlay: true
    });
});
</script>
<!--消息栏显示-->
<script>
$(function() {
    $('li').hover(function() {
            $(this).find('ul').css({
                'display': 'block',
                'animation:': '2s'
            })
        },
        function() {
            $(this).find('ul').css({
                'display': 'none',
                'animation:': '2s'
            })
        });
});
</script>

 <!--导航栏切换-->
<script>
	$(document).ready(function() {
		$("#bowen").click(function() {
			$('#othercenter_body') 
			.load('${pageContext.request.contextPath}/jsp/personal_center/personalcenter_messages.jsp');
			$('#othercenter_down').show();
			})
		$("#shoucang").click(function() {
				$('#othercenter_body')
				.load('${pageContext.request.contextPath}/jsp/personal_center/personalcenter_favorite.jsp');
				$('#othercenter_down').show();
				})
		$("#guanzhu").click(function() {
				$('#othercenter_body') 
				.load('${pageContext.request.contextPath}/jsp/personal_center/personalcenter_follow.jsp');
				$('#othercenter_down').show();
				})
		$("#fenshi").click(function() {
				$('#othercenter_body') 
				.load('${pageContext.request.contextPath}/jsp/personal_center/personalcenter_follower.jsp');
				$('#othercenter_down').show();
			})
		$("#changeinfo").click(function() {
				$('#othercenter_body') 
				.load('${pageContext.request.contextPath}/jsp/personal_center/changeinfo.jsp');
				$('#othercenter_down').hide();
			})

})
</script>
<script>
function myfunction(){
	$('#othercenter_body') 
	.load('${pageContext.request.contextPath}/jsp/personal_center/personalcenter_messages.jsp');
	$('#othercenter_down').show();
	<%String id = request.getParameter("id");%>
	var id="<%=id%>";
	if (id != null) {
		if (id == "1") {
			$('#othercenter_body') 
			.load('${pageContext.request.contextPath}/jsp/personal_center/personalcenter_messages.jsp');
			$('#othercenter_down').show();
		} else if (id == "2") {
			$('#othercenter_body')
			.load('${pageContext.request.contextPath}/jsp/personal_center/personalcenter_favorite.jsp');
			$('#othercenter_down').show();
		} else if (id == "3") {
			$('#othercenter_body') 
			.load('${pageContext.request.contextPath}/jsp/personal_center/personalcenter_follow.jsp');
			$('#othercenter_down').show();
		} else if (id == "4") {
			$('#othercenter_body') 
			.load('${pageContext.request.contextPath}/jsp/personal_center/personalcenter_follower.jsp');
			$('#othercenter_down').show();
		}else if (id == "5") {
			$('#othercenter_body') 
			.load('${pageContext.request.contextPath}/jsp/personal_center/changeinfo.jsp');
			$('#othercenter_down').hide();
		}
	}
}
</script>

</head>

<body onload="myfunction()">
<!--顶端栏begin-->
<div id="index_head">
  <div id="index_head_logo"> <img src="${pageContext.request.contextPath}/image/logo.png"> </div>
  <div id="index_head_menu">
    <ul>
    <li><a href="${pageContext.request.contextPath}/index.jsp" >首页</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/index/blog.jsp" >博文</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/index/pictures.jsp" >画廊</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp" >我的</a></li>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="${pageContext.request.contextPath}/jsp/index/search.jsp">
        	<img  src="${pageContext.request.contextPath}/image/search.png" style="float:left;" />
       	</a> 
    </li>
    <li>
    	<a href="#">
        	<div style="float:left; position:relative;">
    			<img src="${pageContext.request.contextPath}/image/message.png"/>
                	<span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:10px; top:15px; z-index:200;" >0</span>
             </div>
         </a> 
         <ul class="index_tools_messages">
         	<li><a href="#home">评论消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:20px; z-index:200;" >0</span></li>
          	<li><a href="#home">关注消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:80px; z-index:200;" >0</span></li>
            <li><a href="#home">收藏消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:140px; z-index:200;" >0</span></li>
            <li><a href="#home">点赞消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:200px; z-index:200;" >0</span></li>
            <li><a href="#home">举报消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:265px; z-index:200;" >0</span></li>
         </ul>
    </li>
    <li>
    	<a href="#">
        	<img src="${pageContext.request.contextPath}/image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
         	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改资料&ensp;</a></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改头像&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;更改密码&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp">&ensp;个人中心&ensp;</a></li>
            <li><a href="#home">&ensp;举报中心&ensp;</a></li>
            <li><a href="#home">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
    </ul>
     </div>
  <span style="color:#FFF; font-size:36px;float:left; margin-top:15px;"> |</span>
  <div id="index_head_signin">
    <ul>
     <li><a href="${pageContext.request.contextPath}/jsp/login/register.jsp">注册</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/login/sign_in.jsp">登录</a></li>
    </ul>
  </div>
</div>


<!--顶端栏end-->
<!--内容框begin-->
<div id="index_all">
	<div id="othercenter_all">
    	<!--头部栏begin-->
    	<div id="othercenter_head" style="margin-bottom:30px;">
    		
          	<img src="<%=user.getTouxiang() %>"  style="width:120px;height:120px;border-radius:60px; margin-top:30px;margin-left:200px;margin-right:50px; float:left;">				   			
            <div style="float:left; margin-top:40px; margin-bottom:10px;">
            	<span style="font-size:36px;"><%=user.getUsername() %></span><br>		 				
                <span style="font-size:24px;">博文&emsp;|&emsp;关注&emsp;|&emsp;粉丝</span><br>
                <span style="font-size:24px;">&ensp;10&emsp;</span><span style="font-size:24px;">&emsp;&emsp;333&emsp;&emsp;</span><span style="font-size:24px;">&ensp;500</span>
            </div>
            <span id="changeinfo" style="cursor:pointer;border:1px solid #09F; background-color:#09F; border-radius:5px;float:right; margin-top:50px; width:150px; height:40px; margin-right:50px;color:#FFF; font-size:18px; font-weight:bold; margin-left:130px; margin-bottom:50px; text-align:center;padding-top:15px;">修改个人资料</span>
            <div style="width:500px; height:100px; margin-left:200px;margin-top:180px;">
              <div style="width:250px; float:left;height:100px;">
              	<span>性别：</span>
                <span><%=user.getSex() %></span><br>
                <span>年龄：</span>
                <span><%=user.getAge() %></span><br>
            	<span>注册时间：</span>
                <span><%=user.getRegister_time() %></span><br>
                <span>所在地区：</span>
                <span><%=user.getProvince() %><%=user.getCity() %></span>
              </div>
              <div >
              	<span>个人简介：</span><br>
                <p><%=user.getIntroduction() %>
                </p>
              </div>
            </div>
    	</div>
    	<!--头部栏end-->
        <!--导航栏begin-->
        <div  id="othercenter_label">
            	<ul>
                	<li>
                    	<span id="bowen" style="cursor:pointer">&emsp;&ensp;&emsp;我的博文&emsp;&ensp;&emsp;|</span>
                    </li>
                    
                    <li>
                    	<span id="shoucang" style="cursor:pointer">&emsp;&ensp;&emsp;我的收藏&emsp;&ensp;&emsp;|</span>
                    </li>
                    <li>
                    	<span  id="guanzhu" style="cursor:pointer">&emsp;&ensp;&emsp;我的关注&emsp;&ensp;&emsp;|</span>
                    </li>
                    <li>
                    	<span  id="fenshi" style="cursor:pointer">&emsp;&ensp;&emsp;我的粉丝&emsp;&ensp;&emsp;</span>
                    </li>
                </ul>
            </div>
           
            <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#999 SIZE=3>
        <!--导航栏end-->
        <!--中间栏begin-->
        <div id="othercenter_body">
        	
        </div>
        <!--中间栏end-->
        <!--相册栏begin-->
    <div id="othercenter_down"><br>
      <span style="font-size:24px; width:500px;margin-left:40px; font-weight:bold;">█ 我的图片</span>
      <a href="upload_photoalbum.html"><span style="float:right; margin-right:100px; border:1px solid #39c; background-color:#39c
      ; color:#FFF; width:200px; font-size:20px; text-align:center; border-radius:5px;">上传/修改图片</span></a>
      <div style="width:960px; margin-left:30px;">
      <!-- 代码 开始 -->
<div id="gallery2" class="gallery">
	<a href="image/pic1.jpg" title="2018-05-04"><img src="${pageContext.request.contextPath}/image/pic1.jpg" width="280" height="210" style="border:1px solid;  margin:10px;"></a>
	<a href="image/pic2.jpg" title="2018-05-04"><img src="${pageContext.request.contextPath}/image/pic2.jpg" width="280" height="210" style="border:1px solid;  margin:10px;"></a>
    <a href="image/pic3.jpg" title="2018-05-04"><img src="${pageContext.request.contextPath}/image/pic3.jpg" width="280" height="210" style="border:1px solid;  margin:10px;"></a>
    <a href="image/pic4.jpg" title="2018-05-04"><img src="${pageContext.request.contextPath}/image/pic4.jpg" width="280" height="210" style="border:1px solid;  margin:10px;"></a>
    <a href="image/1.jpg" title="2018-05-04"><img src="${pageContext.request.contextPath}/image/1.jpg" width="280" height="210" style="border:1px solid;  margin:10px;"></a>
     <a href="image/2.jpg" title="2018-05-04"><img src="${pageContext.request.contextPath}/image/2.jpg" width="280" height="210" style="border:1px solid;  margin:10px;"></a>
      <a href="image/3.jpg" title="2018-05-04"><img src="${pageContext.request.contextPath}/image/3.jpg" width="280" height="210" style="border:1px solid;  margin:10px;"></a>
</div>
<script>
$('#gallery2').rebox({ selector: 'a' });
</script>
</div>
    
  </div>
</div>
<!--相册栏end-->
    </div>
</div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>
