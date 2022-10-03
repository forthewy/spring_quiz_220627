<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<nav class="col-2 bg-primary text-white p-0">
				<img src="/img/weatherService.png" height="80px" alt="기상청로고">
				<ul class="nav flex-column">
					<li class="nav-item pb-2 pt-3 pl-3"><a href="/lesson05/quiz05/show_weather_view">날씨</a></li>
					<li class="nav-item pb-2 pl-3"><a href="/lesson05/quiz05/add_weather_view">날씨 입력</a></li>
					<li class="nav-item pb-2 pl-3">테마 날씨</li>
					<li class="nav-item pb-2 pl-3">관측 기후</li>
				</ul>
			</nav>
			<section class="col-10 ml-3 mt-3">
				<h3><b>과거 날씨</b></h3>
				<table class="table text-center">
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
						<c:forEach items="${weatherHistory}" var="weather">
							<tr>
								<td>
									<fmt:parseDate var="date" value="${weather.date}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${date}" pattern="yyyy년 M월 d일"/>
								</td>
								<td>
									<c:set var="weatherName">
										<c:choose>
											<c:when test="${weather.weather eq '맑음'}">
												sunny
											</c:when>
											<c:when test="${weather.weather eq '구름조금'}">
												partlyCloudy
											</c:when>
											<c:when test="${weather.weather eq '흐림'}">
												cloudy
											</c:when>
											<c:when test="${weather.weather eq '비'}">
												rainy
											</c:when>									
										</c:choose>
									</c:set>
									<img src="/img/${weatherName}.jpg" alt="날씨 그림">
								</td>
								<td>${weather.temperatures}ºC</td>
								<td>${weather.precipitation}mm</td>
								<td>${weather.microDust}</td>
								<td>${weather.windSpeed}km/h</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
</body>
</html>