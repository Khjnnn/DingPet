<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../../includes/header.jsp"%>
<!-- 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/">
 -->
 
<style>

.page-title{
    font-size: 28px;
    font-weight: 600;
    padding-top: 10px;
    padding-bottom: 15px;
    width: 67%;
    left: 75px;
    display: inline-block;
    position: relative;
}

.walkform{
    display: inline-block;
    float: right;
}

.walkbtn{
	background: #fff;
    border: solid 1px #30a430 !important;
    color: #30a430 !important;
    box-shadow: none !important;
}

.info-part1{

	padding: 20px;
}

.title-container{
	padding: 25px 0;
}

.log-container{
	min-height: 15vh;
    border: solid 1px;
    border-color: gray;
    border-radius: 10px;
    margin-top: 3vh;
    margin-bottom: 3vh;
}


.log-time{
    margin: 0;
    padding: 7px 7px;
}

.log-tilte{
    margin: 0px;
    padding: 5px;
}

.log-content-div{
	text-align: center;
    padding-bottom: 15px;
    padding-left: 10px;
    padding-right: 10px;}

.log-content{
    font-size: 13px;
}

.log-pic{
	width: 100%;
	padding: 10px;
}

.map-div{
	width: 94% !important;
	margin: 10px;
}

.walkInfo{
	cursor: pointer;
    background: #fff;
    width: 50px;
    height: 50px;
    border: double 5px indianred;
    border-radius: 25px;
    position: relative;
    top: 80px;
    left: 43%;
    z-index: 9;
}

.walkInfo:hover{
    background: indianred;
    border: double 5px #fff;

}

.walkInfo:hover h2{
    color: #fff;
}

.info-text{
    margin: 0px;
    font-size: 33px;
    color: indianred;
    padding-right: 3px;
    padding-top: 2px;
    font-style: italic;
}
.info-text-hover{
    margin-top: 0px;
    color: indianred;
    font-size: 18px;
}

.walkInfo-detail{
	height: 0px;
}

.info-table{
	width: 25%;
    border: solid 2px indianred;
    border-radius: 11px;
    position: relative;
    display: none;
    left: 33%;
    top: 80px;
    background: #fff;
    z-index: 10;
}

.info-table--td{
	border: none;
	text-align: center;
}

@media screen and (max-width: 770px) {
	
	.main-raised {
	   margin: -10% 3% 7%
	}
	
	.info-part1{
		padding: 0px;
	}
	
	.page-title{
		font-size: 4vw !important;
		left: 0px;
    	width: 100%;
	}
	
	.walkform{
		display: block;
		float: none;
		text-align: center;
		width: 100%;
	}
	.walkbtn{
		width: 88%;
	}
	
}

@media screen and (max-width: 425px) {
	.page-header{
		height: 30vh;
	}
	.page-title{
		font-size: 5vw !important; 
	}
	
	.log-time{
	    font-size: 15px;
	}
	
	
	.walkInfo {
	    width: 40px;
	    height: 40px;
	    border-radius: 20px;
	    top: 80px;
	    left: 39%;
	    z-index: 9;
	}
	
	.info-text{
	    font-size: 25px;
	}
	
	.info-text-hover{
	    margin-top: 7px;
	    color: indianred;
	    font-size: 12px;
    }
    
    .info-table{
	    width: 40%;
	    left: 24%;
	    top: 80px;
    }
    
    .info-table--td{
        padding: 0px;
    }

}


