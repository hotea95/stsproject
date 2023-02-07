<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인터파크 회원 삭제</title>
</head>
<body>
	<script type="text/javascript">
		if (confirm("삭제하시겠습니까?") == true) {
			location.href = "./MemberDeleteCheck?id=${memberDTO.id}";
		} else {
			history.back();
		}
//		alert("${memberDTO.id}님의 회원 정보를 삭제하였습니다.")
//		location.href = "./MemberSelect";
	</script>
</body>
</html>