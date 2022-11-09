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
/* 로그인폼 css */
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
	background: -webkit-linear-gradient(#fccb90, #d57eeb);
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
/* 여기까지 */

	/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_3{
		color : red;
		display : none;
	}
	/* 비밀번호 유효성 검사된경우 */
	.pw_input_re_1{
		color : green;
		display : none;
	}
	/* 비밀번호 유효성 검사되지않은 경우 */
	.pw_input_re_2{
		color : red;
		display : none;
	}
	/* 비밀번호 확인 된경우 */
	.pw_input_re_3{
		color : green;
		display : none;
	}
	/* 비밀번호 확인 되지않은경우 */
	.pw_input_re_4{
		color : red;
		display : none;
	}
	/* 중복닉네임 존재하지 않는경우 */
	.user_input_re_1{
		color : green;
		display : none;
	}
	/* 중복닉네임 존재하는 경우 */
	.user_input_re_2{
		color : red;
		display : none;
	}
	/* 닉네임 유효성검사 실패 경우 */
	.user_input_re_3{
		color : red;
		display : none;
	}
	/* 유효성 검사 문구 */
 
	.final_id_ck{
	color : red;
	    display: none;
	}
	.final_pw_ck{
	color : red;
	    display: none;
	}
	.final_pwck_ck{
	color : red;
	    display: none;
	}
	.final_name_ck{
	color : red;
	    display: none;
	}
	.final_tel_ck{
	color : red;
	    display: none;
	}
</style>
<meta charset="UTF-8" />
</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<div class="container" style="margin-bottom: 350px; margin-top: 150px;">
		<div class="row">
			<div class="col-lg-3 col-md-2"></div>
			<div class="col-lg-6 col-md-8 login-box mt-0">
				<div class="col-lg-12 login-key mt-4">
					<i class="fa fa-key" aria-hidden="true"></i>
				</div>
				<div class="col-lg-12 login-title">SIGN UP</div>

				<div class="col-lg-12 login-form">
					<div class="col-lg-12 login-form">
						<form id="join_form" enctype="multipart/form-data" method="post">
		<div class="form-group mx-5">
			<input class="id_input inline-block w-100" type="text" name="id" placeholder="아이디"><br>
			<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
			<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			<span class="id_input_re_3">아이디는 영문 소문자, 숫자만 입력 가능합니다.</span>
			<span class="final_id_ck">아이디를 입력해주세요.</span><br>
			<input class="pw_input inline-block w-100" name="password" type="password" placeholder="비밀번호"><br>
			<span class="pw_input_re_1">사용 가능한 비밀번호 입니다.</span>
			<span class="pw_input_re_2">비밀번호는 영문 소문자, 숫자, 특수문자를 모두 사용하여 주세요.</span>
			<span class="final_pw_ck">비밀번호를 입력해주세요.</span><br>
			<input class="pwck_input inline-block w-100" placeholder="비밀번호 확인" type="password" ><br>
			<span class="pw_input_re_3">비밀번호가 일치합니다.</span>
			<span class="pw_input_re_4">비밀번호가 일치하지 않습니다.</span>
			<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span><br>
			<input class="user_input inline-block w-100" type="text" placeholder="닉네임" name="name"><br>
			<span class="user_input_re_1">사용 가능한 닉네임입니다.</span>
			<span class="user_input_re_2">해당 닉네임이 이미 존재합니다.</span>
			<span class="user_input_re_3">닉네임은 3글자 이상 10글자 이하로 가능합니다.</span>
			<span class="final_name_ck">닉네임을 입력해주세요.</span><br>
			<input class="tel_input inline-block w-100" type="text" placeholder="연락처" name="tel"><br>
			<span class="final_tel_ck">연락처를 입력해주세요.</span><br>
			<input type="text" class = "form-control w-25" id="post" name="post" maxlength="20" placeholder="우편번호" readonly onclick="findAddr()"><br>
			<input type="text" class = "form-control" id="addr" name="addr" maxlength="20" placeholder="주소" readonly onclick="findAddr()"><br>
			<input type="text" class = "form-control" id="addr2" name="addr2" maxlength="20" placeholder="상세주소"><br>
			<span class="text-white">프로필 사진 : </span><input class="profil_input" style="color : green;" type="file" name="file"><br>
		</div>
		
		
		<div class="d-flex align-items-center justify-content-center">
		<input type="button" class="join_button button-3 my-5" value="가입하기">
		<a href="/main"class="button-3-border">취소</a>
		</div>
	</form>
					</div>
				</div>
				<div class="col-lg-3 col-md-2"></div>
			</div>
		</div>
	</div>

<script>

		var idCheck = false;
		var idckCheck = false;
		var pwCheck = false;
		var pwckCheck = false;
		var pwckcorCheck = false;
		var nameCheck = false;
		var nameckCheck = false;
		var telCheck = false;
	
		$(document).ready(function(){
			//회원가입 버튼(회원가입 기능 작동)
			$(".join_button").click(function(){

				var id = $('.id_input').val();
				var pw = $('.pw_input').val();
				var pwck = $('.pwck_input').val();
				var name = $('.user_input').val();
				var tel = $('.tel_input').val();

				/* 아이디 유효성검사 */
		        if(id == ""){
		            $('.final_id_ck').css('display','block');
		            idCheck = false;
		        }else{
		            $('.final_id_ck').css('display', 'none');
		            idCheck = true;
		        }

		        /* 비밀번호 유효성 검사 */
		        if(pw == ""){
		            $('.final_pw_ck').css('display','block');
		            pwCheck = false;
		        }else{
		            $('.final_pw_ck').css('display', 'none');
		            pwCheck = true;
		        }

		        /* 비밀번호 확인 유효성 검사 */
		        if(pwck == ""){
		            $('.final_pwck_ck').css('display','block');
		            pwckCheck = false;
		        }else{
		            $('.final_pwck_ck').css('display', 'none');
		            pwckCheck = true;
		        }

		        /* 닉네임 유효성 검사 */
		        if(name == ""){
		            $('.final_name_ck').css('display','block');
		            nameCheck = false;
		        }else{
		            $('.final_name_ck').css('display', 'none');
		            nameCheck = true;
		        }

		        /* 연락처 유효성 검사 */
		        if(tel == ""){
		            $('.final_tel_ck').css('display','block');
		            telCheck = false;
		        }else{
		            $('.final_tel_ck').css('display', 'none');
		            telCheck = true;
		        }

		        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&nameckCheck&&telCheck){

					$("#join_form").attr("action", "/member/join");
					$("#join_form").submit();
					
			    }

				return false;
				
			});
		});
		
		//아이디 중복검사
		$('.id_input').on("propertychange change keyup paste input", function(){

			var memberId = $('.id_input').val();			// .id_input에 입력되는 값
			var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$.ajax({
				type : "post",
				url : "/member/memberIdChk",
				data : data,
				success : function(result){
					// 정규식 유효성 검사 체크
					if(result == 'fail2'){
						$('.id_input_re_1').css("display", "none");
						$('.id_input_re_2').css("display", "none");
						$('.id_input_re_3').css("display","inline-block");
						idckCheck = false;
					}
					// 중복체크
					if(result == 'success'){
						$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display", "none");		
						$('.id_input_re_3').css("display", "none");
						idckCheck = true;			
					} else if (result == 'fail') {
						$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");		
						$('.id_input_re_3').css("display", "none");
						idckCheck = false;			
					}
				}// success 종료
			}); // ajax 종료

		});// function 종료
		
		//닉네임 중복검사
		$('.user_input').on("propertychange change keyup paste input", function(){

			var membername = $('.user_input').val();			// .id_input에 입력되는 값
			var data = {membername : membername}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$.ajax({
				type : "post",
				url : "/member/memberNameChk",
				data : data,
				success : function(result){
					// 정규식 유효성 검사 체크
					if(result == 'fail2'){
						$('.user_input_re_1').css("display", "none");
						$('.user_input_re_2').css("display", "none");
						$('.user_input_re_3').css("display","inline-block");
						nameckCheck = false;
					}
					// 중복체크
					if(result == 'success'){
						$('.user_input_re_1').css("display","inline-block");
						$('.user_input_re_2').css("display", "none");		
						$('.user_input_re_3').css("display", "none");
						nameckCheck = true;			
					} else if (result == 'fail') {
						$('.user_input_re_2').css("display","inline-block");
						$('.user_input_re_1').css("display", "none");		
						$('.user_input_re_3').css("display", "none");
						nameckCheck = false;			
					}
				}// success 종료
			}); // ajax 종료

		});// function 종료


		
		
		//비밀번호 유효성검사
		$('.pw_input').on("propertychange change keyup paste input", function(){

			var memberPw = $('.pw_input').val();			// .id_input에 입력되는 값
			var data = {memberPw : memberPw}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$.ajax({
				type : "post",
				url : "/member/memberPwChk",
				data : data,
				success : function(result){
					
					if(result == 'success'){
						
						$('.pw_input_re_1').css("display","inline-block");
						$('.pw_input_re_2').css("display", "none");
						$('.final_pwck_ck').css('display', 'none');
						pwckcorCheck = true;
					} else if (result == 'fail') {
						
						$('.pw_input_re_1').css("display", "none");		
						$('.pw_input_re_2').css("display","inline-block");
						$('.final_pwck_ck').css('display', 'none');
						pwckcorCheck = false;
					}
				}// success 종료
			}); // ajax 종료
		});

		
		//비밀번호 중복검사
		$('.pwck_input').on("propertychange change keyup paste input", function(){

			var memberPw = $('.pw_input').val();
			var rememberPw = $('.pwck_input').val();
			
					
			if(memberPw == rememberPw){
				
				$('.pw_input_re_3').css("display","inline-block");
				$('.pw_input_re_4').css("display", "none");
				$('.final_pwck_ck').css('display', 'none');
				pwckcorCheck = true;
					
			} else{
				
				$('.pw_input_re_3').css("display", "none");		
				$('.pw_input_re_4').css("display","inline-block");
				$('.final_pwck_ck').css('display', 'none');
				pwckcorCheck = false;
			}
		});

		function findAddr(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	
		        	console.log(data);
		        	
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var roadAddr = data.roadAddress; // 도로명 주소 변수
		            var jibunAddr = data.jibunAddress; // 지번 주소 변수
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('post').value = data.zonecode;
		            if(roadAddr !== ''){
		                document.getElementById("addr").value = roadAddr;
		            } 
		            else if(jibunAddr !== ''){
		                document.getElementById("addr").value = jibunAddr;
		            }
		        }
		    }).open();
		}
	</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


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