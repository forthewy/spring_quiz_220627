<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/lesson05/quiz06.css">
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${favors}" var="favor" varStatus="status">
					<tr>
						<td>${favor.id}</td>
						<td>${favor.name}</td>
						<td>${favor.url}</td>
						<td><button type="button" class="deleteBtn btn btn-danger" id="${favor.id}">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function() {
			// alert("zzzzz");
			$('.deleteBtn').on('click', function(e) {
				let btnId = this.id;
				
				$.ajax({
					type:"POST",
					url:"/lesson06/quiz02/delete_favorite",
					data:{"btnId":btnId},
					success:function(data) {
						if (data == "성공"){
							location.href="/lesson06/quiz01/get_favorite_view";
						} else {
							alert("삭제 실패");
						}
					},
					error:function(e) {
						alert("실패 사유를 확인하세요 "  + e);
					}
				})
			});
		});
	</script>
</body>
</html>