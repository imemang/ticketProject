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
	
	initSeat();
	
	function initSeat(){
		var seatArray = [1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1];
		var xIndex = 0;
		var yIndex = 1;
		
		for(var i = 0; i < 14 ; i++){

			var clsName = "fillSeat";
			
			if(i % 2 == 0){
				xIndex += 11;
			}else{
				xIndex += 10;
			}
			
			if(seatArray[i] == 1){
				$(".theater").append("<div class=\"" + clsName +"\" style=\"left:" + xIndex + "px;\"></div>");
			}
		}
	}
	
});
</script>

</head>
<body>

<div class="theater">
	
</div>

</body>
</html>