<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
<style>
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
</head>
<body>
	<form id="join_form" method="post">
		<h2>회원가입</h2><br>
		아이디 : <input class="id_input" name="id"><br>
		<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
		<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
		<span class="id_input_re_3">아이디는 영문 소문자, 숫자만 입력 가능합니다.</span>
		<span class="final_id_ck">아이디를 입력해주세요.</span><br>
		비밀번호 : <input class="pw_input" name="password" type="password" ><br>
		<span class="pw_input_re_1">사용 가능한 비밀번호 입니다.</span>
		<span class="pw_input_re_2">비밀번호는 영문 소문자, 숫자, 특수문자를 모두 사용하여 주세요.</span>
		<span class="final_pw_ck">비밀번호를 입력해주세요.</span><br>
		비밀번호 확인 : <input class="pwck_input" type="password" ><br>
		<span class="pw_input_re_3">비밀번호가 일치합니다.</span>
		<span class="pw_input_re_4">비밀번호가 일치하지 않습니다.</span>
		<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span><br>
		닉네임 : <input class="user_input" name="name"><br>
		<span class="user_input_re_1">사용 가능한 닉네임입니다.</span>
		<span class="user_input_re_2">해당 닉네임이 이미 존재합니다.</span>
		<span class="user_input_re_3">닉네임은 3글자 이상 10글자 이하로 가능합니다.</span>
		<span class="final_name_ck">닉네임을 입력해주세요.</span><br>
		연락처 : <input class="tel_input" name="tel"><br>
		<span class="final_tel_ck">연락처를 입력해주세요.</span><br>
		주소 : <input type="text" class = "form-control" id="post" name="post" maxlength="20" placeholder="우편번호" readonly onclick="findAddr()"><br>
		<input type="text" class = "form-control" id="addr" name="addr" maxlength="20" placeholder="주소" readonly onclick="findAddr()"><br>
		<input type="text" class = "form-control" id="addr2" name="addr2" maxlength="20" placeholder="상세주소"><br>
		프로필 사진 :<input class="profil_input" name="proimg"><br>
		<input type="button" class="join_button" value="가입하기">
	</form>
	
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
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>