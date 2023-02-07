<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 입력</title>
<c:forEach var="list" items="${list}">

<c:if test="${list.num==customerDTO.num }">
<script type="text/javascript">
alert("입력하신 ${customerDTO.num}번의 문의가 존재합니다. 다시 입력하세요.");
location.href="./CustomerInsert";
</script>

</c:if>

</c:forEach>
</head>
<body>
<script type="text/javascript">
alert("입력하신 ${num}번의 문의를 등록하였습니다.")
location.href="./CustomerSelect"
</script>
</body>
</html>