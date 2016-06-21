<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<h1>book list</h1>
	<table border="1">
		<tr align="center">
			<td width="100px">아이디</td>
			<td width="100px">책이름</td>
			<td width="100px">글쓴이</td>
			<td width="100px">가격</td>
			<td width="100px">장르</td>
			<td width="200px">출판사</td>
			<td width="200px">수량</td>
		</tr>
		<c:forEach var="members" items="${members}">
			<tr align="center">
				<td>${members.MNO}</td>
				<td>${members.EMAIL}</td>
				<td>${members.PWD}</td>
				<td>${members.MNAME}</td>
				<td>${members.CRE_DATE}</td>
				<td>${members.MOD_DATE}</td>
			</tr>
		</c:forEach>
</body>
</html>