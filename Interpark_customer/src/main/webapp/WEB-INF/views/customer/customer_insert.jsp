<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>문의 정보 입력</title>
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
<h1>문의 정보 입력</h1>
<h5>문의 입력</h5>


<form method="post" name="frm" id="register">
<fieldset>
<label for="radio">유형</label><br>
<div>
<input type="radio" name="anytype" id="anytype" value="배송 문의" checked="checked"> 배송 문의
<input type="radio" name="anytype" id="anytype" value="상품 문의"> 상품 문의
<input type="radio" name="anytype" id="anytype" value="반품/교환 문의"> 반품/교환 문의
<input type="radio" name="anytype" id="anytype" value="주문/결제 문의"> 주문/결제 문의
</div>
<br>
<label for="title">제목</label>
<input type="text" name="title" id="title">
<br>
<label for="content">내용</label>
<textarea rows="5" cols="50" name="content" id="content"></textarea>
<!--  <input type="text" name="content" id="content">-->


<button type="submit" id="button" >등록</button>
<button type="reset">취소</button>
</fieldset>
<a href="./CustomerSelect">문의 목록</a>
</form>
</body>
</html>