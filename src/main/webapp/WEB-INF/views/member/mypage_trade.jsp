<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<title>TECH HOUSE - 마이 페이지</title>
<script type="text/javascript">
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
<style>
	.text_in{
		color : lightgreen;
		font-weight: bold;
	}

	.board-title {
		margin-top: 15px;
		text-align: center;
		font-size: 30px;
		letter-spacing: 2px;
		margin-top: 15px;
		font-weight: bold;
		color: #FF8000;
	}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<meta charset="UTF-8" />
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

</head>
<jsp:include page="../init/header.jsp"></jsp:include>
<body>
	<c:url var="getPageRange" value="/getUserBoardList_">
		<c:param name="page" value="${pagination.page}" />
		<c:param name="range" value="${pagination.range}" />
	</c:url>
	
	<div class="container text-white">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="col-lg-12 board-title">${ member.name }님의 판매 게시글 목록입니다.</div>
					<!-- 거래게시글{s}-->
					<table class="w-100 border">
						<thead class="border">
							<tr>
								<th>번호</th>
								<th>이미지</th>
								<th>제목</th>
								<th>가격</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tradeList" items='${tradeList}'>

								<tr>
									<td>${ tradeList.t_seq }</td>
									<td><a
										href="/board/contentTradeForm?t_seq=${ tradeList.t_seq }">
											${ tradeList.t_uploadImg }</a></td>
									<td><a
										href="/board/contentTradeForm?t_seq=${ tradeList.t_seq }">${ tradeList.t_title }</a></td>
									<td>${ tradeList.t_price }</td>
									<td>${ tradeList.t_views }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 거래게시글{e} -->




					<!-- pagination{s} -->
					<div id="paginationBox ">
						<ul class="pagination d-flex justify-content-center">
							<c:if test="${pagination2.prev}">
								<li class="page-item"><a class="page-link" href="#"
									onClick="fn_prev('${pagination2.page}', '${pagination2.range}', '${pagination2.rangeSize}')">Previous</a></li>
							</c:if>
							<c:forEach begin="${pagination2.startPage}"
								end="${pagination2.endPage}" var="idx">
								<li
									class="page-item <c:out value="${pagination2.page == idx ? 'active' : ''}"/> "><a
									class="page-link" href="#"
									onClick="fn_pagination('${idx}', '${pagination2.range}', '${pagination2.rangeSize}')">
										${idx} </a></li>
							</c:forEach>
							<c:if test="${pagination2.next}">
								<li class="page-item"><a class="page-link" href="#"
									onClick="fn_next('${pagination2.range}', '${pagination2.range}', '${pagination2.rangeSize}')">Next</a></li>
							</c:if>
						</ul>
					</div>

					<!-- pagination{e} -->
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../init/footer.jsp"></jsp:include>
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