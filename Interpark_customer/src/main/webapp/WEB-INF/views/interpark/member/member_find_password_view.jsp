<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인터파크</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>
	<c:if test="${check eq 'true'}">
		<script type="text/javascript">
			alert("${memberDTO.id}님의 비밀번호를 ${memberDTO.email}으로 보내드렸습니다.")
			location.href = "./MemberLogin"
		</script>
	</c:if>
	
	<c:if test="${check eq 'false'}">
		<script type="text/javascript">
			alert("아이디 또는 이메일을 잘못썼거나 등록되어있지 않습니다.")
			location.href = "./MemberfindId"
		</script>
	</c:if>
	
</body>
</html>