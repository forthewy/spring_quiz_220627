<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 (1)</title>
</head>
<body>
	<h1>1. JSTL core 변수</h1>
	<c:set var="number1" value="36"/>
	<c:set var="number2">3</c:set>
	
	<h2>첫번째 숫자:${number1}</h2>
	<h2>두번째 숫자:${number2}</h2>
	
	<h1>2. JSTL core 연산</h1>
	더하기: ${number1 + number2}<br>
	빼기:	 ${number1 - number2}<br>
	곱하기: ${number1 * number2}<br>
	나누기: ${number1 / number2}<br>
	
	<h1>3. core out</h1>
	<c:out value="<title>core out</title>" escapeXml="true"></c:out> <%-- escapeXml 안써도 기본적으로 true --%>
	
	<h1>4. core if</h1>
	<c:choose> 
		<c:when test="${(number1 + number2) / 2 >= 10}">
			<h1>${(number1 + number2) / 2}</h1>
		</c:when>
		<c:otherwise>
			<h3>${(number1 + number2) / 2}</h3>
		</c:otherwise>
	</c:choose>
	
	<h1>5. core if</h1>
	<c:if test="${(number1 * number2) > 100}">
		<c:out value="<script>alert('너무 큰수입니다')</script>" escapeXml="false"></c:out>
	</c:if>
</body>
</html>