</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!--====  str of contents  ====-->
	<section style="padding-top:87px">
        <div class="page-header header-filter" data-parallax="true" style="background-image: url('/resources/images/bg/re.jpg'); transform: translate3d(0px, 0px, 0px);"></div>
        <div class="main main-raised">
			<div class="profile-content">
				<div class="container pb-5">
						<div class="title-container">
							<div class="text-center heading-section">
								<h2 class="page-title">예약 일지</h2>
								<c:if test="${customers.privilege_id == '01' }">
								<form action="/petsitting/p003/logregister" class="walkform" align="right">
			                       	<input type="hidden" class="reservation_ID" name="reservation_ID" value="${reservation_ID }">
			                       	<input type="submit" class="walkbtn" value='일지 작성'>
								</form>
								</c:if>
							</div>
	                    </div>
	                   	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78d603c9ceea19aeba68479415b917d4"></script>
						
						<div class="info-part1">
							<div class="info-part1--contents" align="center">
								<input type="hidden" class="register" value=${regitser }>
								<input type="hidden" class="receive_ID" value=${receive_ID }>
								<input type="hidden" class="walkcount" value="${count }">
								<% int i = 0; %>
								<c:forEach var="list" items="${list }" varStatus="statuss">
									<div class="log-container">
										<input type="hidden" class="log_ID" name="log_ID" value="${list.log_ID }">
										<div>
											<h3 class="log-time" align="left"> ${list.log_Date } </h3>
										</div>
										<div>
											<h5 class="log-tilte">${list.log_Title }</h5>
										</div>
										<c:if test="${list.log_Type == 'nomal'}">
											<c:if test="${list.log_Photo != null}">
												<div>
													<img class="log-pic" src="https://www.dingpet.shop/img/${list.log_Photo }">
												</div>
											</c:if>
											<div class="log-content-div">
												<small class="log-content">${list.log_Content }</small>
											</div>
										</c:if>
										<c:if test="${list.log_Type == 'walk' }">
											<input type="hidden" class="locationJSON_<%=i %>" value='${list.locationJSON }'>
											<div class="walkInfo"><h2 class="info-text">i</h2></div>
											<div class="walkInfo-detail">
												<table class="info-table">
													<tr>
														<td class="info-table--td"><h4 class="info-text-hover">총 산책 거리</h4></td> 
														<td class="info-table--td"><h4 class="info-text-hover"> : </h4></td>
														<td class="info-table--td"><h4 class="info-text-hover">${list.distance }</h4></td>
													</tr>
													<tr>
														<td class="info-table--td"><h4 class="info-text-hover">산책 시작 시간</h4></td> 
														<td class="info-table--td"><h4 class="info-text-hover"> : </h4></td>
														<td class="info-table--td"><h4 class="info-text-hover">${list.start_Time }</h4></td>													
													</tr>
													<tr>
														<td class="info-table--td"><h4 class="info-text-hover">산책 종료 시간</h4></td> 
														<td class="info-table--td"><h4 class="info-text-hover"> : </h4></td>
														<td class="info-table--td"><h4 class="info-text-hover">${list.end_Time }</h4></td>													
													</tr>
												</table>
											</div>
											
											<div class="map-div" id="map_<%=i++ %>" value="${list.log_ID }" style="width: 100%; height: 350px;"></div>
											
											<c:if test="${list.log_Photo != null}">
												<div>
													<img class="log-pic" src="https://www.dingpet.shop/img/${list.log_Photo }">
												</div>
											</c:if>
											
											<div class="log-content-div">
												<small class="log-content">${list.log_Content }</small>
											</div>
											
										</c:if>
									</div>
								</c:forEach>
								
								<script>
									function map (){
									// ------------------------ 중심 좌표 구하기 ------------------------------
										//var map = new Array();
										var latArr = new Array();	// 위도 담을 배열
										var litArr = new Array();	// 경도 담을 배열
										var minLat = '';			// 위도 중 제일 작은 값
										var maxLat = '';			// 위도 중 제일 큰 값
										var minLit = '';			// 경도 중 제일 작은 값
										var maxLit = '';			// 경도 중 제일 큰 값
		
										var count = $(".walkcount").val();
										var logID = '';
										for(var i=0; i<count; i++){
											latArr = [];
											litArr = [];
											var strJSON = $(".locationJSON_"+i).val();	// JSON 문자열 가져오기
											var jsonOb = '';
											console.log("???????????????????"+strJSON);
											var jsonparse = JSON.parse(strJSON);		// JSON문자열 파싱
											
											for(var j=0; j<jsonparse.count; j++){
												jsonOb = jsonparse['location_'+j];		// JSON안의 객체 가져오기
											
												latArr.push(jsonOb.lat);				// 위도들 배열에 담기
												litArr.push(jsonOb.lit);				// 경도들 배열에 담기
											}
											latArr.sort();		// 정렬
											litArr.sort();		// 정렬
											
											minLat = latArr[0];
											minLit = litArr[0];
											maxLat = latArr[latArr.length-1];
											maxLit = litArr[litArr.length-1];
											
											var centerLat = parseFloat(minLat) + ((maxLat - minLat) / 2);	// 위도 중심좌표 구하기
											var centerLit = parseFloat(minLit) + ((maxLit - minLit) / 2);	// 경도 중심좌표 구하기
		
										// ---------------------------------------------------------------------									
											
								      		logID = "map_";
								      		logID += i;
									  		var mapContainer = document.getElementById("map_"+i) // 지도를 표시할 div
									  		mapOption = {
									  		center : new kakao.maps.LatLng(centerLat, centerLit), // 지도의 중심좌표
									  		level : 5		// 지도의 확대 레벨
									  		};
									  		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
									  		
									  		
									  		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
									  		var linePath = new Array();
									  		
									  		for(var k=0; k<jsonparse.count; k++){
									  			linePath.push(new kakao.maps.LatLng(jsonparse['location_'+k].lat, jsonparse['location_'+k].lit));
									  		}
		
									  		// 지도에 표시할 선을 생성합니다
									  		var polyline = new kakao.maps.Polyline({
									  			path : linePath,			// 선을 구성하는 좌표배열 입니다
									  			strokeWeight : 5,			// 선의 두께 입니다
									  			strokeColor : '#37c5be',	// 선의 색깔입니다
									  			strokeOpacity : 0.7,		// 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
									  			strokeStyle : 'solid'		// 선의 스타일입니다
									  		});
		
									  		// 지도에 선을 표시합니다
									  		polyline.setMap(map);
										}
									}
									
							    </script>
								
								<script>map()</script>
							
							</div>
						</div>						
					</form>
				</div>
			</div>
		</div>
	</section>


    <!--====  end of contents  ====--> 
