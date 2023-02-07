<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="./js/reply.js"></script>
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

<div>
<form method="post" action="./replyupdate" id="reply_check">

<p>
<label>댓글작성자</label> <input type="text" name="writer" value="관리자" readonly="readonly">
</p>
<p>
<input type="hidden" name="num" id="num" value="${replyDTO.num}">
<input type="hidden" name="renum" id="renum" value="${replyDTO.renum}">
<textarea rows="5" cols="50" name="recontent" id="recontent" ></textarea>
</p>

<button type="submit" id="button">댓글 수정 완료</button>



</form>
</div>

</body>
</html>