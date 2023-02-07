<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 문의 보기</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
    $("#button").click(function() {
       var recontent = $("#recontent").val();
        
        if (recontent == "") {
          alert("내용을 입력하세요.");
          $("#recontent").focus();
          return false;
       }
      
    });
 });

</script>
</head>
<body>

	<h1>상세 고객 문의</h1>
	<h5>상세 문의 보기</h5>
	<table border="1">
		<thead>
			<tr>
				<th>유형</th>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tr>
			<td>${customerDTO.anytype}</td>
			<td>${customerDTO.num}</td>
			<td>${customerDTO.title}</td>
			<td>${customerDTO.content}</td>
			<td><c:set var="customerDTO.writedate"
					value="<%=new java.util.Date()%>" /> <fmt:formatDate
					value="${customerDTO.writedate}" pattern="yy-MM-dd" /></td>
			<td><a href="./CustomerSelect">문의 목록</a> <a
				href="./CustomerUpdate?num=${customerDTO.num}">문의 수정</a> <a
				href="./CustomerDelete?num=${customerDTO.num }">문의 삭제</a></td>
		</tr>
	</table>
	<!-- 게시물 끝 -->

<!-- 	<fieldset> -->
<!-- 		<div id="reply"> -->

<!-- 			<ol class="replyList"> -->
<%-- 				<c:forEach items="${repList}" var="repList"> --%>
<!-- 					<li style="border:1px solid;"> -->

<!-- 						<p> -->
<%-- 							제목 : ${repList.retitle}<br /> 작성 날짜 : --%>
<%-- 							<fmt:formatDate value="${repList.redate}" pattern="yyyy-MM-dd" /> --%>
<!-- 						</p> -->

<%-- 						<p>${repList.recontent}</p>  --%>
<!-- 						<a -->
<%-- 						href="./replyupdate?num=${customerDTO.num}&renum=${repList.renum}">수정</a> --%>
<!-- 						/ <a -->
<%-- 						href="./replydelete?num=${customerDTO.num }&renum=${repList.renum}&retitle=${repList.retitle}">삭제</a> --%>
<!-- 					</li> -->
<%-- 				</c:forEach> --%>
<!-- 			</ol> -->
<!-- 		</div> -->
<!-- 	</fieldset> -->

<!-- 	<form method="post" action="./write"> -->
<!-- 		<fieldset> -->
<!-- 			<p> -->
<!-- 				<label>댓글작성자</label> <input type="text" name="writer" value="관리자" -->
<!-- 					readonly="readonly"> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<label>댓글제목</label> <input type="text" name="retitle" -->
<%-- 					value="${customerDTO.title}" readonly="readonly"> --%>
<!-- 			<p> -->
<!-- 				<textarea rows="5" cols="50" name="recontent" id="recontent"></textarea> -->
<!-- 			</p> -->
<!-- 			<p> -->
<%-- 				<input type="hidden" name="num" value="${customerDTO.num}"> --%>
<!-- 				<button type="submit" id="button">댓글작성</button> -->
<!-- 			</p> -->
<!-- 		</fieldset> -->
<!-- 	</form> -->
</body>

<c:if test="${id != 'admin' }">
<fieldset>
		<div id="reply">

			<ol class="replyList">
				<c:forEach items="${repList}" var="repList">
					<li style="border:1px solid;">

						<p>
							제목 : ${repList.retitle}<br /> 작성 날짜 :
							<fmt:formatDate value="${repList.redate}" pattern="yyyy-MM-dd" />
						</p>

						<p>${repList.recontent}</p> 
<!-- 						<a -->
<%-- 						href="./replyupdate?num=${customerDTO.num}&renum=${repList.renum}">수정</a> --%>
<!-- 						/ <a -->
<%-- 						href="./replydelete?num=${customerDTO.num }&renum=${repList.renum}&retitle=${repList.retitle}">삭제</a> --%>
					</li>
				</c:forEach>
			</ol>
		</div>
	</fieldset>

</c:if>

<c:if test="${id == 'admin'}">

<fieldset>
		<div id="reply">

			<ol class="replyList">
				<c:forEach items="${repList}" var="repList">
					<li style="border:1px solid;">

						<p>
							제목 : ${repList.retitle}<br /> 작성 날짜 :
							<fmt:formatDate value="${repList.redate}" pattern="yyyy-MM-dd" />
						</p>

						<p>${repList.recontent}</p> 
						<a
						href="./replyupdate?num=${customerDTO.num}&renum=${repList.renum}">수정</a>
						/ <a
						href="./replydelete?num=${customerDTO.num }&renum=${repList.renum}&retitle=${repList.retitle}">삭제</a>
					</li>
				</c:forEach>
			</ol>
		</div>
	</fieldset>
		<form method="post" action="./write">
		<fieldset>
			<p>
				<label>댓글작성자</label> <input type="text" name="writer" value="관리자"
					readonly="readonly">
			</p>
			<p>
				<label>댓글제목</label> <input type="text" name="retitle"
					value="${customerDTO.title}" readonly="readonly">
			<p>
				<textarea rows="5" cols="50" name="recontent" id="recontent"></textarea>
			</p>
			<p>
				<input type="hidden" name="num" value="${customerDTO.num}">
				<button type="submit" id="button">댓글작성</button>
			</p>
		</fieldset>
	</form>
</c:if>
</html>