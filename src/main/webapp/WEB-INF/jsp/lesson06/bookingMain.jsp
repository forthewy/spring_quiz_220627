<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		<div class="banner bg-danger">
			<img id="bannerImg" src="/img/test06_banner1.jpg" height="300px" class="w-100">
		</div>
		<div class="info d-flex">
			<div class="col-4 bg-brown">
				<div class="info-text display-4 text-white text-center">
					실시간<br>
					예약하기
				</div>
			</div>
			<div class="col-4 bg-lightbrown text-white pt-3">
				<h2>예약 확인</h2>
				<div class="form-group d-flex justify-content-end">
					<label>이름:</label>
					<input type="text" id="name" class="form-control col-8 ml-3">
				</div>
				<div class="form-group  d-flex justify-content-end">
					<label>전화번호:</label>
					<input type="text" id="phoneNumber" class="form-control col-8 ml-3">
				</div>	
				<div class="d-flex justify-content-end">	
				<button type="button" class="btn btn-success" id="searchBtn">조회하기</button>
				</div>
			</div>
			<div class="col-4 bg-brown text-white d-flex justify-content-center align-items-center">
				<div>
					<h3>예약문의:</h3>
					<h1>
						010-<br>
						0000-1111
					</h1>
				</div>
			</div>
		</div>
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
			$('#phoneNumber').on('blur', function(e) {
					$('#phoneNumber').val($('#phoneNumber').val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-"));
				});
			
			let imgArr = ['banner1.jpg', 'banner2.jpg', 'banner3.jpg', 'banner4.jpg']
			let index = 0;
			setInterval(function() {
				$('#bannerImg').attr('src', '/img/test06_' + imgArr[index]);
				index++;
				if (index == imgArr.length){ // 안전하게 쓰기 위해 <= 로 쓴다.
					index = 0;
				}
			}, 2000);
			
			$('#searchBtn').on('click', function(){
				let name = $('#name').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();
				
				
				if (name == "") {
					alert("이름을 입력하세요");
					return;
				}
				if (phoneNumber.length < 1) {
					alert("전화번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"GET"
					, data:{"name":name,"phoneNumber":phoneNumber}
					, url:"/lesson06/quiz03/searchReserve"
					, success:function(data) {
						if (data.code == 200) {
							 for (let i = 0; i < data.booking.length; i++) {
								 alert("이름: " + data.booking[i].name 
										 + "\n날짜: " + data.booking[i].date.substring(0,10) // JSON에서 잘담아가도록 properties에 설정해주기
										 + "\n일수: " + data.booking[i].day
										 + "\n인원: " + data.booking[i].headcount
										 + "\n상태: " + data.booking[i].state 
										);
							 }
							
							/* 
							alert("이름: " + data.booking.name
								+ "\n날짜: " + (data.booking.date).substring(0,10)
								+ "\n일수: " + data.booking.day
								+ "\n인원: " + data.booking.headcount
								+ "\n상태: " + data.booking.state 
							);*/
						} else {
							alert(data.errorMessage);
						}
					}
					,error:function(e) {
						alert("조회에 실패하였습니다 관리자에게 문의하여주세요");
					}
				});
			});
		});
	</script>
</body>
</html>