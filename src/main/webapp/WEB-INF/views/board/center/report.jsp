<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>TECH HOUSE - 사기피해신고</title>

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

<!-- pagination -->
<script type="text/javascript">
	function fn_prev(page, range, rangeSize, searchKeyword, b_category, getUrl) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + searchKeyword;
		url = url + "&b_category=" + b_category;
		url = url + "&url=" + getUrl;
		location.href = url;
	}
	function fn_pagination(page, range, rangeSize, searchKeyword, b_category, getUrl) {
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + searchKeyword;
		url = url + "&b_category=" + b_category;
		url = url + "&url=" + getUrl;
		location.href = url;
	}
	function fn_next(page, range, rangeSize, searchKeyword, b_category, getUrl) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKeyword=" + searchKeyword;
		url = url + "&b_category=" + b_category;
		url = url + "&url=" + getUrl;
		location.href = url;
	}
</script>
<style>

.signup > span:hover {
	color:white!important;
}

.info-box {
	border-color:var(--bs-cyan)!important;
}
.heading-section .board {
	color:var(--bs-success);
}
.most-popular {
	border-bottom: 1px solid var(--bs-warning)!important;
}

.active>.page-link, .page-link.active {
	background-color : var(--bs-orange)
}
a:hover {
    color: var(--bs-warning)!important;
    
}
.header-area .main-nav .nav li:hover>a {
	color : white!important;
}
</style>
</head>
<body>
<!-- 페이지정보 -->
	<c:url var="getPageRange" value="/board/center/report">
		<c:param name="page" value="${pagination.page}" />
		<c:param name="range" value="${pagination.range}" />
		
	</c:url>
	<c:url var="getPageUrl" value="board/center/report">
	</c:url>
	<c:set var="category" value="사기피해신고" />
	


	<jsp:include page="../../init/header.jsp"></jsp:include>
	<div class="container">
		<div class="page-content">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/main">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page"><c:out value="${category }"/></li>
				</ol>
			</nav>
			<div class="row">
				<div class="col-md-9">
					<div class="most-popular title">
						<h2><c:out value="${category }"/></h2>
						<div class="notice text-white mt-5" style="">
							<ul>
								<c:forEach var="noticeList" items="${noticeList }">
								<li class="d-flex justify-content-between align-items-center ">
									<div class="title-unit">
										<span class="badge" style="font-size: 15px;">공지 <a
											href="/board/contentReportForm?b_seq=${noticeList.b_seq }" class="d-inline-block text-truncate px-2"
											style="max-width: 600px;">${noticeList.b_title } </a></span>
									</div>
									<div class="normal-unit">
										<span class="pe-3"> ${noticeList.b_writer } </span> <span><i
											class="fa-solid fa-eye text-white"></i> ${noticeList.b_views } </span>
									</div>
								</li>
								<hr class="hr inline-block my-1">
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-3 ps-2 text-center" style="margin-top:60px;">
					<c:if test="${member eq null }">
							<a href="/member/login"
								class="loginBtn p-2   btn btn-warning  d-block mb-2">
								<span class="text-dark"> 로그인 하기
							</span></a>
							
					</c:if>
					<c:if test="${member ne null }">
						<div class="most-popular user text-white pb-2 mt-0">
							<h4>infomation</h4>
							<div class="info-box  rounded my-2 d-block" style="border-color: var(--bs-cyan);">
								<h6 class="text-warning">${member.rank}</h6>
								<h6 class="mt-4"><em>${member.name }</em>님 <br>환영합니다.</h6>
								<div class="info-box-main mt-4" style="color:#666666;">
									<div class="d-flex justify-content-between mx-2">
										<h6 class="" >point : </h6>
										<span class="">${member.point}</span>
									</div>
									<div class="d-flex justify-content-between mx-2 mb-0">
										<h6 class="" >ticket : </h6>
										<span class="">${member.ticket}</span>
									</div>
								</div>
								

							</div>
						</div>
					</c:if>
				</div>
			</div>
			<hr class="hr">

			<div class="most-popular  border-bottom border-success">
				<div class="row">
					<div class="col ">
					<div class="table-responsive">
						<table class="table table-dark table-hover-bottom rounded">
							<thead class="">
								<tr>
									<th>추천</th>
									<th>제목</th>
									<th>작성자</th>
									<th>조회수</th>
									<th>게시날짜</th>
								</tr>
							</thead>
							<tbody class="" style="color: #666666;">
								<c:forEach var="boardList" items='${list}'>

									<tr>
										<td><span class="d-inline-block" style="min-width:50px">${ boardList.b_recommed }</span></td>
										<td ><a
											href="/board/contentReportForm?b_seq=${ boardList.b_seq }"
											class="d-inline-block w-auto" style="min-width:200px"
											> ${ boardList.b_title }</a></td>
										<td><span class="d-inline-block" style="min-width:67px">${ boardList.b_writer }</span></td>
										<td><span class="d-inline-block" style="min-width:67px">${ boardList.b_views }</span></td>
										<td><span class="d-inline-block" style="min-width:100px">${ boardList.b_date }</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table></div>
					</div>

				</div>
				<div class="row mt-5">
				<div class="col-md-12">
					<div class="search-input text-center  w-100 mx-auto mb-5">
							<form id="search" action="/searchBoardAction" method="get"
								name="input-form" class="d-inline-block">
								<input type="text" placeholder="글 검색" id='searchText'
									name="searchKeyword" >
									<i class="fa fa-search"></i>
									
								<input type="text" name="b_category"class="d-none" value="<c:out value="${category }"/>">	
								<input type="text" name="url" class="d-none" value="${getPageUrl }">
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
										onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}','${keyword }','${b_category }','${url }')">Previous</a></li>
								</c:if>
								<c:forEach begin="${pagination.startPage}"
									end="${pagination.endPage}" var="idx">
									<li
										class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
										class="page-link" href="#"
										onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}','${keyword }','${b_category }','${url }')">
											${idx} </a></li>
								</c:forEach>
								<c:if test="${pagination.next}">
									<li class="page-item"><a class="page-link" href="#"onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}','${keyword }','${b_category }','${url }')">Next</a></li>
								</c:if>
							</ul>
						</div>
						<!-- pagination{e} -->
					</div>
				</div>
				<div class="row">
					<div class="col ">
						<c:if test="${member != null}">
							<c:if test="${member.rank eq '관리자' }">
								<a href="/board/insertNoticeBoardForm" class="button-1 mt-5">공지사항
									작성하기</a>
							</c:if>
							<c:if test="${member.rank ne '관리자'}">
								<a href="/board/insertBoardForm" class="button-1  mt-5">글작성하기</a>
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