<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/lesson06/quiz03.css">

</head>
<body>
	<div class="container">
		<header class="text-center pt-3">
			<h1>통나무 팬션</h1>
		</header>
		<nav class="bg-warning">
			<ul class="nav nav-fill">
				<li class="nav-item">
					<a class="nav-link" href="#">팬션 소개</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">객실 보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">예약하기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/lesson06/quiz03/1">예약목록</a>
				</li>
			</ul>
		</nav>
		<section>
			<h1 class="text-center pt-3 pb-3"><strong>예약 목록 보기</strong></h1>
			<table class="table text-center">
				<thead>
					<tr>
						<td>이름</td>
						<td>예약 날짜</td>
						<td>숙박일수</td>
						<td>숙박인원</td>
						<td>전화번호</td>
						<td>예약상태</td>
						<td>      </td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bookingList}" var="booking">
						<tr>
							<td>${booking.name}</td>
							<td>
								<fmt:parseDate var="date" value="${booking.date}" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${date}" pattern="yyyy년 M월 d일"/>
							</td>
							<td>${booking.day}</td>
							<td>${booking.headcount}</td>
							<td>${booking.phoneNumber}</td>
							<td>
								<c:set var="state" value="${booking.state}"/>
								<c:choose>
									<c:when test="${state eq '대기중'}">
										<span class="text-info">${state}</span>
									</c:when>
									<c:when test="${state eq '확정'}">
										<span class="text-success">${state}</span>
									</c:when>
								</c:choose>
							</td>
							<td><button type="button" class="del-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button></td>
						</tr>									
					</c:forEach>
				</tbody>
			</table>
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
			//alert("aaaaa");
			$('.del-btn').on('click', function() {
				let bookingId = $(this).data('booking-id');
				
				$.ajax({
					type:"DELETE"
					,url:"/lesson06/quiz03/delete_booking"
					,data:{"id":bookingId}
					,success:function(data) {
						if (data.response == 200) {
							location.reload(true);
						} else {
							alert(data.errorMessage);
						}
					}
					, error:function(e) {
						alert("실패하였습니다 관리자에게 문의하여주시기 바랍니다");
					}
				});
			});
		});
	</script>
</body>
</html>