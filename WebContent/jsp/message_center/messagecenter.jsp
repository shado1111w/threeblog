<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>发表博文</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/city.js"></script>  
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
		$("#message_pinglun").click(function() {
			$('#messagecenter_reviews') 
			.load('${pageContext.request.contextPath}/jsp/message_center/messagecenter_reviews.jsp');
			
			})
		$("#message_follow").click(function() {
				$('#messagecenter_reviews')
				.load('${pageContext.request.contextPath}/jsp/message_center/messagecenter_follow.jsp');
				
				})
		$("#message_favorite").click(function() {
				$('#messagecenter_reviews') 
				.load('${pageContext.request.contextPath}/jsp/message_center/messagecenter_favorite.jsp');
				
				})
		$("#message_zan").click(function() {
				$('#messagecenter_reviews') 
				.load('${pageContext.request.contextPath}/jsp/message_center/messagecenter_zan.jsp');
				
			})
		
})
</script>
<script>
function myfunction(){
	$('#messagecenter_reviews') 
	.load('${pageContext.request.contextPath}/jsp/message_center/messagecenter_reviews.jsp');
	<%String id = request.getParameter("id");%>
	var id="<%=id%>";
	if (id != null) {
		if (id == "1") {
			$('#messagecenter_reviews') 
			.load('${pageContext.request.contextPath}/jsp/message_center/messagecenter_reviews.jsp');
		} else if (id == "2") {
			$('#messagecenter_reviews')
			.load('${pageContext.request.contextPath}/jsp/message_center/messagecenter_follow.jsp');
		} else if (id == "3") {
			$('#messagecenter_reviews') 
			.load('${pageContext.request.contextPath}/jsp/message_center/messagecenter_favorite.jsp');
		} else if (id == "4") {
			$('#messagecenter_reviews') 
			.load('${pageContext.request.contextPath}/jsp/message_center/messagecenter_zan.jsp');
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
    	<a href="javascript:;">
        	<div style="float:left; position:relative;">
    			<img src="${pageContext.request.contextPath}/image/message.png"/>
                	<span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:10px; top:15px; z-index:200;" >0</span>
             </div>
         </a> 
         <ul class="index_tools_messages">
         	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp">评论消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:20px; z-index:200;" >0</span></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=2">关注消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:80px; z-index:200;" >0</span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=3">收藏消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:140px; z-index:200;" >0</span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=4">点赞消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:200px; z-index:200;" >0</span></li>
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
            <li><a href="${pageContext.request.contextPath}/jsp/report_center/reportcenter.jsp">&ensp;举报中心&ensp;</a></li>
            <li><a href="#home">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
    </ul>
     </div>
  <span style="color:#FFF; font-size:36px;float:left; margin-top:15px;"> |</span>
  <div id="index_head_signin">
    <ul>
      <li><a href="register.html">注册</a></li>
      <li><a href="signin.html">登录</a></li>
    </ul>
  </div>
</div>
</div>

<!--顶端栏end-->
<!--内容框begin-->
<div id="index_all">
	<div id="messagecenter_all">
    	<h1 style=" font-size:24px; width:960px; margin-left:40px;">█ 消息中心</h1>
        <!--导航栏begin-->
        <div  id="messagecenter_label">
            	<ul>
                	<li>
                    <div style=" cursor:pointer;position:relative;">
                    	<span id="message_pinglun">&emsp;&ensp;&emsp;评论消息&emsp;&ensp;&emsp;|</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span></div>
                    </li>
                    
                    <li>
                    <div style=" cursor:pointer;position:relative;">
                    	<span id="message_follow" >&emsp;&ensp;&emsp;关注消息&emsp;&ensp;&emsp;|</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span>
                    </div>
                    </li>
                    <li>
                    <div style="  cursor:pointer;position:relative;">
                    	<span  id="message_favorite">&emsp;&ensp;&emsp;收藏消息&emsp;&ensp;&emsp;|</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span>
                     </div>
                    </li>
                    <li>
                    <div style="  cursor:pointer;position:relative;">
                    	<span  id="message_zan">&emsp;&ensp;&emsp;点赞消息&emsp;&ensp;&emsp;</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span>
                    </div>
                    </li>
                </ul>
            </div>
           
            <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#999 SIZE=3>
        <!--导航栏end-->
         <!--评论消息begin--> 
         <div id="messagecenter_reviews">
         	
         </div>
    <!--评论消息end--> 
    </div>
</div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>
