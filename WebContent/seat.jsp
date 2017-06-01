<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자리선택</title>
<link rel="stylesheet" type="text/css" href="css/seat.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	
	// 시간 변경 시 좌석 새로고침
	$("#selDate").on("change", function(){
		
		clearSeat();
		
		if($(this).val() != ""){
			initSeat();
		}
	});
	
	$(".theater").on("click", ".fillSeat", function(){
		$(this).removeClass("fillSeat").addClass("selectedSeat");
		var seatName = $(this).attr("name");
		var seatXY = seatName.split("$");
		var displayText = "1층 - " + seatXY[0] + "열 - " + seatXY[1];
		
		$(".info3").append("<p name=\"" + seatName + "\">" + displayText + "</p>");
		
	});
	
	$(".theater").on("click", ".selectedSeat", function(){
		$(this).removeClass("selectedSeat").addClass("fillSeat");
		var seatName = $(this).attr("name");
		
		$(".info3").find("p[name='" + seatName + "']").remove();
	});
	
	// 좌석 초기화
	function clearSeat(){
		$(".theater").children(".fillSeat, .selectedSeat").remove();
	}
	
	// 랜덤으로 좌석 출력
	function initSeat(){
		var seatArray = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
						 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
		var seatIndex = ['A', 'B', 'C', '1', '2', '3', '4', '5', '6', '7'];
		
		var xIndex = 0;
		var yIndex = 1;
		
		// 랜덤 좌석수 (0 ~ 10)
		var seatCnt = Math.floor(Math.random() * 11);
		
		for(var seat = 0 ; seat < seatCnt ; seat++){
			// 랜덤 x좌표  (0 ~ 14)
			var ranX = Math.floor(Math.random() * 15);
			// 랜덤 y좌표  (0 ~ 9)
			var ranY = Math.floor(Math.random() * 10);
			
			seatArray[ranY][ranX] = 1;
		}
		
		
		for(var j = 0 ; j <10 ; j++){
			for(var i = 0 ; i < 14 ; i++){
	
				var clsName = "fillSeat";
				var seatName = seatIndex[j] + "$" + (i+1) + "";
				
				if(i % 2 == 0){
					xIndex += 11;
				}else{
					xIndex += 10;
				}
				
				if(seatArray[j][i] == 1){
					$(".theater").append("<div class=\"" + clsName + "\" name=\"" + seatName + "\" style=\"left:" + xIndex + "px; top:" + yIndex+ "px;\"></div>");
				}
			}
			xIndex = 0;
			
			if(j % 2 == 0){
				yIndex += 10;
			}else{
				yIndex += 11;
			}
		}
	}
	
});
</script>

</head>
<body>
<div id="popup">
	<div id="top">
		<select id="selDate">
			<option value="">시간선택</option>
			<option value="1">14:00</option>
			<option value="2">18:00</option>
		</select>
	</div>
	<div id="contents">
		<div class="theater">
		</div>
	</div>
	<div id="info">
		<div class="info1"></div>
		<div class="info2"></div>
		<div class="info3"></div>
		<div class="btnArea">
			<a id="btnFinish"></a>
			<a id="btnPrev"></a>
			<a id="btnReset"></a>
		</div>
	</div>
</div>
</body>
</html>