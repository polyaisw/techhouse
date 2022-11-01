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

/* 	
	.main-nav ul ul {
	display:none;
	position:absolute;
	}
	.main-nav li:hover > ul{
	display:block;
	}
	
	.main-nav li:hover > ul li a {
		color:666;
	} */
</style>
</head>
<body>
	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container mt-0">
			<div class="row">
				<div class="col-12 px-0">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->

						<a href="/" class="logo"> <span class="h1">TECH HOUSE</span>
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
									<li><a href="/board/trade/mybench">벤치마킹인증</a></li>
									<li><a href="/board/trade/aftertrade">거래후기</a></li>
								</ul></li>

							<li><a href="/board/news/issue">뉴스</a>
								<ul>
									<li><a href="/board/news/trend">IT/트렌드</a></li>
									<li><a href="/board/news/issue">핫이슈</a></li>
									<li><a href="/board/news/gameInfo">게임출시정보</a></li>
									<li><a href="/board/news/hotDeal">꿀딜/장터</a></li>
								</ul>
							</li>
							<li><a href="/board/apply/product">응모상품</a>
								<ul>
									<li><a href="/board/apply/roulette">룰렛</a></li>
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

									<div class="offcanvas offcanvas-end" tabindex="-1"
										id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
										<div class="offcanvas-header">
											<h5 class="offcanvas-title" id="offcanvasRightLabel">Offcanvas
												right</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="offcanvas" aria-label="Close"></button>
										</div>
										<div class="offcanvas-body">...</div>
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
</body>
</html>