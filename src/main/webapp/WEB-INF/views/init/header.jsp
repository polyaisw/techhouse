<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>...</title>
<style>
#myPage-btn {
	background-color: #27292a;
	color: #666;
	border: 0;
	outline: 0;
}

#myPage-btn:hover {
	background-color: #e75e8d;
	color: white;
}

.offcanvas {
	background-color: #222222;
}

@media ( max-width : 992px) {
	#myPage-btn {
		display: none;
	}
	#myPage-logo {
		display: none;
	}
	.main-nav .nav>li:last-child {
		display: none;
	}
}

.off-ul {
	display: block !important;
	position: static !important;
	top: 100% !important;
	left: 0 !important;
}

.off-li {
	width: 126px !important;
	position: static !important;
	display: inline !important;
}

.header-area {
	position: fixed;
	background-color: #1f2122;
	top: 0px;
	border-bottom: 1px solid var(--bs-success);
}

.header-area .main-nav .nav li a {
	font-weight: bold;
	color: #bbbbbb;
}

.header-area .main-nav .nav li:hover>a, .header-area .main-nav .nav li>a.active
	{
	color: #ffffff;
	background-color: #198754;
}

a:hover {
	color: var(--bs-teal);
	transition: all .5s;
}

#myPage-btn:hover {
	background-color: #198754;
}

.most-popular {
	border-bottom: 1px solid var(--bs-success);
}

.header-title {
	color: #FFFFFF;
	background: inherit;
	text-shadow: 0 0 10px #FFFFFF;
}

.logo:hover {
	-webkit-animation: pulsate-bck 1.5s ease-in-out infinite both;
	animation: pulsate-bck 1.5s ease-in-out infinite both;
}

#back2Top {
	width: 40px;
	line-height: 40px;
	overflow: hidden;
	z-index: 999;
	display: none;
	cursor: pointer;
	position: fixed;
	bottom: 50px;
	right: 50px;
	background-color: inherit;
	color: #b5b5b5;
	text-align: center;
	font-size: 30px;
	text-decoration: none;
}

#back2Top:hover>i {
	color: var(--bs-success);
	transition: all .5s;
}

