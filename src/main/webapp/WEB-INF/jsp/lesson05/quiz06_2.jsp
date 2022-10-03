<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/lesson05/quiz06.css">

</head>
<body>
	<div class="container">
		<header class="bg-info text-white">
			<h1 class="pt-3 ml-3">배탈의 민족</h1>
		</header>
		<section>
			<div class="display-3 mb-3">${storeName} - 리뷰</div>
			<c:choose>
				<c:when test="${empty reviews}">
					<h2 class="pl-3 pt-3">
						<b>작성된 리뷰가 없습니다.</b>
					</h2>
				</c:when>
				<c:otherwise>
					<c:forEach items="${reviews}" var="review">
						<div class="store-list border border-info mb-3 pt-3 pl-3">
							<b class="userName">${review.userName}</b>
							<c:forEach var="i" begin="1" end="5">
								<c:choose>
									<c:when test="${review.point >= i}">
										<img alt="채워진별점" src="/img/star_fill.png" width="30px">
									</c:when>
									<c:when test="${review.point eq (i - 0.5)}">
										<img alt="반채운별점" src="/img/star_half.png" width="30px">
									</c:when>
									<c:otherwise>
										<img alt="빈별점" src="/img/star_empty.png" width="30px">
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<p class="text-secondary"><fmt:formatDate value="${review.createdAt}" pattern="yyyy년 m월 d일"/></p>
							<p>${review.review}</p>
							<button class="menu btn text-dark mb-2">${review.menu}</button>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</section>
		<footer>
			<hr>
			<h2>(주)우와한형제</h2>
			<span class="text-secondary">고객센터 : 1500-1500</span>
		</footer>
	</div>
</body>
</html>