<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인터파크</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
</head>
<body>
	<header id="main-header" class="py-2 bg-primary text-white">
		<div class="container">
			<div class="row mt-3 p-3">
				<div class="col-md-6"></div>
			</div>
		</div>
	</header>
	
	<section id="actions" class="py-4 mb-4 bg-light">
		<div class="container">
			<div class="row"></div>
		</div>
	</section>
	<section id="post">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-3">
					<div class="card text-center bg-success text-white mb-3">
						<div class="card-body">
							
							<h3>회원 가입</h3>
							<h4 class="display-4">
								<i class="fas fa-users"></i>
							</h4>	
							<button type="button" class="btn btn-outline-light btn-sm"
								onclick="location.href='MemberInsert'">클릭</button>
						</div>
					</div>
				</div>	
				<div class="col-md-3">
					<div class="card text-center bg-warning text-white mb-3">
						<div class="card-body">
							<h3>로그인</h3>
							<h4 class="display-4">
								<i class="fas fa-user"></i>
							</h4>
							<button type="button" class="btn btn-outline-light btn-sm"
								onclick="location.href='MemberLogin'">클릭</button>
						</div>
					</div>
				</div>
				<p class="text-danger">
					<i class="fa fa-check-square mr-sm-2"></i>
					아이디가 없으신 분은 회원가입 후 이용하실 수 있습니다.
				</p>
			</div>
		</div>
	</section>
</body>
<%-- <c:if test="${id == 'admin'}"> --%>
<!-- <button type="button" onclick="location.href='./CustomerSelect'">고객센터</button> -->
<%-- </c:if> --%>
</html>