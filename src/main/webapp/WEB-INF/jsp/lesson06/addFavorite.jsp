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
			<div class="form-group">
				<label for="name">제목</label>
				<input type="text" id="name" class="form-control">
			</div>
			<%-- 이제 name은 필요 없음 --%>
			<div class="form-group">
				<label for="url">주소</label>
				<div class="d-flex">
					<input type="text" id="url" class="form-control">
					<button type="button" id="addressCheckBtn" class="btn btn-info ml-3">중복 확인</button>
				</div>
				<small id="isDuplicationText" class="text-danger d-none">중복된 주소입니다</small>
				<small id="availableText" class="text-success d-none">저장가능한 주소입니다</small>
			</div>
			<button type="button" id="addBtn" class="btn btn-success form-control mt-3">추가</button>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#addBtn').on('click', function(e) {
				//alert('안녕하세요');
				e.preventDefault();
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
				
				// 중복 확인 완료 확인
				if ($('#availableText').hasClass('d-none')) { // d - none 이 있으면 확인 안된것.
					alert("중복된 url입니다. 중복확인을 해주세요");
					return;
				}
				
				//if (!url.startsWith('https') && !url.startsWith('http')) {
				//	alert("주소형식이 잘못되었습니다");
				//	return;
				//}
				<%-- ajax 는 늘 url을 api를 써야함. 뷰로 할수 없음.. AJAX를 관제시스템으로 본다 --%>
				<%-- 절대주소는 꼭 앞에 / 써주기!!!! --%>
				$.ajax({
					// request
					type:"POST"
					, url:"/lesson06/quiz01/add_favorite" 
					, data: {"name":name, "url":url}
				
					// responsse 
					, success: function(data) {	// data 파라미터는 요청에 대한 응답값이다.
							if (data == "성공") {
								location.href = "/lesson06/quiz01/get_favorite_view";
							} else {
								alert("입력 실패");
							}
						}
					, error: function(e) { // request, status,error 로 받아서 찍어볼수도 있다
						alert("에러" + e);
					}
				});
			});
			
			
			$('#addressCheckBtn').on('click', function() {
				let url = $('#url').val().trim();
				
				// url 중복확인
				if(url == "") {
					alert('확인할 url을 입력하세요');
					return;
				}
				
				// 중복검사 db
				$.ajax({
					// request
					type:"POST" // 혹시 url이 길수도 있다
					,url:"/lesson06/quiz02/duplicate_check"
					,data: {"url":url}
					
				
					,success:function(data) { //json => object 화 (jquery ajax 함수가 파싱해줌)
						if (data.is_duplicate){
							//중복
							$('#isDuplicationText').removeClass('d-none');
							$('#availableText').addClass('d-none');
						} else {
							// 사용가능
							$('#availableText').removeClass('d-none');
							$('#isDuplicationText').addClass('d-none');
						}
					}
					,error:function(e) {
						alert("중복확인에 실패했습니다. 관리자에게 문의해주세요");
					}
				});
			});
		});
	</script>
</body>
</html>