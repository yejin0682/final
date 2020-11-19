<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
	<div style="width: 700px; height: 700px;">
	<canvas id="myChart"></canvas>
	</div>
<script>
	var data1 = new Array();
	var max1 = new Array();
	var step1 = new Array();
	var min1 = new Array();
	var labels1 = new Array();
	var backColor = new Array();
<c:forEach var="list" items="${list}">
	data1.push(${list.getMyprice()});
	max1.push(${list.getBestmoney()});
	step1.push(${list.getMoneyup()});
	min1.push(${list.getStartmoney()});
	labels1.push('${list.getBuydate()}');
	backColor.push('#6B66FF');
</c:forEach>

	
$(document).ready(function(){
	const ctx = $('#myChart');
	//첫번째 인자는 내 태그(선택자), 두번째 인자는 옵션
	const myChart = new Chart(ctx, {
		type: 'line',
		data : {
			datasets : [{
				label : "날짜별 응찰 가격", 
				backgroundColor : backColor,	
				borderColor : ['#FF0000'],
				data : data1,
				fill : false,
			}],
			labels: labels1
		},
		options :{
			scales :{
				yAxes: [{
					 ticks : { max: max1, stepSize: step1, min:min1 },	// 차트의 최대치와 최소치
				}]
			}
		}
	})
});
</script>
</body>
</html>