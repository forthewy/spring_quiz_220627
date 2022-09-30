<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/lesson05/quiz05.css">
</head>
<body>
	<div class="container">
		<div class="d-flex" id="navContents">
			<nav class="col-2 bg-primary text-white">
				<div>
					<img src="/img/weatherService.png" width="170px" height="60px" alt="기상청로고">
				</div>
				<ul class="nav flex-column">
					<li class="nav-item">날씨</li>
					<li class="nav-item"><a href="/lesson05/add_weather_view">날씨 입력</a></li>
					<li class="nav-item">테마 날씨</li>
					<li class="nav-item">관측 기후</li>
				</ul>
			</nav>
			<section class="col-10 bg-success">
					<h1>과거 날씨</h1>
					<table class="table">
						<thead>
							<tr>
								<th>날짜</th>
								<th>날씨</th>
								<th>기온</th>
								<th>강수량</th>
								<th>미세먼지</th>
								<th>풍속</th>
							</tr>
						</thead>
						<tbody>
						
						</tbody>
					</table>
				</section>
		</div>
		<footer class="secondary text-secondary d-flex">
			<div>
				<img src="/img/weatherService.png" width="170px" height="60px" alt="기상청로고">
			</div>
			<div>
				<span>
					(07062) 서울시 동작구 여의대방로16길 61<br>
					Copyright@2020 KMA. All Rights RESERVED.
				</span>
			</div>
		</footer>
	</div>
</body>
</html>