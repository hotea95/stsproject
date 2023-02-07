<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 수정</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
    $("#button").click(function() {
       var title = $("#title").val();
        var content = $("#content").val();
        if (title == "") {
          alert("제목을 입력하세요.");
          $("#title").focus();
          return false;
       }
        if (content == "") {
          alert("내용을 입력하세요.");
          $("#content").focus();
          return false;
       }
    });
 });

</script>
</head>
<body>
<h1> 문의 정보 수정 </h1>
<h5>문의 수정</h5>
<form method="post" id="sign_customer">
<fieldset>
<label for="num">문의 번호</label>
<input type="text" name="num" id="num" value="${customerDTO.num }" readonly><br>
<label for="title">제목</label>
<input type="text" name="title" id="title" value="${customerDTO.title}"><br>
<label for="content">내용</label>
<textarea rows="5" cols="50" name="content" id="content"></textarea><br>
<%-- <input type="text" name="content" id="content" value="${customerDTO.content}"> --%>

<button type="submit" id="button">등록</button>
<button type="reset" onclick="location.href='./CustomerSelect'">취소</button>
</fieldset>
</form>

<a href="./CustomerInsert">문의 작성</a>
<a href="./CustomerSelect">문의 조회</a>
<a href="./CustomerDelete">문의 삭제</a>
</body>




</html>