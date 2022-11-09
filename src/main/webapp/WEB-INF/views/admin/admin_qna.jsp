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
	text-align: center;
	font-weight: bold;
}
.td_in {
	text-align: center;
}

.size{
	min-width:100px
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
.page-content{
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

	<div class="container text-white" style="width:1200px;">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content" style="width:1200px;">
					<div class="col-lg-12 board-title">문의 내역 조회</div>
					<div class="member_List">
						<table class="table table-dark table-responsive table-hover rounded" id="user_admin">
							<thead class="">
								<tr>
									<th class="text_in" style="min-witdh:60px;">게시글 번호</th>
									<th class="text_in" style="min-witdh:60px;">문의한 게시글 번호</th>
									<th class="text_in size">작성자</th>
									<th class="text_in size">카테고리</th>
									<th class="text_in size">제목</th>
									<th class="text_in size">이메일</th>
									<th class="text_in size">연락처</th>
									<th class="text_in size">게시 시간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ QnaList }">
									<tr class="admin_board_content">
										<td class="td_in">
											<a href="/board/contentQnaForm?q_seq=${vo.q_seq}" class="seq_List_admin" data-user-id="${vo.q_writer}">${vo.q_seq}</a>
										</td>
										<td class="td_in">
											<a href="/board/contentForm?b_seq=${vo.q_boardSeq}" class="boardseq_List_admin" data-user-id="${vo.q_writer}">${vo.q_boardSeq}</a>
										</td>
										<td class="td_in">
											<a href="/board/contentQnaForm?q_seq=${vo.q_seq}" class="writer_List_admin" data-user-id="${vo.q_writer}">${vo.q_writer}</a>
										</td>
										<td class="td_in">
											<a href="/board/contentQnaForm?q_seq=${vo.q_seq}" class="category_List_admin" data-user-id="${vo.q_writer}">${vo.q_category}</a>
										</td>
										<td class="td_in">
											<a href="/board/contentQnaForm?q_seq=${vo.q_seq}" class="title_List_admin d-inline-block text-truncate" style="max-width: 120px;" data-user-id="${vo.q_writer}">${vo.q_title}</a>
										</td>
										<td class="td_in">
											<a href="/board/contentQnaForm?q_seq=${vo.q_seq}" class="email_List_admin d-inline-block text-truncate" style="max-width: 120px;" data-user-id="${vo.q_writer}">${vo.q_email}</a>
										</td>
										<td class="td_in">
											<a href="/board/contentQnaForm?q_seq=${vo.q_seq}" class="tel_List_admin" data-user-id="${vo.q_writer}">${vo.q_tel}</a>
										</td>
										<td class="td_in">
											<a href="/board/contentQnaForm?q_seq=${vo.q_seq}" class="date_List_admin" data-user-id="${vo.q_writer}">${vo.q_date}</a>
										</td>
									</tr>
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