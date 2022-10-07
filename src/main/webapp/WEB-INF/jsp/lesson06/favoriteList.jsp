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
					<th>-</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${favors}" var="favor" varStatus="status">
					<tr>
						<td>${favor.id}</td>
						<td>${favor.name}</td>
						<td>${favor.url}</td>
						<td>
						<%-- (1) name 이벤트, value 속성을 이용해서 id 보내기 --%>
						<%-- <button type="button" name="delBtn" class="deleteBtn btn btn-danger" value="${favor.id}">삭제</button> --%> 
						<%-- name 혹은 class로 여러개 지정 여기서 name으로 잡아도 됨 --%>
						<%--  id="${favor.id}" 로 잡아서 this.id 로 잡아도 됨. --%>
						
						<%-- (2) data를 이용해서 태그에 data를 임시 저장해놓기 --%>
						<button type="button" class="del-btn btn btn-danger" data-favorite-id="${favor.id}">삭제</button>
						<%-- data-favorite-id 모두 하이픈으로 이어붙이고 대문자 쓰면안됨. 규칙임. --%>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function() {
			// alert("zzzzz");
			
			// (1) name 이벤트, value 속성을 이용해서 id 보내기
			/* $('td').on('click', 'button[name=delBtn]', function(e) {
				//let id = $(this).attr('value');
				let id = e.target.value; // value는 한개만 넘기기 가능
				//alert();
				
			})  */
			
			// (2) data를 이용해서 태그에 data를 임시 저장해놓기
			// 태그: data-favorite-id		data- 그 뒤부터는 이름을 지어준다. (꼭 하이픈 형식. 대문자 절대 안됨)
			// 스크립트: $(this).data('favorite-id');
			$('.del-btn').on('click' , function() {
				let favoriteId = $(this).data('favorite-id');
				//alert(favoriteId);
				
				
				// AJAX -> 삭제할 id db
				$.ajax({
					// request
					type:"DELETE" 
					// GET - 주소로 치고 들어갈 수 있다 , location.href - 스크립트, a href - 태그, form method="get", ajax type:"get"
					// 		 용량이 적다. 큰 용량을 보내야할때는 POST 방식으로 보내야 한다. requestBody가 비어있다.
					// POST, DELETE, PUT.... - 주소 치면 405 에러남, form method="post", ajax type:"post"
					
					, url: "/lesson06/quiz02/delete_favorite"
					, data:{"btnId":favoriteId}
					
					// response
					
					// 응답(Response) 형태 - content type (Response 헤더)
					// text/plain
					// text/html
					// text/json
					// file(이미지, excel, zip)
					// 
					// 2) 서버입장
					// @Controller
					// 	ViewResover 수행
					// 	return String => jsp의 경로 => Model 사용가능
					
					// @Controller + @ResponseBody => @RestController
					// HttpMessageConverter 수행
					// return String => 문장 => Model 사용 불가
					// return Object => 객체 => JSON String 으로 변환 Jackson 라이브러리 동작
					// AJAX의 요청일때는 무조건 이방식을 사용한다.
					
					
					
					, success:function(data) { // json string => object
						if (data.code == 100) {
							// location.href 는 완전새로고침이고 그대로 머무르면서 새로고침해야 하므로 reload
							location.reload(true);
						} else {
							alert(data.errorMessage);
						}
					}
					, error:function(e) {
						alert("삭제 실패했습니다. 관리자에게 문의해주세요");
					}
				})
			})
			
			// 직접 푼것
			/* $('.deleteBtn').on('click', function(e) {
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
			}); */
		});
	</script>
</body>
</html>