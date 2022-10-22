<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>TECH HOUSE</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
<style>
	/* 로그인 실패시 경고글 */
	.login_warn{
	    margin-top: 30px;
	    text-align: center;
	    color : red;
	}
</style>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/default.css" rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->
</head>
<body>
	<jsp:include page="init/header.jsp"></jsp:include>
	<jsp:include page="init/nav.jsp"></jsp:include>





	<div class="container">
		<div class="row">
			<div class="col-xl-8 d-flex flex-column">
				<!-- searchbar -->
				<form action="#" method="get" class="mx-0 my-3 w-100 ">
					<div class="mx-auto">
						<div class="form-outline">
							<i class="fa-solid fa-magnifying-glass p-2" style="color: white;"></i>
							<input type="search" id="form1" class="form-control w-100 m-0"
								placeholder="search" />
						</div>
					</div>
				</form>
				<!-- slide bar -->
				<p>
				<h3 class="h3 text-white">놓쳐서는 안될 가장 핫한 소식!</h3>
				<div id="carouselExampleCaptions" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="https://image.shutterstock.com/image-photo/examples-word-written-on-wood-260nw-1808343373.jpg"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>First slide label</h5>
								<p>Some representative placeholder content for the first
									slide.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img
								src="https://image.shutterstock.com/image-photo/examples-word-written-on-wood-260nw-1808343373.jpg"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>Second slide label</h5>
								<p>Some representative placeholder content for the second
									slide.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img
								src="https://image.shutterstock.com/image-photo/examples-word-written-on-wood-260nw-1808343373.jpg"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5>Third slide label</h5>
								<p>Some representative placeholder content for the third
									slide.</p>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col-xl-4 pe-3 ">
				<!-- login -->
				<c:if test="${ member == null }">
					<form id="login_form" method="post">
						<h5>
							<span class="entypo-login"><i class="fa fa-sign-in"></i></span>
							Login
						</h5>
						<button class="submit b2" type="button">
							<span class="login_button">
								<i class="fa fa-lock"></i>
							</span>
						</button>
						<span class="entypo-user inputUserIcon"> <i
							class="fa fa-user"></i>
						</span> 
						<input type="text" name="id" class="id_input" placeholder="ID" /> 
						<span class="entypo-key inputPassIcon"> <i class="fa fa-key"></i>
						</span> 
						<input type="password" name="password" class="pw_input" placeholder="Password" />
						
						<div class=" d-flex justify-content-end">
							<a class="text-white" href="/member/join">sign up</a>
							<a class="text-white  ps-3" href="#">find account</a>
						</div>
					</form>
				</c:if>
				<c:if test="${ member != null }">
					<!-- 로그인 되었을때 내정보 부분은 이곳에 만들면 됩니다. -->
					<span>회원 : ${ member.name }</span>
					<span>포인트 : <fmt:formatNumber value="${ member.point }" pattern="#,###"/></span>
					<a href="/member/mypage">마이페이지</a>
					<a href="/member/logout">로그아웃</a>
				</c:if>
				<!-- best board -->
				<div class="container mt-5">
					<div class="card  mx-auto " style="max-width: 22rem;">
						<div class="card-header text-center">
							<i class="fa-brands fa-hotjar px-2"></i><a href="#">실시간 BEST</a>
						</div>
						<div class="card-body p-1">
							<ul class="list-group">
								<li
									class="px-3 list-group-item d-flex justify-content-between align-items-center">
									<i class="fa-solid fa-1 text-white"></i><a href="#">
										aaaaaaaaaaaaaaaaaaaa</a> <span class="badge badge-pill">22</span>
								</li>
								<li
									class="px-3 list-group-item d-flex justify-content-between align-items-center">
									<i class="fa-solid fa-2 text-white"></i><a href="#">
										aaaaaaaaaaaaaaaaaaaa</a> <span class="badge badge-pill">22</span>
								</li>
								<li
									class="px-3 list-group-item d-flex justify-content-between align-items-center">
									<i class="fa-solid fa-3 text-white"></i><a href="#">
										aaaaaaaaaaaaaaaaaaaa</a> <span class="badge badge-pill">22</span>
								</li>
								<li
									class="px-3 list-group-item d-flex justify-content-between align-items-center">
									<i class="fa-solid fa-4 text-white"></i><a href="#">
										aaaaaaaaaaaaaaaaaaaa</a> <span class="badge badge-pill">22</span>
								</li>
								<li
									class="px-3 list-group-item d-flex justify-content-between align-items-center">
									<i class="fa-solid fa-5 text-white"></i><a href="#">
										aaaaaaaaaaaaaaaaaaaa</a> <span class="badge badge-pill">22</span>
								</li>
								<li
									class="px-3 list-group-item d-flex justify-content-between align-items-center">
									<i class="fa-solid fa-6 text-white"></i><a href="#">
										aaaaaaaaaaaaaaaaaaaa</a> <span class="badge badge-pill">22</span>
								</li>
								<li
									class="px-3 list-group-item d-flex justify-content-between align-items-center">
									<i class="fa-solid fa-7 text-white"></i><a href="#">
										aaaaaaaaaaaaaaaaaaaa</a> <span class="badge badge-pill">22</span>
								</li>
								<li
									class="px-3 list-group-item d-flex justify-content-between align-items-center">
									<i class="fa-solid fa-8 text-white"></i><a href="#">
										aaaaaaaaaaaaaaaaaaaa</a> <span class="badge badge-pill">22</span>
								</li>
								<li
									class="px-3 list-group-item d-flex justify-content-between align-items-center">
									<i class="fa-solid fa-9 text-white"></i><a href="#">
										aaaaaaaaaaaaaaaaaaaa</a> <span class="badge badge-pill">22</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr class="hr-14">
		<div class="container">
			<div class="row">
				<div class="col-xl-8 col-md-6 bg-warning">
					<!-- news -->
					<h1 class="text-white">뉴스 컨테이너</h1>
					<p>p
					<p>p
					<p>p
					<p>p
					<p>p
					<p>p
					<p>p
					<p>p
				</div>
				<div class="col-xl-4 col-md-6 bg-primary">
					<!-- attend -->
					<div class="attendance container px-0">
						<div class="bg-danger">
							<h5>출석체크</h5>
							<p>p
							<p>p
							<p>p
						</div>
					</div>
					<!-- apply -->
					<div class="card border-secondary mb-3 mx-auto"
						style="max-width: 25rem;">
						<div class="card-header text-center">
							<i class="fa-brands fa-hotjar px-2"></i><a href="#">이번달 응모 상품</a>
						</div>
						<div class="card-body p-1">
							<a href="#"><img
								src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.scdn.co%2Fimage%2Fab6761610000e5eba0fcb7f2701596f6e363ae36&type=sc960_832"
								class="img-fluid rounded mx-auto d-block" width="250px"
								height="250px" alt="..."></a>
							<p>
							<h5 class="h5 text-center text-white">남은 시간 : 71:59:59</h5>
							<p>
							<h5 class="h5 text-center text-white">응모자 수 : 32</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- boardset -->
		<div class="container ">
			<div class="row">
				<div class="col-xl-6 bg-Secondary">
					<p>
					<h1 class="text-white">거래 게시판</h1>
					<p>p
					<p>p
					<p>p
					<p>p
					<p>p
				</div>
				<div class="col-xl-6 bg-danger">
					<p>
					<h1>인증 게시판</h1>
					<p>p
					<p>p
					<p>p
					<p>p
					<p>p
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 col-md-6 bg-success">
					<p>
					<h1>자유게시판</h1>
					<p>p
					<p>p
					<p>p
					<p>p
					<p>p
				</div>
				<div class="col-xl-4 col-md-6 bg-primary">
					<p>
					<h1>벤치마크 인증</h1>
					<p>p
					<p>p
					<p>p
					<p>p
					<p>p
				</div>
				<div class="col-xl-4 col-md-6 bg-info">
					<p>
					<h1>취미공유</h1>
					<p>p
					<p>p
					<p>p
					<p>p
					<p>p
				</div>
			</div>
		</div>
		<div class="container mt-5 bg-info">
			<div class="row">
				<div class="col">
					<p>
					<h1 class="text-white">광고배너</h1>
					<p>p
					<p>p
					<p>p
				</div>
			</div>
		</div>
		<hr class="hr-14">
	</div>


	<jsp:include page="init/footer.jsp"></jsp:include>

	<!-- Bootstrap core JS-->
	<script src="https://kit.fontawesome.com/5547fa07a6.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="/resources/js/scripts.js"></script>
	
	<script>
	 
	    /* 로그인 버튼 클릭 메서드 */
	    $(".login_button").click(function(){
	        
	        //alert("로그인 버튼 작동");
	    	/* 로그인 메서드 서버 요청 */
	        $("#login_form").attr("action", "/member/login");
	        $("#login_form").submit();
	        
	    });
	    
	    $(".pw_input, .id_input").on("keyup",function(e){
	        if(e.keyCode == 13) {
		        $("#login_form").attr("action", "/member/login");
		        $("#login_form").submit();
	        }
	    });
	 
	</script>
</body>
</html>
