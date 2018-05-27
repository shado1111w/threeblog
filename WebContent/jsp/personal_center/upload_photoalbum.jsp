<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>上传/修改图片</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tinyImgUpload.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/tinyImgUpload.js"></script>


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
			.load('personalcenter_messages.html');
			$('#othercenter_down').show();
			})
		$("#shoucang").click(function() {
				$('#othercenter_body')
				.load('personalcenter_favorite.html');
				$('#othercenter_down').show();
				})
		$("#guanzhu").click(function() {
				$('#othercenter_body') 
				.load('personalcenter_follow.html');
				$('#othercenter_down').show();
				})
		$("#fenshi").click(function() {
				$('#othercenter_body') 
				.load('personalcenter_follower.html');
				$('#othercenter_down').show();
			})
		$("#changeinfo").click(function() {
				$('#othercenter_body') 
				.load('changeinfo.html');
				$('#othercenter_down').hide();
			})

})
</script>

</head>

<body>
<!--顶端栏begin-->
<div id="index_head">
  <div id="index_head_logo"> <img src="${pageContext.request.contextPath}/image/logo.png"> </div>
  <div id="index_head_menu">
    <ul>
      <li><a href="#" >首页</a></li>
      <li><a href="#" >博文</a></li>
      <li><a href="#" >画廊</a></li>
      <li><a href="#" >我的</a></li>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="#">
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
         	<li><a href="#home">&ensp;修改资料&ensp;</a></li>
          	<li><a href="#home">&ensp;修改头像&ensp;</a></li>
            <li><a href="#home">&ensp;更改密码&ensp;</a></li>
            <li><a href="#home">&ensp;个人中心&ensp;</a></li>
            <li><a href="#home">&ensp;举报中心&ensp;</a></li>
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
	<div id="upload_all">
    	<h1 style=" font-size:24px; width:960px; margin-left:40px;">█ 我的图片</h1>
        <div>
        	<h1 style=" font-size:18px; width:960px; margin-left:40px;">&emsp;&emsp;上传图片</h1>
        	<div style="min-height:380px;">
      			<div style="width:920px;margin:20px 20px;padding-top:20px;">
        			<div id="upload"  style="border:2px solid;"> </div>
      			</div>
      			<button class="submit" style="border:1px solid; font-size:32px; width:100px; height:50px; text-align:center;color:#FFF;background-color:#09C; float:right; margin-right:100px; margin-bottom:30px;">上传</button>
    		</div>
    <script src="${pageContext.request.contextPath}/js/tinyImgUpload.js"></script> 
    <script>
/*document.documentElement.style.fontSize = document.documentElement.clientWidth*0.1+'px';*/

var options = {
    path: '/',
    onSuccess: function (res) {
        console.log(res);
    },
    onFailure: function (res) {
        console.log(res);
    }
}

var upload = tinyImgUpload('#upload', options);
document.getElementsByClassName('submit')[0].onclick = function (e) {
    upload();
}
</script> 
    </div>
    <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3);    " width="90%" color=#999 SIZE=3>
    <div>
    <h1 style=" font-size:18px; width:960px; margin-left:40px;">&emsp;&emsp;删除图片</h1>
    <div>
        <ul>
          <li style="list-style:none;">
            <div style="width:280px;height:280px; float:left;margin:10px;"><img src="${pageContext.request.contextPath}/#" style="border:1px solid; width:280px;height:210px; ">
              <button style="margin:0 100px;border:1px solid;font-size:24px; background-color:#FFF;">删除</button>
            </div>
          </li>
           <li style="list-style:none;">
            <div style="width:280px;height:280px; float:left;margin:10px;"><img src="${pageContext.request.contextPath}/#" style="border:1px solid; width:280px;height:210px; ">
              <button style="margin:0 100px;border:1px solid;font-size:24px; background-color:#FFF;">删除</button>
            </div>
          </li>
           <li style="list-style:none;">
            <div style="width:280px;height:280px; float:left; margin:10px;"><img src="${pageContext.request.contextPath}/#" style="border:1px solid; width:280px;height:210px;">
              <button style="margin:0 100px;border:1px solid;font-size:24px; background-color:#FFF;">删除</button>
            </div>
          </li>
           <li style="list-style:none;">
            <div style="width:280px;height:280px; float:left;margin:10px;"><img src="${pageContext.request.contextPath}/#" style="border:1px solid; width:280px;height:210px; ">
              <button style="margin:0 100px;border:1px solid;font-size:24px; background-color:#FFF;">删除</button>
            </div>
          </li>
           <li style="list-style:none;">
            <div style="width:280px;height:280px; float:left;margin:10px;"><img src="${pageContext.request.contextPath}/#" style="border:1px solid; width:280px;height:210px; ">
              <button style="margin:0 100px;border:1px solid;font-size:24px; background-color:#FFF;">删除</button>
            </div>
          </li>
           <li style="list-style:none;">
            <div style="width:280px;height:280px; float:left; margin:10px;"><img src="${pageContext.request.contextPath}/#" style="border:1px solid; width:280px;height:210px;">
              <button style="margin:0 100px;border:1px solid;font-size:24px; background-color:#FFF;">删除</button>
            </div>
          </li> 
        </ul>
      </div>
    
    </div>
    </div>
</div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>
