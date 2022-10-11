<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  jquery : ajax, datepicker, bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/lesson06/quiz03.css">

</head>
<body>
	<div class="container">
		<header class="text-center pt-3">
			<h1>통나무 팬션</h1>
		</header>
		<nav class="bg-lightbrown">
			<ul class="nav nav-fill">
				<li class="nav-item">
					<a class="nav-link" href="/lesson06/quiz03/3">팬션 소개</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">객실 보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/lesson06/quiz03/2">예약하기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/lesson06/quiz03/1">예약목록</a>
				</li>
			</ul>
		</nav>
		<section class="d-flex justify-content-center">
			<div class="col-6 mt-3">
				<h1 class="text-center"><b>예약하기</b></h1>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" id="name" class="form-control">
				</div>
				<div class="form-group">
					<label for="date">예약날짜</label>
					<input type="text" id="date" class="form-control">
				</div>
				<div class="form-group">
					<label for="day">숙박일수</label>
					<input type="text" id="day" class="form-control">
				</div>
				<div class="form-group">
					<label for="headcount">숙박인원</label>
					<input type="text" id="headcount" class="form-control">
				</div>
				<div class="form-group">
					<label for="phoneNumber">전화번호</label>
					<input type="text" id="phoneNumber" class="form-control">
				</div>
				<div class="d-flex justify-content-center">
					<button type="button" id="bookingBtn" class="btn btn-warning form-control">예약하기</button>
				</div>
			</div>
		</section>
		<footer class="text-secondary">
			<small>
				제주특별자치도 제주시 애월읍<br>
				사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표: 김통목<br>
				Copyright 2025 tongnamu. All right reserved
			</small>
		</footer>
	</div>
	<script>
		$(document).ready(function() {
			$.datepicker.setDefaults({
				dateFormat: 'yy-mm-dd'
			});
			$('#date').datepicker();
			// $('input[name=date]').datepicker({
			// 		dateFormat: 'yy-mm-dd'
			//		, mindate: 0 //오늘보다 뒤 선택
			//}) ;
			//<== 만약 date input 에 name="date"를 넣었다면.
			
			$('#phoneNumber').on('blur', function(e) {
				$('#phoneNumber').val($('#phoneNumber').val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-"));
			});
			
			$('#bookingBtn').on('click', function(e){
				//alert("예약버튼을 눌렀습니다");
				let name = $('#name').val().trim();
				if (name.length < 1) {
					alert("이름을 입력해주세요");
					return;
				}
				let day = $('#day').val().trim();
				if (day.length < 1) {
					alert("숙박일수를 입력해주세요");
					return;
				} else if(isNaN(day)) {
					alert("숙박일수는 숫자만 입력해주세요");
					return;
				} else if (day < 1) {
					alert("숙박일수는 0보다 큰 숫자를 입력해주세요");
					return;
				}
				let headcount = $('#headcount').val().trim();
				if (headcount.length < 1) {
					alert("숙박인원을 입력해주세요");
					return;
				} else if(isNaN(headcount)) {
					alert("숙박인원은 숫자만 입력해주세요");
					return;
				} else if (headcount < 1) {
					alert("숙박인원은 0보다 큰 숫자를 입력해주세요");
					return;
				}
				let phoneNumber = $('#phoneNumber').val().trim();
				if (phoneNumber.length < 1) {
					alert("전화번호를 입력해주세요");
					return;
				} 
				let date = $('#date').val();
				
				
				$.ajax({
					type:"POST"
					,url:"/lesson06/quiz03/add_booking"
					,data:{"name":name,"date":date, "day":day, "headcount":headcount,"phoneNumber":phoneNumber}
					,success: function(data) {
						if(data.code == 200) {
							alert(data.message);
							location.href ="/lesson06/quiz03/3";
						} else {
							alert(data.errorMessage);
						}
					}
					,error:function(e) {
						alert("등록 실패!" + e);
					}
				});
			});
		});
	</script>
</body>
</html>