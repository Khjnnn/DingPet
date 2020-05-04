<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@include file="./includes/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>Chat Page</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="${contextPath}/sockjs/sockjs.min.js"></script>
<script src="${contextPath}/js/socketchat.js"></script>
<style type="text/css">
	*{
		font-family: 나눔고딕;
	}
	#messageWindow{
		background: black;
		color: greenyellow;
	}
	#inputMessage{
		width:500px;
		height:20px
	}
	#btn-submit{
		background: white;
		background: #F7E600;
		width:60px;
		height:30px;
		color:#607080;
		border:none;
	}
	
	#main-container{
		width:600px;
		height:680px;
		border:1px solid black;
		margin:10px;
		display: inline-block;
		
	}
	#chat-container{
		vertical-align: bottom;
		border: 1px solid black;
		margin:10px;
		min-height: 600px;
		max-height: 600px;
		overflow: scroll;
		overflow-x:hidden;
		background: #9bbbd4;
	}
	
	.chat{
		font-size: 20px;
		color:black;
		margin: 5px;
		min-height: 20px;
		padding: 5px;
		min-width: 50px;
		text-align: left;
        height:auto;
        word-break : break-all;
        background: #ffffff;
        width:auto;
        display:inline-block;
        border-radius: 10px 10px 10px 10px;
	}
	
	.notice{
		color:#607080;
		font-weight: bold;
		border : none;
		text-align: center;
		background-color: #9bbbd4;
		display: block;
	}

	.my-chat{
		text-align: right;
		background: #F7E600;
		border-radius: 10px 10px 10px 10px;
	}
	
	#bottom-container{
		margin:10px;
	}
	
	.chat-info{
		color:#556677;
		font-size: 10px;
		text-align: right;
		padding: 5px;
		padding-top: 0px;

	}
	
	.chat-box{
		text-align:left;
	}
	.my-chat-box{
		text-align: right;
	}
	
	
	
</style>
</head>
<body>
<script type="text/javascript">

</script>
<section class="site-blocks-cover overflow-hidden bg-light">
      <div class="container">
      <div class="col-md-3">
				<div class="box box-warning">
					<div class="box-header with-border">
						<h3 class="box-title">친구 목록</h3>
					</div>
					<!-- /.box-header -->

					<div class="box-body">
						<ul class="tree" data-widget="tree" id='friendList'>
					        
					    </ul>
					</div>
					
					<div class="box-footer">
			          <button class="btn btn-block btn-warning" id="btn_makeChat">채팅방 만들기</button>
			        </div>
			        <!-- /.box-footer -->

				</div>
         <div class="row">
          	<div class="col-md-7 align-self-center text-center text-md-left">
				<div id="chat-container">
			
				</div>
				<div id="bottom-container">
					<input id="inputMessage" type="text">
					<input id="btn-submit" type="submit" value="전송" >
					<input type="button" id="enterBtn" value="입장">
					<input type="button" id="exitBtn" value="나가기">
				</div>
			</div>
		</div>
	</div>
</section>
</body>
	
<%@include file="./includes/footer.jsp"%>
</html>