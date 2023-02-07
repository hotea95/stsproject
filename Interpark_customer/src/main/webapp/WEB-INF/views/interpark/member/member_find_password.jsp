<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인터파크</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#passwordSearch").click(function() {
			var id = $("#id").val();
			var email = $("#email").val();
			
			if (id == "") {
				alert("아이디를 입력하세요.");
				$("#id").focus();
				return false;
			}
			if (email == "") {
				alert("이메일을 입력하세요.");
				$("#email").focus()
				return false;
			}
			
		});
	});
</script>


</head>
<body>
	<header id="main-header" class="py-2 bg-secondary text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6" align="center">
					<h1>
						<i class="fas fa-user-check mr-sm-1">비밀번호 찾기</i>
					</h1>
				</div>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown mr-3">
						<div class="py-2">
							<a href="./MemberLogin" class="nav-link text-white">
								<i class="fas fa-user-circle mr-sm-1"></i>
								로그인
							</a>
						</div>
				</ul>
				<ul class="navbar-nav py-2 mb-2 pl-3 pr-3">
					<li><a href="./index.jsp" class="navbar-brand  text-white">
							<i class="fa fa-home"></i>홈
					</a></li>
				</ul>
			</div>
		</div>
	</header>
	<section id="actions" class="py-4 mb-4 bg-light">
		<div class="container">
			<div class="row"></div>
		</div>
	</section>
	<section id="login">
		<div class="container">	
			<div class="row">
				<div class="col-9 mx-auto">
					<div class="card">
						<div class="card-header">
							<h4>비밀번호</h4>
						</div>
						<div class="card-body">
							<form action="./MemberfindPassword" method="post" id="signupForm" enctype="application/x-www-form-urlencoded">
								<fieldset>
									<div class="form-group">
										<label for="id">
											<i class="fas fa-user mr-sm-1"></i>
											아이디
										</label>
										<input type="text" name="id" id="id" class="form-control" placeholder="아이디">
									</div>
									<div class="form-group">
										<label for="email">
											<i class="fas fa-envelope-open mr-sm-1"></i>
											이메일
										</label>
										<input type="email" name="email" id="email" class="form-control" placeholder="이메일">
									</div>
									<button type="submit" id="passwordSearch" class="btn btn-info btn-block">비밀번호 찾기</button>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				<div class="col-9 mx-auto py-3 mb-3">
					<div>

						<span>
							<button type="button" class="btn btn-outline-warning" onclick="location.href='./MemberfindId'">
								<i class="fas fa-user-lock mr-sm-1"></i>
								아이디 찾기
							</button>
						</span>
						<span>
							<button type="button" class="btn btn-outline-info" onclick="location.href='./MemberInsert'">
								<i class="fas fa-user-plus mr-sm-1"></i>
								회원 가입
							</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>