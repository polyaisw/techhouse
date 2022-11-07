<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<title>TECH HOUSE - 마이 페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<meta charset="UTF-8" />
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="/resources/assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="/resources/assets/css/owl.css">
<link rel="stylesheet" href="/resources/assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<style>

.key {
	height: 100px;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	line-height: 100px;
	background: -webkit-linear-gradient(#fccb90, #d57eeb);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.user_del-title {
	margin-top: 15px;
	text-align: center;
	font-size: 30px;
	letter-spacing: 2px;
	margin-top: 15px;
	font-weight: bold;
	color: #ECF0F5;
}

.user_del-form {
	margin-top: 25px;
	text-align: left;
}

input[type=text] {
	background-color: #1A2226;
	border: none;
	border-bottom: 2px solid #e75e8d;
	border-top: 0px;
	border-radius: 0px;
	font-weight: bold;
	outline: 0;
	margin-bottom: 20px;
	padding-left: 0px;
	color: #ECF0F5;
}

input[type=password] {
	background-color: #1A2226;
	border: none;
	border-bottom: 2px solid #e75e8d;
	border-top: 0px;
	border-radius: 0px;
	font-weight: bold;
	outline: 0;
	padding-left: 0px;
	margin-bottom: 20px;
	color: #ECF0F5;
}

.form-group {
	margin-bottom: 40px;
	outline: 0px;
}

.form-control:focus {
	border-color: inherit;
	-webkit-box-shadow: none;
	box-shadow: none;
	border-bottom: 2px solid #0DB8DE;
	outline: 0;
	background-color: #1A2226;
	color: #ECF0F5;
}

input:focus {
	outline: none;
	box-shadow: 0 0 0;
}

label {
	margin-bottom: 0px;
}

.form-control-label {
	font-size: 10px;
	color: #6C6C6C;
	font-weight: bold;
	letter-spacing: 1px;
}

.btn-outline-primary {
	border-color: #0DB8DE;
	color: #0DB8DE;
	border-radius: 0px;
	font-weight: bold;
	letter-spacing: 1px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.btn-outline-primary:hover {
	background-color: #0DB8DE;
	right: 0px;
}
.t-orange{
	color: #FF8000;
}
.text_in{
	color : lightgreen;
	font-weight: bold;
}
</style>

</head>
<jsp:include page="../init/header.jsp"></jsp:include>
<body>
	<div class="container text-white">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="col-lg-12 user_del-title">회원 탈퇴</div>
					<div class="col-lg-12 key mt-4">
						<h2 class="t-orange">주의!</h2>
						<a class="t-orange">회원탈퇴시 계정과 관련된 모든 데이터는 삭제되며 복구시킬수 없습니다.</a>
						<a class="t-orange">탈퇴하시려면 비밀번호를 입력해주시고 탈퇴버튼을 눌러주세요.</a>
					</div>
					<div class="col-lg-12 user_del-form">
						<div class="col-lg-12 user_del-form">
							
							<form id="user_del" method="post">
								<div class="form-group mx-5">
									<input class="id_input inline-block w-100" type="text" name="id" value="${ member.id }" readonly>
									<span class = "text_in">비밀번호</span>
									<input class="pw_input inline-block w-100" name="password" type="password" placeholder="비밀번호">
								</div>
								<div class="d-flex align-items-center justify-content-center">
									<input type="button" class="my_del_button button-3 my-5" value="탈퇴하기">
									<a href="/main"class="button-3-border">취소</a>
								</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(".my_del_button").click(function() {

		//alert("로그인 버튼 작동");
		/* 로그인 메서드 서버 요청 */
		$("#user_del").attr("action", "/member/my_del.do");
		$("#user_del").submit();

	});
	</script>
	<jsp:include page="../init/footer.jsp"></jsp:include>
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="/resources/assets/js/isotope.min.js"></script>
	<script src="/resources/assets/js/owl-carousel.js"></script>
	<script src="/resources/assets/js/tabs.js"></script>
	<script src="/resources/assets/js/popup.js"></script>
	<script src="/resources/assets/js/custom.js"></script>
</body>
</html>