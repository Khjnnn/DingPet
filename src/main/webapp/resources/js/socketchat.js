$(document).ready(function(){

	var loggedInId = '${customers.member_id}';
	var page = $('#page').val();
	var perPageNum = $('#perPageNum').val();

	//친구 목록 가져오기 function
	function getFriendList(loggedInId) {
		var memData = loggedInId;		
		$.ajax({
			type: "post",
			async: true,
			url: "/chat/getFriendList",
			data: memData,
			contentType: 'application/json',
			success: function(data) {
						appendFriendList(data);
					},
			error: function(data) {
						console.log("fail");
					}
		});	// ajax end
	}

	function appendFriendList(data) {	// 가져온 친구 목록 화면에 보여주기 function
		var last_classId = '';
		var str = '';
				
		for(var i = 0 ; i < data.length ; i++) {	
			if(i == 0 ) {	// 첫번째는 ul li 닫는 태그가 안들어감 
				last_classId = data[i].openclassId;
				str += '<li class="treeview"><a href="#"><i class="fa fa-book"></i><span>'
					+ data[i].openclassName + '</span></a><ul class="treeview-menu">'
					+ '<li><div><i class="fa fa-circle-o" val="'+ data[i].memNum +'"></i>'
					+ data[i].memName + '</div></li>';
			} else if(last_classId != data[i].openclassId) {	// class가 달라지는 지점
				last_classId = data[i].openclassId;
				str += '</ul></li><li class="treeview"><a href="#"><i class="fa fa-book"></i><span>'
					+ data[i].openclassName + '</span></a><ul class="treeview-menu">'
					+ '<li><div><i class="fa fa-circle-o" val="'+ data[i].memNum +'"></i>'
					+ data[i].memName + '</div></li>';
			} else{
				str += '<li><div><i class="fa fa-circle-o" val="'+ data[i].memNum +'"></i>'
					+ data[i].memName + '</div></li>';
			}	
		}
		str += '</ul></li>';
		friendList.append(str);
		
		$('.treeview-menu>li>div').click(function(event) {
			$(event.target).children().toggleClass("fa-circle-o");
			$(event.target).children().toggleClass("fa-check");
		});
	}

	$(function () {
        var chatBox = $('.box');
        var messageInput = $('input[name="msg"]');
        var roomNo = $('.content').data('room-no');
        var member = $('.content').data('member');
        var sock = new SockJS("/endpoint");
        var client = Stomp.over(sock);
        
        function sendmsg(){
        	var message = messageInput.val();
            if(message == ""){
            	return false;
            }
            client.send('/app/'+ roomNo, {}, JSON.stringify({
            	message: message, writer: member
            	}
            ));
            
            messageInput.val('');
        }
        
        client.connect({}, function () {
        	// 여기는 입장시
        	client.send('/app/join/'+ roomNo , {}, JSON.stringify({ writer: member})); 
//           일반메세지 들어오는곳         
            client.subscribe('/subscribe/chat/' + roomNo, function (chat) {
                var content = JSON.parse(chat.body);
                
                if(content.messageType == ""){
                	
                	chatBox.append("<li>" + content.writer + " :  <br/>" + content.message + "</li>").append('<span>' + "[보낸 시간]" + content.chatdate + "</span>" + "<br>");
                	  
                }else{
                	$('.user ul').empty();
                	
                	chatBox.append("<li>" + content.messageType + " :  <br/>" + content.message + "</li>").append('<span>' + "[보낸 시간]" + content.chatdate + "</span>" + "<br>");
                	
                	var members = content.memberList.split(",");
                	
	            	for(var i = 0; i < members.length - 1; i++){
	                	if(i == 0){
	                		$('.user ul').append('<li>' + members[i] + '<span> [ 방장 ] </span>' + '</li>');
	                	}else{
	                		$('.user ul').append('<li>' + members[i] + '</li>');
	                	}
	            		
	            	
	            	}
	            	
                }
                
                $(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);

            });
            
        });
//         대화시
        $('.send').click(function () {
            sendmsg();
        });
        
//        나가기
        $('.roomOut').click(function(){
         
            if(member != null){
               $.ajax({
                  type : "get",
                  url : "/memberOut",
                  data :  {
                      userId : $('.roomOut').val(),
                      roomNo : roomNo
                   },// para 1/ -1
            
                  success:function(data){
                	  alert(data);
                     if(data == -1){
                    	 viewList();
                     }else{
                    	 viewList();
                     }
                     
                  }// success
               });// ajax
               
            }
     });// click
      

	function closeConnection () {
	    sock.close();
	}

	function viewList(){
	
		alert('viewList');
		var url = "/chat/chatList?page=" + page + "&perPageNum=" + perPageNum;
		location.replace(url);
	}



	$(document).keydown(function(e) {
		key = (e) ? e.keyCode : event.keyCode;
	     
	    if (key == 116 || (key == 17 && key == 82) || ((key == 17 && key == 116))) {
	        if (e) {
	            e.preventDefault();
	           var conf = confirm('해당 페이지를 벗어나시겠습니까?');
	           if(conf){
	        	   viewList();
	           }else{
	        	   return false;
	           }
	           
	        }else {
	            event.keyCode = 0;
	            event.returnValue = false;
	        }
	    }else if(key == 13){
	    	sendmsg();
	    }
	   
	});

	history.pushState(null, document.title, location.href); 
	window.addEventListener('popstate', function(event) { 
		
		history.pushState(null, null, null); 
		viewList();
	});


	window.onbeforeunload = function() {
	
		var dat;
	
		$.ajax({
				url : "/memberOut",
				cache : "false", //캐시사용금지
				method : "get",
				data : { 
					userId: $('.roomOut').val(),
					roomNo: $('.content').data('room-no')
				},
				dataType: "html",
				async : false, //동기화설정(비동기화사용안함)
				
				success:function(args){ 
					dat = args;
					location.replace("/chat/chatList?page=" + page + "&perPageNum=" + perPageNum);	
				},   
		
				error:function(e){  
					alert(e.responseText);  
				}
	
		 });	
		
		 if(dat != 1){// 방 삭제가 안됐을 때만 send
			 client.send('/app/out/' + roomNo , {}, JSON.stringify({ writer: member}));
		 }
		 
		}
	
	});



});

function isOwner(roomNo, userId){
	alert(roomNo + userId);
	 $.ajax ({
	       type:'get',
	       url:'/isOwner',
	       data: {
	    	   roomNo : roomNo,
	    	   member : userId
	    	   },
	    	   
	       success:function(data) {
	          if (data == 1) {
	             updatePw(roomNo);
	          } else {
	             alert('방장 권한이 없습니다');
	             return false;
          }   
       }
    });

}
