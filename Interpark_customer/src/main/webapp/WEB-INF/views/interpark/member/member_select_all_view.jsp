<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인터파크</title>
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>

</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>인터파크</h1>
				</div>
			</div>
		</div>
	</header>
	<section id="interpark" class="py-4 mb-4 bg-light"></section>
	<section id="details">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<p align="center">
								${sessionScope.mname}님 어서오세요
							</p>
						</div>
						<!-- 관리자만 보는화면 여기부터 -->
						<c:if test="${sessionScope.id == 'admin'}">
						<div class="card-body">
							<table class="table table-hover" >
								<thead class="thead-light">
									<tr class="text-center">
										<th>아이디</th>
										<th>비밀번호</th>
										<th>회원이름</th>
										<th>이메일</th>
										<th>휴대폰번호</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${list}">
										<tr class="text-center">
											<td>${list.id}</td>
											<td>${list.password}</td>
											<td>${list.mname}</td>
											<td>${list.email}</td>
											<td>${list.phone}</td>
											<td>
											<c:if test="${sessionScope.id == 'admin'}">
												<a href="./MemberSelectDetail?id=${list.id}" class="btn btn-outline-info">
													회원 상세 보기
												</a>
											</c:if>
											</td>
										</tr>
									</c:forEach>
									
									<c:if test="${empty list}">
										<tr>
											<td colspan="4">등록된 회원이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							<!-- 페이징처리 -->
							<div>
								<ul>
									<c:if test="${pageMakerDTO.prev}">
										<li>
											<a href="MemberSelect${pageMakerDTO.makeQuery(pageMakerDTO.startPage - 1)}">
												이전
											</a>
										</li>
									</c:if>	
									<c:forEach begin="${pageMakerDTO.startPage}" end="${pageMakerDTO.endPage}" var="idx">
										<li>
											<a href="MemberSelect${pageMakerDTO.makeQuery(idx)}">
												${idx}
											</a>
										</li>
									</c:forEach>
									<c:if test="${pageMakerDTO.next && pageMakerDTO.endPage > 1}">
										<li>
											<a href="MemberSelect${pageMakerDTO.makeQuery(pageMakerDTO.endPage + 1)}">
												다음
											</a>
										</li>
									</c:if> 
								</ul>
							</div>
							<!-- 여기까지 페이징처리 관련 -->
								<table align="center">
							<tr>
								
								<td><a href="./MemberInsert" class="btn btn-success btn-block">회원 등록</a></td>
							</c:if>
								<!-- 여기까지  관리자 화면 -->
								
								<!-- 일반회원이 볼수있는 화면 -->
								<c:if test="${sessionScope.id != 'admin'}">
									<a>여기는 일반 회원만 볼수 있는 화면입니다.</a>
								</c:if>
								<br>
								<td><a href="./MemberSelectDetail?id=${sessionScope.id}"  class="btn btn-success btn-block">내 정보</a></td>
								<td><a href="./MemberLogout" class="btn btn-success btn-block">로그 아웃</a></td>
								<button type="button" onclick="location.href='./CustomerSelect'">고객센터</button>
							</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>


</html>