<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>TECH HOUSE - 회원가입</title>
<meta charset="UTF-8" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link href="resources/css/default.css" rel="stylesheet">
<link href="resources/css/nav.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<jsp:include page="../init/nav.jsp"></jsp:include>

	<div class="container ">
		<div class="row ">
			<div class="col text-center mt-5 p-5  border border-1">
				<form id="join_form" method="post">
					<h2 class="h2 text-white">회원가입</h2>
					<br>
					<p class="text-white">
						이메일 : <input class="mail_input " name="email">
					</p>
					<p>
						<input class="mail_check_input">
						<Button class="btn btn-primary">인증번호 전송</Button>
					</p>
					<p class="text-white">
						비밀번호 : <input class="pw_input" name="password">
					</p>
					<p class="text-white">
						비밀번호 확인 : <input class="pwck_input">
					</p>
					<p class="text-white">
						닉네임 : <input class="user_input" name="name">
					</p>
					<p class="text-white">
						연락처 : <input class="tel_input" name="tel">
					</p>
					<p class="text-white">
						프로필 사진 :<input class="profil_input" name="proimg">
					</p>
					<input type="button" class="join_button btn-primary" value="가입하기">
				</form>
			</div>
		</div>
	</div>



	<jsp:include page="../init/footer.jsp"></jsp:include>


	<!-- script -->
	<script src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous">
		
	</script>
	<script>
		$(document).ready(function() {
			//회원가입 버튼(회원가입 기능 작동)
			$(".join_button").click(function() {
				$("#join_form").attr("action", "/member/join");
				$("#join_form").submit();
			});
		});
	</script>
</body>
</html>