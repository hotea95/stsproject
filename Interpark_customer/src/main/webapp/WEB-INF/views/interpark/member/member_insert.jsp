<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인터파크 회원 가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validity.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		// 중복검사 (ajax이용)
		$(".idChk").on("click", function(e) {
		 	e.preventDefault();
			$.ajax({
				url : "./MemberidChk",
				type : "post",
				data : {"id" : $("#id").val()},
				success : function (result) {
					// N = 1
					if (result=="N") {
						alert("중복된 아이디 입니다.");
					} 
					// Y = 0
					if (result=="Y") {
						$("#idCheck").val(true);
						console.log($("#fn_idChk").val());
						alert("사용 가능한 아이디 입니다.");
					}
				}
			});
		});
	}); 
</script>
</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>회원 가입</h1>
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
							<h5>회원 가입</h5>
						</div>
						<div class="card-body">
							<form method="post" id="validity">
								<fieldset>
								
									<div class="form-group row">
										<label for="id" class="ml-sm-3 col-form-label">아이디</label>
										<div class="ml-sm-3">
											<input type="text" name="id" id="id" class="form-control form-control-sm">
											<button class="idChk" type="button" id="fn_idChk" name="fn_idChk">중복 체크</button>
											<input type="hidden" name="idCheck" id="idCheck">
										</div>
									</div>
									
									<div class="form-group row">
										<label for="password" class="ml-sm-3 col-form-label">비밀번호</label>
										<div class="ml-sm-3">
											<input type="password" name="password" id="password" class="form-control form-control-sm">
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
											<input type="text" name="mname" id="mname" class="form-control form-control-sm">
										</div>
									</div>
									
									<div class="form-group row">
										<label for="email" class="ml-sm-3 col-form-label">이메일</label>
										<div class="ml-sm-3">
											<input type="text" name="email" id="email" class="form-control form-control-sm">
										</div>
									</div>
									
									<div class="form-group row">
										<label for="phone" class="ml-sm-3 col-form-label">휴대폰번호</label>
										<div class="ml-sm-3">
											<input type="text" name="phone" id="phone" class="form-control form-control-sm">
										</div>
									</div>
									
									<div class="form-group">
										<button type="submit" >등록</button>
										<button type="reset" class="btn btn-secondary">취소</button>
									</div>
								</fieldset>
							</form>
							<div>
								<a href="./index.jsp" class="btn btn-primary btn-block">Home</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>