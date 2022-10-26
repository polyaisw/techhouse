<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TECH HOUSE - 마이 페이지</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/resources/css/default.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/mypage.css" rel="stylesheet">
<style>
	/* 로그인 실패시 경고글 */
	.mypage_warn{
	    margin-top: 30px;
	    text-align: center;
	    color : red;
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
	/* 유효성 검사 문구 */
 
	.final_id_ck{
	    display: none;
	}
	.final_pw_ck{
	    display: none;
	}
	.final_pwck_ck{
	    display: none;
	}
	.final_name_ck{
	    display: none;
	}
	.final_tel_ck{
	    display: none;
	}
</style>
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
						<c:if test="${ mypageCK == null }">
							<form id="mypage" method="post">
								<h2>본인 확인</h2><br>
								<input class="id_input" name="id" value="${ member.id }" style="display:none" readonly>
								비밀번호 : <input class="pw_input" name="password" type="password"><br>
								
								<c:if test = "${result == 0 }">
						                <div class = "mypage_warn">비밀번호를 잘못 입력하셨습니다.</div>
						        </c:if>
								<input type="button" class="my_button" value="확인">
							</form>
						</c:if>
						<c:if test="${ mypageCK != null }">
							<p>본인 재확인에 성공!</p>
							<form id="user_edit" method="post">
								
								<h2>회원 정보 수정</h2><br>
								아이디 : <input class="id_input" name="id" value="${ member.id }" readonly>
								<span class="final_id_ck">아이디를 입력해주세요.</span><br>
								비밀번호 : <input class="pw_input" name="password" type="password" ><br>
								<span class="pw_input_re_1">사용 가능한 비밀번호 입니다.</span>
								<span class="pw_input_re_2">비밀번호는 영문 소문자, 숫자, 특수문자를 모두 사용하여 주세요.</span>
								<span class="final_pw_ck">비밀번호를 입력해주세요.</span><br>
								비밀번호 확인 : <input class="pwck_input" type="password" ><br>
								<span class="pw_input_re_3">비밀번호가 일치합니다.</span>
								<span class="pw_input_re_4">비밀번호가 일치하지 않습니다.</span>
								<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span><br>
								닉네임 : <input class="user_input" name="name" value="${ member.name }"><br>
								<span class="final_name_ck">닉네임을 입력해주세요.</span><br>
								연락처 : <input class="tel_input" name="tel" value="${ member.tel }"><br>
								<span class="final_tel_ck">연락처를 입력해주세요.</span><br>
								주소 : <input type="text" class = "form-control" id="post" name="post" maxlength="20" placeholder="우편번호" value="${ member.post }" readonly onclick="findAddr()"><br>
								<input type="text" class = "form-control" id="addr" name="addr" maxlength="20" placeholder="주소" value="${ member.addr }" readonly onclick="findAddr()"><br>
								<input type="text" class = "form-control" id="addr2" name="addr2" maxlength="20" placeholder="상세주소" value="${ member.addr2 }"><br>
								프로필 사진 :<input class="profil_input" name="proimg"><br>
								<input type="button" class="edit_button" value="수정완료">
							</form>
						</c:if>
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
						role="tab" aria-controls="list-home">개인정보</a>
						<a class="list-group-item list-group-item-action"
						id="list-profile-list" data-bs-toggle="list" href="#list-board"
						role="tab" aria-controls="list-profile">게시글 보기</a> 
						<a class="list-group-item list-group-item-action"
						id="list-messages-list" data-bs-toggle="list" href="#list-trade"
						role="tab" aria-controls="list-messages">거래 내역</a> 
						<a class="list-group-item list-group-item-action"
						id="list-settings-list" data-bs-toggle="list"
						href="#list-commission" role="tab" 
						aria-controls="list-settings">고객상담 내역</a> 
						<a class="list-group-item list-group-item-action"
						id="list-settings-list" data-bs-toggle="list" href="#list-delete"
						role="tab" aria-controls="list-settings">회원 탈퇴</a>
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
	<!-- <script src="/resources/js/scripts.js"></script> -->
	<script>
		$(".my_button").click(function(){
			$("#mypage").attr("action", "/member/mypage.do");
			$("#mypage").submit();
		});
	    
	    $(".pw_input").on("keyup",function(e){
	        if(e.keyCode == 13) {
		        $("#mypage").attr("action", "/member/mypage.do");
		        $("#mypage").submit();
	        }
	    });

	    var pwCheck = false;
		var pwckCheck = false;
		var pwckcorCheck = false;
		var nameCheck = false;
		var telCheck = false;
	
		$(document).ready(function(){
			//회원가입 버튼(회원가입 기능 작동)
			$(".edit_button").click(function(){

				var pw = $('.pw_input').val();
				var pwck = $('.pwck_input').val();
				var name = $('.user_input').val();
				var tel = $('.tel_input').val();


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

		        if(pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&telCheck){

					$("#user_edit").attr("action", "/member/mypage");
					$("#user_edit").submit();
					
			    }

				return false;
				
			});
		});

		
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