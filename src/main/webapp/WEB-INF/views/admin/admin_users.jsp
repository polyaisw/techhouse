<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>TECH HOUSE - 관리자 페이지</title>
<style>
.text_in {
	color: lightgreen;
	font-weight: bold;
}

.board-title {
	margin-top: 15px;
	text-align: center;
	font-size: 30px;
	letter-spacing: 2px;
	font-weight: bold;
	color: #FF8000;
}

.board-search {
	margin-top: 15px;
	text-align: right;
	letter-spacing: 2px;
}

input:focus {
	outline: none;
	box-shadow: 0 0 0;
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

	<div class="container text-white">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="col-lg-12 board-title">유저 조회</div>
					<div class="member_List">
						<table class="table table-dark table-hover rounded" id="user_admin">
							<thead class="">
								<th class="text_in">아이디</th>
								<th class="text_in">닉네임</th>
								<th class="text_in">게시글 수</th>
								<th class="text_in">판매 게시글 수</th>
								<th class="text_in">댓글 수</th>
								<th class="text_in">블랙 상황(0 정상, 1 블랙)</th>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ userInfo }">
									<tr class="admin_board_content">
										<td class="d-inline-block text-truncate"><a
											class="mypageModal user_id" >${ vo.id }</a></td>
										<td class="d-inline-block text-truncate">${ vo.name }</td>
										<td class="d-inline-block text-truncate"><a href="#"
											class="modal_boardList_admin" data-user-id="${vo.id}">${vo.boardCnt}</a></td>
										<td class="d-inline-block text-truncate"><a href="#"
											class="modal_boardList_admin" data-user-id="${vo.id}">${vo.tradeCnt}</a></td>
										<td class="d-inline-block text-truncate"><a href="#"
											class="modal_reply_admin" data-user-id="${vo.id}">${vo.commentCnt}</a></td>
								</c:forEach>
							</tbody>
						</table>
					</div>
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