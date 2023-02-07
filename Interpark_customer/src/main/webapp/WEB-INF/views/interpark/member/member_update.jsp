<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인터파크 회원 정보 수정</title>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validity.js" type="text/javascript"></script>
</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>회원 정보 수정</h1>
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
							<h5>회원 수정</h5>
						</div>
						<div class="card-body">
							<form action="./MemberUpdate" method="post" id="sign_member">
								<fieldset>
									<div class="form-group row">
										<label for="id" class="ml-sm-3 col-form-label">아이디</label>
										<div class="ml-sm-3">
											<input type="text" name="id" id="id"
												class="form-control form-control-sm"
												value="${memberDTO.id}" readonly>
										</div>
									</div>
									
									<div class="form-group row">
										<label for="password" class="ml-sm-3 col-form-label">비밀번호</label>
										<div class="ml-sm-3">
											<input type="password" name="password" id="password"
												class="form-control form-control-sm"
												value="${memberDTO.password}">
										</div>
									</div>
									
									<div class="form-group row">
										<label for="passChk" class="ml-sm-3 col-form-label">비밀번호확인</label>
										<div class="ml-sm-3">
											<input type="password" name="passChk" id="passChk" class="form-control form-control-sm">
										</div>
									</div>
									
									<div class="form-group row">
										<label for="mname" class="ml-sm-3 col-form-label">회원이름</label>
										<div class="ml-sm-3">
											<input type="text" name="mname" id="mname"
												class="form-control form-control-sm bg-white"
												value="${memberDTO.mname}">
										</div>
									</div>
									
									<div class="form-group row">
										<label for="email" class="ml-sm-3 col-form-label">이메일</label>
										<div class="ml-sm-3">
											<input type="text" name="email" id="email"
												class="form-control form-control-sm"
												value="${memberDTO.email}">
										</div>
									</div>
									
									<div class="form-group row">
										<label for="phone" class="ml-sm-3 col-form-label">휴대폰번호</label>
										<div class="ml-sm-3">
											<input type="text" name="phone" id="phone"
												class="form-control form-control-sm" value="${memberDTO.phone}">
										</div>
									</div>
									
									<div class="form-group">
										<button type="submit" class="btn btn-secondary">등록</button>
										<button type="reset" class="btn btn-secondary">취소</button>
									</div>
								</fieldset>
							</form>
							<div class="row">
								<div class="col-md-4">
									<a href="./MemberSelect" class="btn btn-primary btn-block">회원 목록</a>
								</div>
								<div class="col-md-4">
									<a href="./MemberInsert" class="btn btn-success btn-block">회원 등록</a>
								</div>
								<div class="col-md-4">
									<a href="./MemberDelete?id=${param.id}"
										class="btn btn-danger btn-block">회원 삭제</a>
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