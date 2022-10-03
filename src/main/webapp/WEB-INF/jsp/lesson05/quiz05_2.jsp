<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/lesson05/quiz05.css">
</head>
<body>
	<div class="container">
		<div class="d-flex" id="navContents">
			<nav class="bg-primary text-white p-0 col-2">
				<img src="/img/weatherService.png" height="80px" alt="기상청로고" >
				<ul class="nav flex-column">
					<li class="nav-item pb-2 pt-3 pl-3"><a href="/lesson05/quiz05/show_weather_view">날씨</a></li>
					<li class="nav-item pb-2 pl-3"><a href="/lesson05/quiz05/add_weather_view">날씨 입력</a></li>
					<li class="nav-item pb-2 pl-3">테마 날씨</li>
					<li class="nav-item pb-2 pl-3">관측 기후</li>
				</ul>
			</nav>
			<section class="col-10 ml-3 mt-3">
					<h3><b>날씨 입력</b></h3>
					<form method="post" action="/lesson05/quiz05/after_add_weather">
						<div class="d-flex justify-content-between">
							<div class="form-group d-flex">
								<label for="date">날짜</label>
								<input type="text" name="date" id="date" class="form-control">
							</div>
							<div class="form-group d-flex">
								<label for="weather">날씨</label>
								<select name="weather" id="weather" class="form-control">
									<option>맑음</option>
									<option>구름조금</option>
									<option>흐림</option>
									<option>비</option>
								</select>
							</div>
							<div class="form-group d-flex">
								<label for="microDust">미세먼지</label>
								<select name="microDust" class="form-control" id="microDust">
									<option>보통</option>
									<option>좋음</option>
									<option>나쁨</option>
									<option>최악</option>
								</select>
							</div>
						</div>
						<div class="d-flex justify-content-between mt-3">
							<div class="form-group">
								<div class="input-group align-items-center">
									<label for="temperatures">기온</label>
									<input type="text" name="temperatures" id="temperatures" class="form-control">
									<div class="input-group-append">
	    								<span class="input-group-text">ºC</span>
	 								</div>
								</div>
							</div>
							<div class="form-group">
								<div class="input-group align-items-center">
									<label for="precipitation">강수량</label>
									<input type="text" name="precipitation" id="precipitation" class="form-control">
									<div class="input-group-append">
	    								<span class="input-group-text">mm</span>
	 								</div>
	 							</div>
							</div>
							<div class="form-group">
								<div class="input-group align-items-center">
									<label for="windSpeed">풍속</label>
									<input type="text" name="windSpeed" id="windSpeed" class="form-control">
									<div class="input-group-append">
	    								<span class="input-group-text">km/h</span>
	 								</div>
	 							</div>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<input type="submit" class="btn btn-success" value="저장">
						</div>
					</form>
			</section>
		</div>
		<footer class="secondary text-secondary d-flex">
			<div class="col-2">
				<img src="/img/weatherService.png" width="170px" height="60px" alt="기상청로고">
			</div>
			<div class="pl-5">
				<span>
					(07062) 서울시 동작구 여의대방로16길 61<br>
					Copyright@2020 KMA. All Rights RESERVED.
				</span>
			</div>
		</footer>
	</div>
	<script>
		$(document).ready(function(){
			$.datepicker.setDefaults({
				dateFormat: 'yy-mm-dd'
			})
			$('#date').datepicker();
		});
	</script>
</body>
</html>