<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
		
<meta charset="UTF-8">
<title>문의 전체보기</title>
</head>
<body>
${login.id}
<h1>고객 센터</h1>
<h5>고객 센터 전체 보기 </h5>

<table border="1">
<thead>
<tr>
<th>유형</th><th>번호</th><th>제목</th><th>날짜</th>
</tr>
</thead>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.anytype}</td>
<td>${list.num} </td>
<td>${list.title} </td>
<td><c:set var="list.writedate" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${list.writedate}" pattern="yy-MM-dd" /></td>
<%-- <td>${list.writedate} </td> --%>

<td>
<a href="./CustomerSelectDetail?num=${list.num}">문의 내용 상세보기</a>
</td>
</tr>
</c:forEach>
</table>
<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="CustomerSelect${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="CustomerSelect${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="CustomerSelect${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>

<a href="./CustomerInsert">문의 작성하기</a>

<!--<c:forEach items="${replyList}" var="replyList">
<li>
<p>
  제목 : ${replyList.retitle}<br/>
작성 날짜 : <fmt:formatDate value="${replyList.redate}" pattern="yyyy-mm-dd" />
</p>

<p>${replayList.content}</p>
</li>

</c:forEach>-->
</body>
</html>