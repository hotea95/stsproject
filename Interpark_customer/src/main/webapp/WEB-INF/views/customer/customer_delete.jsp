<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 삭제</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>

</head>
<body>
<h1>문의 정보 삭제</h1>
<h5>문의 삭제</h5>
<form method="post">
<fieldset>
<label for="num">문의 번호</label>
<input type="text" name="num" id="num" value="${param.num}" readonly>
<button type="submit" id="button">삭제</button>
<button type="reset" onclick="location.href='./CustomerSelect'">취소</button>
</fieldset>
</form>
<a href = "./CustomerInsert">문의 작성</a>
<a href = "./CustomerSelect">문의 조회</a>
<a href = "./CustomerUpdate">문의 수정</a>
</body>
</html>