@
-webkit-keyframes pulsate-bck { 0% {
	-webkit-transform: scale(1);
	transform: scale(1);
}

50%
{
-webkit-transform
:
scale(
0.95
);
transform
:
scale(
0.95
);
}
100%
{
-webkit-transform
:
scale(
1
);
transform
:
scale(
1
);
}
}
@keyframes pulsate-bck { 0% {
	-webkit-transform: scale(1);
	transform: scale(1);
}
50%
{
-webkit-transform
:
scale(
0.95
);
transform
:
scale(
0.95
);}
100%
{-webkit-transform:
scale(
1
);
transform
:
scale(
1
);
}
}
</style>
</head>
<body>
	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container mt-0" style="width: 1280px;">
			<div class="row">
				<div class="col-12 px-0">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->

						<a href="/" class="logo"> <span class="h1 header-title">TECH
								HOUSE</span>
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->

						<ul class="nav align-items-center px-0">
							<li><a href="/board/community/free">커뮤니티</a>
								<ul>
									<li><a href="/board/community/free">자유게시판</a></li>
									<li><a href="/board/community/mysetting">인증게시판</a></li>
									<li><a href="/board/community/hobby">취미공유</a></li>
								</ul></li>
							<li><a href="/board/trade/tradeInfo">중고 거래</a>
								<ul>
									<li><a href="/board/trade/tradeInfo">중고거래안내</a></li>
									<li><a href="/board/trade/tradeBoard">거래게시판</a></li>
									<li><a href="/board/trade/aftertrade">거래후기</a></li>
								</ul></li>

							<li><a href="/board/news/issue">뉴스</a>
								<ul>
									<li><a href="/board/news/trend">IT/트렌드</a></li>
									<li><a href="/board/news/issue">핫이슈</a></li>
									<li><a href="/board/news/gameInfo">게임출시정보</a></li>
									<li><a href="/board/news/hotDeal">꿀딜/장터</a></li>
								</ul></li>
							<li><a href="/board/apply/product">응모상품</a>
								<ul>
									<li><a href="javascript:alert('준비중입니다.')">룰렛</a></li>
									<li><a href="/board/apply/product">응모추첨</a></li>
								</ul></li>

							<c:if test="${member == null }">
								<li><a href="/member/login">Sign in <i
										class="fa-solid fa-right-to-bracket" style="font-size: 18px"></i>&nbsp;&nbsp;
								</a></li>
							</c:if>
							<c:if test="${member != null}">
								<li>
									<button id="myPage-btn" type="button"
										class="button-1 px-3  text-center" data-bs-toggle="offcanvas"
										data-bs-target="#offcanvasRight"
										aria-controls="offcanvasRight">
										<i class="fa-solid fa-bars " id="myPage-logo"
											style="font-size: 24px;"></i>
									</button>

									<div class="offcanvas offcanvas-end opacity-75" tabindex="-1"
										id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
										<!-- 오프캔바스안쪽 {s} -->
										<div class="offcanvas-header" style="color: #666;">
											<a href="/member/logout" class="d-block"><span
												class="me-2 fw-bold">logout</span><i
												class="fa-solid fa-right-to-bracket fs-5"></i></a>
											<button type="button" class="button-3">
												<span class="fw-bold">쪽지함</span>
											</button>

										</div>
										<hr class="my-0 text-white">
										<button type="button" class="btn-close"
											data-bs-dismiss="offcanvas" aria-label="Close"></button>
										<div class="offcanvas-body mx-2">
											<div class="user-info-box">
												<img src="/resources/images/user_upload/${member.profileimg }"
													class="img-fluid rounded-circle text-center d-block mx-auto mb-3"
													style="width: 180px; height: 180px;">
												<div
													class="info-box-inner d-flex justify-content-between mb-3 ">
													<p class="text-white fw-bold text-start">${member.name }님!</p>
													<p class="text-warning fw-bold text-start">
														<span class="text-white">rank : </span> ${member.rank }
													</p>
												</div>

											</div>
											<c:if test="${ member.rank != '관리자' }">
												<ul class="off-ul">
													<li class="off-li"><a href="/member/mypage"
														class="text-white">정보변경</a></li>
													<li class="off-li"><a type="submit"
														href="/member/board?userName=${ member.name }"
														class="text-white">작성 게시글 목록</a></li>
													<li class="off-li"><a
														href="/member/trade?userName=${ member.name }"
														class="text-white">작성 판매글 목록</a></li>
													<li class="off-li"><a href="/member/mypage_qna?userName=${ member.name }" class="text-white">문의
															내역</a></li>
												</ul>
											</c:if>
											<c:if test="${ member.rank == '관리자' }">
												<ul class="off-ul">
													<li class="off-li"><a href="/admin/admin_users"
														class="text-white">회원조회</a></li>
													<li class="off-li"><a type="submit"
														href="/admin/board/"
														class="text-white">회원 게시글 목록</a></li>
													<li class="off-li"><a
														href="/admin/trade/"
														class="text-white">회원 판매글 목록</a></li>
													<li class="off-li"><a href="/admin/admin_qna" class="text-white">문의
															내역</a></li>
												</ul>
											</c:if>
										</div>
										<hr class="" style="color: var(--bs-success)">
										<div class="offcanvas-footer mx-2">
											<c:if test="${member.rank eq '관리자'}"></c:if>
											<c:if test="${member.rank ne '관리자'}">
												<a href="/member/my_del"
													class="text-danger fs-bold text-start">회원탈퇴</a>
											</c:if>
										</div>
										<!-- 오프캔바스안쪽 {e}-->

									</div>


								</li>


							</c:if>

						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>

	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<a id="back2Top" title="top으로 이동" href="#"><i
		class="fa-solid fa-chevron-up"></i></a>
	<script>
		/*Scroll to top when arrow up clicked BEGIN*/
		$(window).scroll(function() {
			var height = $(window).scrollTop();
			if (height > 300) {
				$('#back2Top').fadeIn();
			} else {
				$('#back2Top').fadeOut();
			}
		});
		$(document).ready(function() {
			$("#back2Top").click(function(event) {
				event.preventDefault();
				$("html, body").animate({
					scrollTop : 0
				}, 0);
				return false;
			});

		});
		/*Scroll to top when arrow up clicked END*/
	</script>
</body>

</html>