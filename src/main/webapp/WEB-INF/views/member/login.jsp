<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>TECH HOUSE - 로그인</title>

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
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>
<style>
/* 로그인 실패시 경고글 */
.login_warn {
	margin-top: 30px;
	text-align: center;
	color: red;
}

.login-box {
	margin-top: 75px;
	height: auto;
	background: #1A2226;
	text-align: center;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}

.login-key {
	height: 100px;
	font-size: 80px;
	line-height: 100px;
	background: -webkit-linear-gradient(#27EF9F, #0DB8DE);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.login-title {
	margin-top: 15px;
	text-align: center;
	font-size: 30px;
	letter-spacing: 2px;
	margin-top: 15px;
	font-weight: bold;
	color: #ECF0F5;
}

.login-form {
	margin-top: 25px;
	text-align: left;
}

input[type=text] {
	background-color: #1A2226;
	border: none;
	border-bottom: 2px solid #0DB8DE;
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
	border-bottom: 2px solid #0DB8DE;
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

.login-btm {
	float: left;
}

.login-button {
	padding-right: 0px;
	text-align: right;
	margin-bottom: 25px;
}

.login-text {
	text-align: left;
	padding-left: 0px;
	color: #A2A4A4;
}

.loginbttm {
	padding: 0px;
}
</style>
<meta charset="UTF-8" />
</head>
<body>


	<jsp:include page="../init/header.jsp"></jsp:include>
	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<div class="col-lg-3 col-md-2"></div>
			<div class="col-lg-6 col-md-8 login-box">
				<div class="col-lg-12 login-key mt-4">
					<i class="fa fa-key" aria-hidden="true"></i>
				</div>
				<div class="col-lg-12 login-title">USER LOGIN</div>

				<div class="col-lg-12 login-form">
					<div class="col-lg-12 login-form">
						<form id="login_form" method="post">
							<div class="form-group mx-5">
								<label class="form-control-label ">USER ID :</label> <br> <input
									type="text" class="id_input w-100 " name="id" placeholder="">
							</div>
							<div class="form-group mx-5 mb-2">
								<label class="form-control-label">PASSWORD : </label><br> <input
									class="pw_input w-100 " name="password" type="password"
									placeholder="">
							</div>
							<c:if test="${result == 0 }">
								<div class="login_warn mb-4">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
							</c:if>
							<div class="col-lg-12 loginbttm ">
								<div class="col-lg-6 login-btm login-text">
									<!-- Error Message -->
								</div>
								<div class="col-lg-6 login-btm login-button w-100 d-flex align-items-center justify-content-center">
									<input type="button" class="login_button button-0" value="로그인">
									<a href="/main" class="button-0-border">취소</a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-3 col-md-2"></div>
			</div>
		</div>
		<div class="forget-user-box text-white w-75 text-end">
			<a href="/member/join" class="pe-3">sign up</a>
			<a href="#">find account</a>
		</div>
	</div>

	<%-- 	<form id="login_form" method="post" class="d-flex flex-column w-75 ">
		<input class="id_input" name="id" placeholder="Userid"> <input
			class="pw_input " name="password" type="password"
			placeholder="Password">

		<c:if test="${result == 0 }">
			<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
		</c:if>

		<input type="button" class="login_button" value="로그인"> <a
			type="button" class="login_button">취소</a>
	</form> --%>






























	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {

			//alert("로그인 버튼 작동");
			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login.do");
			$("#login_form").submit();

		});

		$(".pw_input, .id_input").on("keyup", function(e) {
			if (e.keyCode == 13) {
				$("#login_form").attr("action", "/member/login.do");
				$("#login_form").submit();
			}
		});
	</script>
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