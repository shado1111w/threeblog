<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.*" %>
<%@ page import="threeblog.service.Service" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	boolean login_flag=false;
	User user = new User();
	Service service = new Service();
	int user_id = 10240;
	if (session.getAttribute("user_id") == null) {
		String phonenum="";
		String password="";
		Cookie[] cookies=request.getCookies();
		if(cookies!=null&&cookies.length>0){
			for(Cookie c:cookies){
				if(c.getName().equals("phonenum1")){
					phonenum=c.getValue();
					
					login_flag=true;
				}
				if(c.getName().equals("password1")){
					password=c.getValue();
				}			
			}	
		}
		if(login_flag){
			response.setContentType("text/html;charset=utf-8");
			String content = 0 + ";URL= " +request.getContextPath()+ "/servlet/Login?zh="+phonenum+"&mm="+password+"&li_url="+request.getRequestURL();
			response.setHeader("REFRESH ", content);
		}
		
	} else {
		user_id = Integer.valueOf((String) session.getAttribute("user_id"));
		user = service.getUserFromId(user_id);	
		login_flag=true;
	}
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	ArrayList<Zan> zans=service.getZanFromReceiver_id(user_id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>点赞消息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>

<script>

$(document)
.ready(
		function() {	
			for (var i=0; i<<%=zans.size()%>; i++){  
				$("[id=current_"+i+"]").bind("click", {index: i}, clickHandler);  
		    }  
		  
		    function clickHandler(event) {  
		        var i= event.data.index;  
		        var sender_id=$("#current_"+i).attr("data");
		        var zan_id=$("#current"+i).attr("data");
		        var url="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id="+sender_id;
		        var status=$("#current___"+i).attr("title");
		        if(status=="未读") status="已读";
		        else if(status="已读") status="未读";
		        var url2="${pageContext.request.contextPath}/servlet/UpdateZan";
		        var args={
		        		"zan_id" : zan_id,
		        		"status":status,
						"time" : new Date()
		        }
		        $.ajaxSettings.async = false; 
		        $.get(url2, args,
						function(data) {
		        	if(status=="已读"){
		        		
			        	$("#current___"+i).attr("src","${pageContext.request.contextPath}/image/read.png");
			        	$("#current___"+i).attr("title","已读");
			        	var new_content=$("#all_result").find("#current____"+i).clone();
			        	//删除未读信息列表里的
			        	$("#all_result").find("#current____"+i).remove();
			        	//删除未读信息列表里的
			        	$("#hiddenresult").find("#current____"+i).remove();
			        	$("#hiddenresult2").find("#information_table").append(new_content);
			      
		        		
		        	}else{
			        		
			        		$("#current___"+i).attr("src","${pageContext.request.contextPath}/image/unread.png");
				        	$("#current___"+i).attr("title","未读");
				        	var new_content=$("#all_result").find("#current____"+i).clone();
				        	//删除已读信息列表里的
				        	$("#all_result").find("#current____"+i).remove();
				        	//删除已读信息列表里的
				        	$("#hiddenresult2").find("#current____"+i).remove();
				        	$("#hiddenresult").find("#information_table").append(new_content);
				        	
			        		
			        }
		        	 window.open(url);
				}); 
		       
		        $.ajaxSettings.async = true; 
		    }  
		});

</script>


<script>

$(document)
.ready(
		function() {	
			for (var i=0; i<<%=zans.size()%>; i++){  
				$("[id=current__"+i+"]").bind("click", {index: i}, clickHandler);  
		    }  
		  	
		    function clickHandler(event) {  
		        var i= event.data.index;  
		        var zan_id=$("#current"+i).attr("data");
		        var status=$("#current___"+i).attr("title");
		        if(status=="未读") status="已读";
		        else if(status="已读") status="未读";
		        var url2="${pageContext.request.contextPath}/servlet/UpdateZan";
		        var args={
		        		"zan_id" : zan_id,
		        		"status":status,
						"time" : new Date()
		        }
		        $.ajaxSettings.async = false; 
		        $.get(url2, args,
						function(data) {
		        	
		        	if(status=="已读"){
	    
			        	$("#current___"+i).attr("src","${pageContext.request.contextPath}/image/read.png");
			        	$("#current___"+i).attr("title","已读");
			        	var new_content=$("#all_result").find("#current____"+i).clone();
			        	//删除未读信息列表里的
			        	$("#all_result").find("#current____"+i).remove();
			        	//删除未读信息列表里的
			        	$("#hiddenresult").find("#current____"+i).remove();
			        	$("#hiddenresult2").find("#information_table").append(new_content);
		        	}
		        	else{
		        		
		        		$("#current___"+i).attr("src","${pageContext.request.contextPath}/image/unread.png");
			        	$("#current___"+i).attr("title","未读");
			        	var new_content=$("#all_result").find("#current____"+i).clone();
			        	//删除已读信息列表里的
			        	$("#all_result").find("#current____"+i).remove();
			        	//删除已读信息列表里的
			        	$("#hiddenresult2").find("#current____"+i).remove();
			        	$("#hiddenresult").find("#information_table").append(new_content);
			        	
		        	}
				}); 
		       
		        $.ajaxSettings.async = true; 
		    }  
		});

</script>
</head>

<body>
<!--评论消息begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 点赞消息</span>
            <select id="select" style="width:100px; float:right; margin-right:50px; font-size:18px;">
    			<option value="notread">未读</option>
    			<option value="read">已读</option>
 
    	    </select>
    
    <div id="all_result" >
   
    		<div class="result">
		<table id="information_table" border="1">
	    <tr>
	    <th width="5%">#</th>
	    <th width="55%">关注消息</th>
	    <th width="25%">时间</th>
	    <th width="15%">操作</th>
	    </tr>
		 <%
							
							if (!zans.isEmpty()) {
								int j=0;
								for (int i = 0; i < zans.size(); i++) {
									Zan zan= zans.get(i);
									int sender_id=zan.getSender_id();
									User sender = service.getUserFromId(sender_id);
									
						%>

						<%
							if (zan.getType().equals("评论点赞")&&zan.getStatus().equals("未读")) {
						%>
						
						<tr id="current____<%=j%>">

							<td><%=j + 1%></td>
							<td><a href="javascript:;" id="current_<%=j %>" data="<%=sender.getId() %>" style="color: #339b53;"><%=sender.getUsername()%></a>
								点赞了你的评论"<%=zan.getText() %>"<span style="display:none;" id="current<%=j%>" data="<%=zan.getId()%>"></span></td>
							<td><%=df.format(zan.getAdd_time())%></td>
							<td><a id="current__<%=j%>" style="cursor:pointer"><img id="current___<%=j %>"
								src="${pageContext.request.contextPath}/image/unread.png" title="未读"
								style="width: 40px; height: 40px;"></a></td>

						</tr>
						<%
						++j;}else if(zan.getType().equals("回复点赞")&&zan.getStatus().equals("未读")) {
						%>
						<tr id="current____<%=j%>">

							<td><%=j + 1%></td>
							<td><a href="javascript:;" id="current_<%=j %>" data="<%=sender.getId() %>" style="color: #339b53;"><%=sender.getUsername()%></a>
								点赞了你的回复"<%=zan.getText() %>"<span style="display:none;" id="current<%=j%>" data="<%=zan.getId()%>"></span></td>
							<td><%=df.format(zan.getAdd_time())%></td>
							<td><a id="current__<%=j%>" style="cursor:pointer"><img id="current___<%=j %>"
								src="${pageContext.request.contextPath}/image/unread.png" title="未读"
								style="width: 40px; height: 40px;"></a></td>

						</tr>
						
						<%++j;}else if(zan.getType().equals("文章点赞")&&zan.getStatus().equals("未读")){  %>
						
						<tr id="current____<%=j%>">

							<td><%=j + 1%></td>
							<td><a href="javascript:;" id="current_<%=j %>" data="<%=sender.getId() %>" style="color: #339b53;"><%=sender.getUsername()%></a>
								点赞了你的博文《<%=zan.getText() %>》<span style="display:none;" id="current<%=j%>" data="<%=zan.getId()%>"></span></td>
							<td><%=df.format(zan.getAdd_time())%></td>
							<td><a id="current__<%=j%>" style="cursor:pointer"><img id="current___<%=j %>"
								src="${pageContext.request.contextPath}/image/unread.png" title="未读"
								style="width: 40px; height: 40px;"></a></td>

						</tr>
						<%
						++j;}
						%>
						<%
							}
							}
						%>
		</table>
		</div>
				    
    
    
    </div>		    
    	        
         </div>
    <!--评论消息end--> 
    
    <!-- 未读关注消息 -->
    <div id="hiddenresult" style="display: none;">
		
			<div class="result">
		<table id="information_table" border="1">
	    <tr>
	    <th width="5%">#</th>
	    <th width="55%">关注消息</th>
	    <th width="25%">时间</th>
	    <th width="15%">操作</th>
	    </tr>
		 <%
							
							if (!zans.isEmpty()) {
								int j=0;
								for (int i = 0; i < zans.size(); i++) {
									Zan zan= zans.get(i);
									int sender_id=zan.getSender_id();
									User sender = service.getUserFromId(sender_id);
									
						%>

						<%
							if (zan.getType().equals("评论点赞")&&zan.getStatus().equals("未读")) {
						%>
						
						<tr id="current____<%=j%>">

							<td><%=j + 1%></td>
							<td><a href="javascript:;" id="current_<%=j %>" data="<%=sender.getId() %>" style="color: #339b53;"><%=sender.getUsername()%></a>
								点赞了你的评论"<%=zan.getText() %>"<span style="display:none;" id="current<%=j%>" data="<%=zan.getId()%>"></span></td>
							<td><%=df.format(zan.getAdd_time())%></td>
							<td><a id="current__<%=j%>" style="cursor:pointer"><img id="current___<%=j %>"
								src="${pageContext.request.contextPath}/image/unread.png" title="未读"
								style="width: 40px; height: 40px;"></a></td>

						</tr>
						<%
						++j;}else if(zan.getType().equals("回复点赞")&&zan.getStatus().equals("未读")) {
						%>
						<tr id="current____<%=j%>">

							<td><%=j + 1%></td>
							<td><a href="javascript:;" id="current_<%=j %>" data="<%=sender.getId() %>" style="color: #339b53;"><%=sender.getUsername()%></a>
								点赞了你的回复"<%=zan.getText() %>"<span style="display:none;" id="current<%=j%>" data="<%=zan.getId()%>"></span></td>
							<td><%=df.format(zan.getAdd_time())%></td>
							<td><a id="current__<%=j%>" style="cursor:pointer"><img id="current___<%=j %>"
								src="${pageContext.request.contextPath}/image/unread.png" title="未读"
								style="width: 40px; height: 40px;"></a></td>

						</tr>
						
						<%++j;}else if(zan.getType().equals("文章点赞")&&zan.getStatus().equals("未读")){  %>
						
						<tr id="current____<%=j%>">

							<td><%=j + 1%></td>
							<td><a href="javascript:;" id="current_<%=j %>" data="<%=sender.getId() %>" style="color: #339b53;"><%=sender.getUsername()%></a>
								点赞了你的博文《<%=zan.getText() %>》<span style="display:none;" id="current<%=j%>" data="<%=zan.getId()%>"></span></td>
							<td><%=df.format(zan.getAdd_time())%></td>
							<td><a id="current__<%=j%>" style="cursor:pointer"><img id="current___<%=j %>"
								src="${pageContext.request.contextPath}/image/unread.png" title="未读"
								style="width: 40px; height: 40px;"></a></td>

						</tr>
						<%
						++j;}
						%>
						<%
							}
							}
						%>
		</table>
		</div>
		
		</div>
		
		 <!-- 已读关注消息 -->
    <div id="hiddenresult2" style="display: none;">
		
			<div class="result">
		<table id="information_table" border="1">
	    <tr>
	    <th width="5%">#</th>
	    <th width="55%">关注消息</th>
	    <th width="25%">时间</th>
	    <th width="15%">操作</th>
	    </tr>
		 <%
							
							if (!zans.isEmpty()) {
								int j=0;
								for (int i = 0; i < zans.size(); i++) {
									Zan zan= zans.get(i);
									int sender_id=zan.getSender_id();
									User sender = service.getUserFromId(sender_id);
									
						%>

						<%
							if (zan.getType().equals("评论点赞")&&zan.getStatus().equals("已读")) {
						%>
						
						<tr id="current____<%=j%>">

							<td><%=j + 1%></td>
							<td><a href="javascript:;" id="current_<%=j %>" data="<%=sender.getId() %>" style="color: #339b53;"><%=sender.getUsername()%></a>
								点赞了你的评论"<%=zan.getText() %>"<span style="display:none;" id="current<%=j%>" data="<%=zan.getId()%>"></span></td>
							<td><%=df.format(zan.getAdd_time())%></td>
							<td><a id="current__<%=j%>" style="cursor:pointer"><img id="current___<%=j %>"
								src="${pageContext.request.contextPath}/image/read.png" title="已读"
								style="width: 40px; height: 40px;"></a></td>

						</tr>
						<%
						++j;}else if(zan.getType().equals("回复点赞")&&zan.getStatus().equals("已读")) {
						%>
						<tr id="current____<%=j%>">

							<td><%=j + 1%></td>
							<td><a href="javascript:;" id="current_<%=j %>" data="<%=sender.getId() %>" style="color: #339b53;"><%=sender.getUsername()%></a>
								点赞了你的回复"<%=zan.getText() %>"<span style="display:none;" id="current<%=j%>" data="<%=zan.getId()%>"></span></td>
							<td><%=df.format(zan.getAdd_time())%></td>
							<td><a id="current__<%=j%>" style="cursor:pointer"><img id="current___<%=j %>"
								src="${pageContext.request.contextPath}/image/read.png" title="已读"
								style="width: 40px; height: 40px;"></a></td>

						</tr>
						
						<%++j;}else if(zan.getType().equals("文章点赞")&&zan.getStatus().equals("已读")){  %>
						
						<tr id="current____<%=j%>">

							<td><%=j + 1%></td>
							<td><a href="javascript:;" id="current_<%=j %>" data="<%=sender.getId() %>" style="color: #339b53;"><%=sender.getUsername()%></a>
								点赞了你的博文《<%=zan.getText() %>》<span style="display:none;" id="current<%=j%>" data="<%=zan.getId()%>"></span></td>
							<td><%=df.format(zan.getAdd_time())%></td>
							<td><a id="current__<%=j%>" style="cursor:pointer"><img id="current___<%=j %>"
								src="${pageContext.request.contextPath}/image/read.png" title="已读"
								style="width: 40px; height: 40px;"></a></td>

						</tr>
						<%
						++j;}
						%>
						<%
							}
							}
						%>
		</table>
		</div>
		
		</div>
		
		<script>
		$('#select').change(function(){ 
			if($("#select").val()=="read"){
				var new_content = $("#hiddenresult2 div.result").clone();
				$("#all_result").empty().append(new_content); //装载对应分页的内容
			}else if($("#select").val()=="notread"){
				var new_content = $("#hiddenresult div.result").clone();
				$("#all_result").empty().append(new_content); //装载对应分页的内容
			}
			
			$(document)
			.ready(
					function() {	
						for (var i=0; i<<%=zans.size()%>; i++){  
							$("[id=current_"+i+"]").bind("click", {index: i}, clickHandler);  
					    }  
					  
					    function clickHandler(event) {  
					        var i= event.data.index;  
					        var sender_id=$("#current_"+i).attr("data");
					        var zan_id=$("#current"+i).attr("data");
					        var url="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id="+sender_id;
					        var status=$("#current___"+i).attr("title");
					        if(status=="未读") status="已读";
					        else if(status="已读") status="未读";
					        var url2="${pageContext.request.contextPath}/servlet/UpdateZan";
					        var args={
					        		"zan_id" : zan_id,
					        		"status":status,
									"time" : new Date()
					        }
					        $.ajaxSettings.async = false; 
					        $.get(url2, args,
									function(data) {
					        	if(status=="已读"){
					        		
						        	$("#current___"+i).attr("src","${pageContext.request.contextPath}/image/read.png");
						        	$("#current___"+i).attr("title","已读");
						        	var new_content=$("#all_result").find("#current____"+i).clone();
						        	//删除未读信息列表里的
						        	$("#all_result").find("#current____"+i).remove();
						        	//删除未读信息列表里的
						        	$("#hiddenresult").find("#current____"+i).remove();
						        	$("#hiddenresult2").find("#information_table").append(new_content);
						      
					        		
					        	}else{
						        		
						        		$("#current___"+i).attr("src","${pageContext.request.contextPath}/image/unread.png");
							        	$("#current___"+i).attr("title","未读");
							        	var new_content=$("#all_result").find("#current____"+i).clone();
							        	//删除已读信息列表里的
							        	$("#all_result").find("#current____"+i).remove();
							        	//删除已读信息列表里的
							        	$("#hiddenresult2").find("#current____"+i).remove();
							        	$("#hiddenresult").find("#information_table").append(new_content);
							        	
						        		
						        }
					        	 window.open(url);
							}); 
					       
					        $.ajaxSettings.async = true; 
					    }  
					});
			
			$(document)
			.ready(
					function() {	
						for (var i=0; i<<%=zans.size()%>; i++){  
							$("[id=current__"+i+"]").bind("click", {index: i}, clickHandler);  
					    }  
					  	
					    function clickHandler(event) {  
					        var i= event.data.index;  
					        var zan_id=$("#current"+i).attr("data");
					        var status=$("#current___"+i).attr("title");
					        if(status=="未读") status="已读";
					        else if(status="已读") status="未读";
					        var url2="${pageContext.request.contextPath}/servlet/UpdateZan";
					        var args={
					        		"zan_id" : zan_id,
					        		"status":status,
									"time" : new Date()
					        }
					        $.ajaxSettings.async = false; 
					        $.get(url2, args,
									function(data) {
					        	
					        	if(status=="已读"){
				    
						        	$("#current___"+i).attr("src","${pageContext.request.contextPath}/image/read.png");
						        	$("#current___"+i).attr("title","已读");
						        	var new_content=$("#all_result").find("#current____"+i).clone();
						        	//删除未读信息列表里的
						        	$("#all_result").find("#current____"+i).remove();
						        	//删除未读信息列表里的
						        	$("#hiddenresult").find("#current____"+i).remove();
						        	$("#hiddenresult2").find("#information_table").append(new_content);
					        	}
					        	else{
					        		
					        		$("#current___"+i).attr("src","${pageContext.request.contextPath}/image/unread.png");
						        	$("#current___"+i).attr("title","未读");
						        	var new_content=$("#all_result").find("#current____"+i).clone();
						        	//删除已读信息列表里的
						        	$("#all_result").find("#current____"+i).remove();
						        	//删除已读信息列表里的
						        	$("#hiddenresult2").find("#current____"+i).remove();
						        	$("#hiddenresult").find("#information_table").append(new_content);
						        	
					        	}
							}); 
					       
					        $.ajaxSettings.async = true; 
					    }  
					});
			
		})
		</script>
</body>
</html>
