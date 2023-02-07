<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인터파크 회원 상세 정보</title>
<link rel="stylesheet" type="text/css"
	href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>회원 상세 정보</h1>
				</div>
			</div>
		</div>
	</header>
	<section id="actions" class="py-4 mb-4 bg-light"></section>
	<section id="details">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5>회원 상세 보기</h5>
						</div>
						<div class="card-body">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr class="text-center">
										<th>아이디</th>
										<th>비밀번호</th>
										<th>회원이름</th>
										<th>이메일</th>
										<th>휴대폰번호</th>
									</tr>
								</thead>
								<tbody>
									<tr class="text-center">
										<td>${memberDTO.id}</td>
										<td>${memberDTO.password}</td>
										<td>${memberDTO.mname}</td>
										<td>${memberDTO.email}</td>
										<td>${memberDTO.phone}</td>
									</tr>
								</tbody>
							</table>
							<div class="row">
								<div class="col-md-4">
									<a href="./MemberSelect" class="btn btn-primary btn-block">
										회원 목록
									</a>
								</div>
								<div class="col-md-4">
									<a href="./MemberUpdate?id=${memberDTO.id}"
										class="btn btn-warning btn-block">
										회원 수정
									</a>
								</div>
								<div class="col-md-4">
									<a href="./MemberDelete?id=${memberDTO.id}"
										class="btn btn-danger btn-block">
										회원 삭제
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>