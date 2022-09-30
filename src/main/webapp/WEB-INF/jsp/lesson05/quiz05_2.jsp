<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<c:forEach items="${}" var="weather">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:forEach>
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