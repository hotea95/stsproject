<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 전체보기</title>
</head>
<body>

	<h1>고객 센터</h1>
	<h5>고객 센터 전체 보기</h5>

	<table border="1">
		<thead>
			<tr>
				<th>유형</th>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>
		<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.anytype}</td>
				<td><input type="text" id="num" name="num" value="${list.num}"
					readonly="readonly"></td>
				<td>${list.title}</td>
				<td><c:set var="list.writedate"
						value="<%=new java.util.Date()%>" /> <fmt:formatDate
						value="${list.writedate}" pattern="yyyy-MM-dd" /></td>
				<%-- <td>${list.writedate} </td> --%>

				<td><a href="./CustomerSelectDetail?num=${list.num}">문의 내용
						상세보기</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="./CustomerInsert">문의 작성하기</a>

	<%-- <c:forEach items="${replyList}" var="replyList"> --%>
	<!-- <li> -->
	<!-- <p> -->
	<%-- 제목 : ${replyList.retitle}<br/> --%>
	<%-- 작성 날짜 : <fmt:formatDate value="${replyList.redate}" pattern="yyyy-mm-dd" /> --%>
	<!-- </p> -->

	<%-- <p>${replayList.content}</p> --%>
	<!-- </li> -->

	<%-- </c:forEach> --%>
</body>
</html>