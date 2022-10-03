<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="display-3 mb-3">우리동네 가게</div>
			<c:forEach items="${stores}" var="store">
				<div class="store-list border border-info mb-3 pt-3 pl-3">
					<a href="/lesson05/quiz06/reviews?storeId=${store.id}&storeName=${store.name}">
						<h2><b>${store.name}</b></h2>
						<span>전화번호: ${store.phoneNumber}</span><br>
						<span>주소: ${store.address}</span><br>
						<br>
					</a>
				</div>
			</c:forEach>
		</section>
		<footer>
			<hr>
			<h2>(주)우와한형제</h2>
			<span class="text-secondary">고객센터 : 1500-1500</span>
		</footer>
	</div>
</body>
</html>