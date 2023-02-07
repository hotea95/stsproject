<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인터파크 로그인</title>
</head>
<body>
	
	<!-- 로그인 실패 -->
	<c:if test="${result eq '0'}">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호가 틀렸습니다.");
			history.back();
		</script>
	</c:if>
	
	<!-- 관리자 로그인 -->
	<c:if test="${result eq '1'}">
		<c:if test="${id eq 'admin'}">
			<script type="text/javascript">
				alert("${mname}님 환영합니다.");
				location.href = "./MemberSelect";
			</script>
		</c:if>
	</c:if>
	<!-- 일반회원 로그인 -->
	<c:if test="${result eq '1'}">
		<c:if test="${id != 'admin'}">	
			<script type="text/javascript">
				alert("${mname}님 어서오세요.");
				location.href = "./MemberSelect";
			</script>
		</c:if>
	</c:if>
	
</body>
</html>