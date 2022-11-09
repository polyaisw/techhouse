<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>TECH HOUSE - 거래게시판</title>

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
<link rel="stylesheet" href="/resources/css/paging.css">
<link rel="stylesheet" href="/resources/css/search.css">
<script type="text/javascript">
	function fn_prev(page, range, rangeSize, keyword) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + keyword;
		location.href = url;
	}
	function fn_pagination(page, range, rangeSize, keyword) {
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&searchKeyword=" + keyword;
		location.href = url;
	}
	function fn_next(page, range, rangeSize, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&searchKeyword=" + keyword;
		location.href = url;
	}
</script>
<style>
.signup>span:hover {
	color: white !important;
}

.info-box {
	border-color: var(--bs-cyan) !important;
}

.active>.page-link, .page-link.active {
	z-index: 3;
	color: white;
	background-color: var(--bs-teal);
	border-color: inherit;
}
</style>
</head>

<body>

	<c:url var="getPageRange" value="/board/trade/tradeBoard">
		<c:param name="page" value="${pagination.page}" />
		<c:param name="range" value="${pagination.range}" />

	</c:url>
	<c:url var="getPageUrl" value="board/trade/tradeBoard">
	</c:url>
	<c:set var="category" value="거래게시판" />

	<jsp:include page="../../init/header.jsp"></jsp:include>
	<jsp:include page="../../init/nav.jsp"></jsp:include>

	<div class="container text-white">
		<div class="page-content" style="margin-top: 84px;">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/main">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page"><c:out
							value="${category }" /></li>
				</ol>
			</nav>
			<div class="row">
				<div class="col-md-9">
					<div class="most-popular title">
						<h2>
							<c:out value="${category }" />
						</h2>
						<div class="notice text-white mt-5" style="">
							<ul>
								<c:forEach var="noticeList" items="${noticeList }">
									<li class="d-flex justify-content-between align-items-center ">
										<div class="title-unit">
											<span class="badge" style="font-size: 15px;">공지 <a
												href="/board/contentForm?b_seq=${noticeList.b_seq }"
												class="d-inline-block text-truncate px-2"
												style="max-width: 600px;">${noticeList.b_title } </a></span>
										</div>
										<div class="normal-unit">
											<span class="pe-3"> ${noticeList.b_writer } </span> <span><i
												class="fa-solid fa-eye text-white"></i> ${noticeList.b_views }
											</span>
										</div>
									</li>
									<hr class="hr inline-block my-1">
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="menu-list mt-5">
						<ul class="d-flex flex-row justify-content-around">
							<li><a href="/board/trade/tradeBoard" class="button-4">거래
									게시판</a></li>
							<li><a href="/board/trade/aftertrade" class="button-4">거래후기</a></li>
							<li><a href="/board/trade/tradeInfo" class="button-4">중고거래
									안내</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 ps-2 text-center" style="margin-top: 60px;">
					<c:if test="${member eq null }">
						<a href="/member/login"
							class="loginBtn p-2   btn btn-success  d-block mb-2"> <span
							class=""> 로그인 하기 </span></a>

					</c:if>
					<c:if test="${member ne null }">
						<div class="most-popular user text-white pb-2 mt-0">
							<h4>infomation</h4>
							<div class="info-box  rounded my-2 d-block"
								style="border-color: var(--bs-cyan);">
								<h6 class="text-warning">${member.rank}</h6>
								<h6 class="mt-4">
									<em>${member.name }</em>님 <br>환영합니다.
								</h6>
								<div class="info-box-main mt-4" style="color: #666666;">
									<div class="d-flex justify-content-between mx-2">
										<h6 class="">point :</h6>
										<span class="">${member.point}</span>
									</div>
									<div class="d-flex justify-content-between mx-2 mb-0">
										<h6 class="">ticket :</h6>
										<span class="">${member.ticket}</span>
									</div>
								</div>


							</div>
						</div>
					</c:if>
				</div>
			</div>
			<div class="row mt-4">
				<c:forEach var="tradeList" items="${list}">
					<div class="col-lg-3 col-sm-6">
						<div class="item pt-1 my-2">
							<c:if test="${tradeList.t_state eq '판매중'}">
								<span class="badge rounded-pill text-bg-light d-inline mt-3">${tradeList.t_state }</span>
							</c:if>
							<c:if test="${tradeList.t_state eq '거래중'}">
								<span class="badge rounded-pill text-bg-warning d-inline mt-3">${tradeList.t_state }</span>
							</c:if>
							<c:if test="${tradeList.t_state eq '거래완료'}">
								<span class="badge rounded-pill text-bg-primary d-inline mt-3">${tradeList.t_state }</span>
							</c:if>

							<span class="badge rounded-pill d-inline mt-3"
								style="color: var(--bs-teal)">인증</span>


							<c:choose>
								<c:when test="${tradeList.t_state eq '거래완료'}">
									<div class="position-relative">
										<a href="/board/contentTradeForm?t_seq=${tradeList.t_seq }">
											<img src="/resources/images/user_upload/${tradeList.t_uploadImg }"
											width="250px" height="200px" class="rounded mt-1" alt="">
										</a>
										<div
											class="bg-dark position-absolute w-100 h-100 top-0 opacity-50"></div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="position-relative">
										<a href="/board/contentTradeForm?t_seq=${tradeList.t_seq }">
												<img src="/resources/images/user_upload/${tradeList.t_uploadImg }"
											width="250px" height="200px" class="rounded mt-1" alt="">
										</a>
									</div>
								</c:otherwise>
							</c:choose>

							<div class="inline">
								<a href="/board/contentTradeForm?t_seq=${tradeList.t_seq }">
									<span class="fw-bold">${tradeList.t_title}</span>
								</a>
								<p class="fw-bold">${tradeList.t_price }원</p>
							</div>
							<ul>
								<li class="d-flex align-items-center"><i
									class="fa-solid fa-medal text-danger me-2"></i> <span
									class="text-white">${tradeList.t_writer }</span></li>
								<li><i class="fa-solid fa-eye text-white me-2"></i><span>${tradeList.t_views }</span>
							</ul>
						</div>
					</div>
				</c:forEach>
				<div class="col-md-12">
					<div class="search-input text-center  w-100 mx-auto mb-5">
						<form id="search" action="/searchAction" method="get"
							name="input-form" class="d-inline-block ">
							<input type="text" placeholder="글 검색" id='searchText'
								name="searchKeyword" style="background-color: #1f2122">
							<i class="fa fa-search"></i>

							<%-- <input type="text" name="b_category"class="d-none" value="<c:out value="${category }"/>">	
								<input type="text" name="url" class="d-none" value="${getPageUrl }"> --%>
							<input type="submit" class="d-none">
						</form>
					</div>
				</div>
				<div class="col">
					<!-- pagination{s} -->
					<div id="paginationBox ">
						<ul class="pagination d-flex justify-content-center">
							<c:if test="${pagination.prev}">
								<li class="page-item"><a class="page-link" href="#"
									onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${keyword }')">Previous</a></li>
							</c:if>
							<c:forEach begin="${pagination.startPage}"
								end="${pagination.endPage}" var="idx">
								<li
									class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
									class="page-link" href="#"
									onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}','${keyword }')">
										${idx} </a></li>
							</c:forEach>
							<c:if test="${pagination.next}">
								<li class="page-item"><a class="page-link" href="#"
									onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}','${keyword }')">Next</a></li>
							</c:if>
						</ul>
					</div>
					<!-- pagination{e} -->
				</div>

				<div class="row">
					<div class="col">
						<c:if test="${member != null}">
							<c:if test="${member.rank eq '관리자' }">
								<a href="/board/insertNoticeBoardForm" class="button-4 mt-5">공지사항
									작성하기</a>
							</c:if>
							<c:if test="${member.rank ne '관리자'}">
								<a href="/board/insertTradeBoardForm" class="button-4  mt-5">글작성하기</a>
							</c:if>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</div>
	<jsp:include page="../../init/footer.jsp"></jsp:include>



	<!-- script -->
	<script type="text/javascript">
		var inputForm = document.querySelector('#search');

		function press(f) {
			if (f.keyCode == 13) { //javascript에서는 13이 enter키를 의미함

				inputForm.submit(); //formname에 사용자가 지정한 form의 name입력
			}
		}
	</script>
	<script src="https://kit.fontawesome.com/5547fa07a6.js"
		crossorigin="anonymous"></script>
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