<%@include file="../../includes/footer.jsp"%>
	<script>

		setTimeout(function() {
			if($(".register").val()=='Y'){
				formnotice();
			}
		}, 500);
				
		
		function formnotice(){
			
			var noticeData = {
				"notice_Type" : "일지",						// 알림 유형(예약, 유기견찾기, 유기견보호)
				"member_ID" : $(".receive_ID").val(),		// 받는 사람의 아이디
				"sender_ID" : $(".member_ID").val(),		// 보내는 사람의 아이디
	/*알림내용*/	"notice_Contents" : "새로운 일지가 등록 되었습니다.",
				"url" : "petsitting/p003/loglookup?reservation_ID=" + $(".reservation_ID").val()	// 알림 메시지 클릭 시 이동할 매핑주소
			}
			console.log(noticeData)
			//스크랩 알림 DB저장
			$.ajax({
				type : 'post',
				url : '/common/notice/setNotice',		// 알림 데이터 디비에 삽입하는 곳으로 매핑
				data : noticeData,
				dataType : 'json',
				async: false,
				success : function(data){
					if(socket){		// 열려있는 소켓이 있으면
						// websocket에 보내기 (reserved, 보내는사람, 받는사람, 예약번호)
						let socketMsg = "reserved,"+ $(".member_ID").val()+","+$(".receive_ID").val()+","+"20938123";
						socket.send(socketMsg);				// 실시간 알림 메시지 전송
					}
				},
				error : function(err){
					console.log(err);
				}
			});
		}
		
		$(".walkInfo").on('mouseover', function(){
			$(".info-table").toggle();
		})
		
		$(".walkInfo").on('mouseout', function(){
			$(".info-table").toggle();
		})
</script>