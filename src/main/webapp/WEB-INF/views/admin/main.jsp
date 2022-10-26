<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<title>테크하우스 관리자 페이지</title>
<meta charset="UTF-8" />
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/default.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<jsp:include page="../init/nav.jsp"></jsp:include>
	<!-- infomation -->
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-8 ">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active text-white" id="list-home"
						role="tabpanel" aria-labelledby="list-home-list">
						<p>개인정보 : 프로필이미지부터 등급 등 모든 user테이블의 정보 가져오기
						<p>게시글 내역 : 거래게시글까지 포함한 게시글별 글 모두 가져오기 (페이징구현)
						<p>거래 내역 : 거래 게시글, 구매글, 판매글, 총 구매액, 판매액 가져오기
						<p>고객상담 내역 : 1:1문의글과 관리자답글가져오기, 신고글가져오기
						<p>회원 탈퇴 : 경고문구, 탈퇴하기 버튼, 한번 더 묻는 창 띄우고 비밀번호 입력 후 탈퇴
					</div>
					<div class="tab-pane fade text-white" id="list-board"
						role="tabpanel" aria-labelledby="list-messages-list">게시글 내역
						: 거래게시글까지 포함한 게시글별 글 모두 가져오기 (페이징구현)</div>
					<div class="tab-pane fade text-white" id="list-trade"
						role="tabpanel" aria-labelledby="list-profile-list">거래 내역 :
						거래 게시글, 구매글, 판매글, 총 구매액, 판매액 가져오기</div>
					<div class="tab-pane fade text-white" id="list-commission"
						role="tabpanel" aria-labelledby="list-messages-list">고객상담 내역
						: 1:1문의글과 관리자답글가져오기, 신고글가져오기</div>
					<div class="tab-pane fade text-white" id="list-delete"
						role="tabpanel" aria-labelledby="list-settings-list">회원 탈퇴 :
						경고문구, 탈퇴하기 버튼, 한번 더 묻는 창 띄우고 비밀번호 입력 후 탈퇴</div>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class='v-line'></div>
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active"
						id="list-home-list" data-bs-toggle="list" href="#list-home"
						role="tab" aria-controls="list-home">회원 조회</a>
						<a class="list-group-item list-group-item-action"
						id="list-profile-list" data-bs-toggle="list" href="#list-board"
						role="tab" aria-controls="list-profile">게시글 관리</a> 
						<a class="list-group-item list-group-item-action"
						id="list-messages-list" data-bs-toggle="list" href="#list-trade"
						role="tab" aria-controls="list-messages">거래 내역</a> 
						<a class="list-group-item list-group-item-action"
						id="list-settings-list" data-bs-toggle="list"
						href="#list-commission" role="tab" 
						aria-controls="list-settings">고객상담</a> 
						<a class="list-group-item list-group-item-action"
						id="list-settings-list" data-bs-toggle="list" href="#list-delete"
						role="tab" aria-controls="list-settings">회원 관리</a>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../init/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script src="https://kit.fontawesome.com/5547fa07a6.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="/resources/js/scripts.js"></script>

</body>
</html>