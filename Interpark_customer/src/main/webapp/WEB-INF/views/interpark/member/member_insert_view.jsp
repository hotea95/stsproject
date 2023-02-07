<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인터파크</title>
<c:forEach var="list" items="${list}">
	<c:if test="${list.id==memberDTO.id}">
		<script type="text/javascript">
			alert("입력하신 ${memberDTO.id}은(는) 이미 사용중인 아이디 입니다.");
			location.href = "./MemberInsert";
		</script>
	</c:if>
</c:forEach>
</head>
<body>
	<script type="text/javascript">
		alert("입력하신 ${memberDTO.id}아이디 등록하였습니다.")
		location.href = "./MemberLogin"
	</script>
</body>
</html>

