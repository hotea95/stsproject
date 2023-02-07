<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 삭제</title>
</head>
<body>

	<div>
		<form method="post" action="./replydelete">
			<input type="hidden" name="num" id="num" value="${replyDTO.num}">
			<input type="hidden" name="renum" id="renum"
				value="${replyDTO.renum}">
<%-- 				<input type="text" name="retitle" id="retitle" value="${replyDTO.retitle}"> --%>
			
			<script type="text/javascript">
			if (confirm("정말로 삭제하시겠습니까??")==true) {
				location.href="./replydelete1?renum=${replyDTO.renum}&num=${replyDTO.num}"
			}else{
				history.back();
			}
			</script>
			<button type="submit">삭제</button>
			<button type="reset">취소</button>
		<!--  	<a>제목이 ${replyDTO.retitle}인 댓글을 삭제하시겠습니까?</a>-->
			

		</form>
	</div>
</body>
</html>