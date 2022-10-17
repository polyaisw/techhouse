<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>...</title>
</head>
<body>
<!-- nav -->
	<div class="container">
		<div class="row">
			<div class="col">
				<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="#"></a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse justify-content-center"
							id="navbarNavDropdown">
							<ul class="navbar-nav ">
								<li class="nav-item dropdown pe-3"><a
									class="nav-link dropdown" href="#" id="navbarDropdownMenuLink"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티
										게시판</a>
									<ul class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item" href="/controller/free">자유 게시판</a></li>
										<li><a class="dropdown-item" href="#">인증 게시판</a></li>
										<li><a class="dropdown-item" href="#">취미 공유</a></li>
									</ul></li>
								<li class="nav-item dropdown pe-3"><a
									class="nav-link dropdown" href="#" id="navbarDropdownMenuLink"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">중고
										거래 게시판</a>
									<ul class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item" href="/controller/tradeInfo">중고거래 안내</a></li>
										<li><a class="dropdown-item" href="#">거래 게시판</a></li>
										<li><a class="dropdown-item" href="#">벤치마킹 인증</a></li>
										<li><a class="dropdown-item" href="#">거래 후기</a></li>
									</ul></li>
								<li class="nav-item dropdown pe-3"><a
									class="nav-link dropdown" href="#" id="navbarDropdownMenuLink"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">뉴스/핫이슈</a>
									<ul class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item" href="#">IT/트렌드</a></li>
										<li><a class="dropdown-item" href="#">핫이슈</a></li>
										<li><a class="dropdown-item" href="#">게임 출시 정보</a></li>
									</ul></li>
								<li class="nav-item dropdown pe-3"><a
									class="nav-link dropdown" href="#" id="navbarDropdownMenuLink"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">상품
										추첨</a>
									<ul class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item" href="#">룰렛</a></li>
										<li><a class="dropdown-item" href="/controller/product">이달의 상품</a></li>
									</ul></li>
								<li class="nav-item dropdown pe-3"><a
									class="nav-link dropdown" href="#" id="navbarDropdownMenuLink"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">고객센터</a>
									<ul class="dropdown-menu"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item" href="#">사기피해 신고</a></li>
										<li><a class="dropdown-item" href="#">1:1 문의</a></li>
										<li><a class="dropdown-item" href="/controller/faq">FAQ</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>