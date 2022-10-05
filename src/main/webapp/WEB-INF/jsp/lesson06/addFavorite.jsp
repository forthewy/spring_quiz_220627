<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 추가</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<%-- datepicker를 위해 slim 버전이 아닌 jquery를 import한다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		<div method="post" action="lesson06/quiz01/add_favorite">
			<label for="name">제목</label>
			<%-- 이제 name은 필요 없음 --%>
			<input type="text" id="name" class="form-control">	
			<label for="url">주소</label>
			<input type="text" id="url" class="form-control">	
			<button type="button" id="addBtn" class="btn btn-success form-control mt-3">추가</button>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#addBtn').on('click', function(e) {
				//alert('안녕하세요');
				let name = $('#name').val().trim();
				if (name.length < 1) {
					alert("제목을 입력하세요");
					return;
				}
				let url = $('#url').val().trim();
				if (url.length < 1) {
					alert("주소를 입력하세요");
					return;
				}
				if (!url.startsWith('https') && !url.startsWith('http')) {
					alert("주소형식이 잘못되었습니다");
					return;
				}
				<%-- ajax 는 늘 url을 api를 써야함. 뷰로 할수 없음.. AJAX를 관제시스템으로 본다 --%>
				<%-- 절대주소는 꼭 앞에 / 써주기!!!! --%>
				$.ajax({
					// request
					type:"POST"
					, url:"/lesson06/quiz01/add_favorite" 
					, data: {"name":name, "url":url}
				
					// responsse 
					, success: function(data) {	// data 파라미터는 요청에 대한 응답값이다.
						if (data == "success") {
							location.href = "/lesson06/quiz01/get_favorite_view";
						} else {
							alert("입력 실패");
						}
					}
					, error: function(e) { // request, status,error 로 받아서 찍어볼수도 있다
						alert("에러" + e);
					}
				})
			});
		});
	</script>
</body>
</html>