<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>TECH HOUSE - Qna 글 내용</title>

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

<style>
p {
	color: white;
}

.recommed-button {
	background-color :#00b3b3;
	padding : 6px 12px;
}

.recommed-button:hover {
	
	background-color:#006e6e;
}
</style>

</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>

	<div class="container">
		<div class="page-content text-white">
			<div class="content-title-section d-flex flex-column">
				<div
					class="category-box d-flex flex-row justify-content-between mb-1">
					<div class="">
						<span class="badge"
						style="line-height: 1.5; background-color: #00b3b3;">QNA</span>
						<c:if test="${qnaContent.q_complete == 1 }">
					<span class="badge bg-danger"
						style="line-height: 1.5;">답변완료</span>
						</c:if>
						<c:if test="${qnaContent.q_complete == 0 }">
					<span class="badge bg-warning"
						style="line-height: 1.5; ">답변예정</span>
						</c:if>
					</div>
					
					<span class="page-number" style="color: #666666;">No. ${ qnaContent.q_seq }</span>
				</div>
				<h3>${ qnaContent.q_title }</h3>
				<div
					class="title-content-box d-flex flex-row justify-content-between">
					<div class="user-content d-flex align-items-center mt-2">
						<img src="/resources/images/member/user_default.png" class="img-fluid rounded-circle text-center d-inline me-1" style="width: 17px; height: 17px;"> <span class="user-name"
							style="color: #a7a7a7;">${qnaContent.q_writer }</span>
					</div>
				</div>
			</div>
			<hr>
			<div class="goTolist-button text-end">
			<input type="button"
								class="button-3-border" value="목록"
								onclick="goToList('Qna')"></div>
			<div class="content-main-section text-white">
			</div>
			
				<c:forEach var="imageList" items="${imageList }">
				<p class="mb-3"><img src="/resources/images/user_upload/${imageList.i_img }"
											alt="" class="rounded" style="max-width: 500px; max-height: 1500px;"></p>
											
				</c:forEach>
				<p class="mt-5">${qnaContent.q_text}</p>
			<div class="content-main button-box">
			
			
			<!--관리자의 답변하기로 이동-->
			<c:if test="${member.rank eq '관리자'}">
				<form action="/board/updateQnaForm" method="post" class="d-flex justify-content-end">
					<input type="text" class="d-none" name="q_seq"
						value="${ qnaContent.q_seq }">
						<c:if test="${qnaContent.q_complete == 1 }"></c:if>
						<c:if test="${qnaContent.q_complete == 0 }"><input type="submit" value="답변하기"
									class="button-3"> <%-- <a
									href="/board/deleteBoardAction?b_seq=${ boardContent.b_seq}"
									class="button-3-border">삭제하기</a> --%></c:if>
								
							<div class="text-end"><input type="button"
								class="button-3-border" value="목록"
								onclick="goToList('Qna')"></div>
							
						</form></c:if>
			<c:if test="${member.rank ne '관리자' }">
						<div class="text-end"><input type="button"
								class="button-3-border" value="목록"
								onclick="goToList('Qna')"></div></c:if>
			</div>
			<hr>
			<div class="content-comment-section my-3">
				<div class="comment-title">
					<i class="fa-regular fa-comment"
							style="color: #666666;"></i> <span class="fw-bold px-1">댓글</span><span class="fw-bold" style="color:#00b3b3;">${ boardContent.b_commentcount }</span>
				</div>
				<c:forEach var="commentContent" items="${commentList}">
				<div class="comment-main d-flex flex-row mt-4 justify-content-between">
				<div class="comment-in d-flex flex-row">
					<div class="comment-user-icon"><img src="/resources/images/member/user_default.png" class="img-fluid rounded-circle text-center d-inline me-2" style="width: 22px; height: 22px;"></div>
					<div class="comment-box d-flex flex-column">
						<span class="user-info">${commentContent.c_writer}</span>
						<p class="text-content text-white">${commentContent.c_text}</p>
						<span class="write-date" style="color:#666666;">${ commentContent.c_date }</span>
					</div>
					</div>
					<c:if test="${member.name == commentContent.c_writer }">
									<a
										href="/board/deleteCommentAction?c_seq=${commentContent.c_seq}&c_boardSeq=${commentContent.c_boardSeq}"><input
											type="button" class="button-3-border" value="삭제"></a>
								</c:if>
				</div>
				</c:forEach>
							<c:if test="${member==null}">
				<div class="col-md-12 mt-5">
					<span class="text-white">로그인을 해주세요</span>
				</div>
			</c:if>
			<c:if test="${member!=null}">
				<div class="col-md-12 mt-5">
					<form action="/board/insertCommentAction" method="post">
						<table class="w-100">
							<tr>
								<td>
									<p class="text-white">${member.name }</p>  <textarea
										class="form-control" style="" rows="3" cols="50" name="c_text"
										id="c_text"></textarea></td>
							</tr>
						</table>
						<input type="text" class="d-none" name="c_boardSeq"
							value="${qnaContent.q_seq }">
								<input type="text" class="d-none" name="q_seq"
							value="${qnaContent.q_seq }">
							 <input type="text"
							class="d-none" name="c_writer" value="${member.name }"> <input
							type="submit" value="작성 완료" class="button-3">
					</form>
				</div>
			</c:if>
			</div>
		</div>
	</div>








<%-- 	<div class="container text-white">
		<div class="row">
			<div class="col ">
				
					<table class="boarder w-100">
						<tr>
							<td>글번호</td>
							<td>${ boardContent.b_seq }</td>
						<tr>
						<tr>
							<td>조회수</td>
							<td>${ boardContent.b_views }</td>
						<tr>
						<tr>
							<td>추천수</td>
							<td>${ boardContent.b_recommed }</td>
						<tr>
						<tr>
							<td>댓글수</td>
							<td>${ boardContent.b_commentcount }</td>
						<tr>
							<td>이 름</td>
							<td>${ boardContent.b_writer}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>${ boardContent.b_title}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${boardContent.b_text}</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>${ boardContent.b_category }</td>
						</tr>
						<tr>
							<td>업로드이미지(임시)</td>
							<td>${ boardContent.b_uploadImg }</td>
						</tr>
						<tr>
							
						</tr>
						<tr>

							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<table class="border w-100">
					<thead class="border">
						<tr>
							<th>닉네임</th>
							<th>내용</th>
							<th>날짜</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="commentContent" items="${commentList}">
							<tr>
								<td>${ commentContent.c_writer }</td>
								<td>${commentContent.c_text}</td>
								<td>${ commentContent.c_date }</td>
								<c:if test="${member.name == commentContent.c_writer }">
									<td><a
										href="/board/deleteCommentAction?c_seq=${commentContent.c_seq}&c_boardSeq=${commentContent.c_boardSeq}"><input
											type="button" class="btn btn-primary" value="삭제"></a></td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:if test="${member==null}">
				<div class="col-md-12 mt-5">
					<span class="text-white">로그인을 해주세요</span>
				</div>
			</c:if>
			<c:if test="${member!=null}">
				<div class="col-md-12 mt-5">
					<form action="/board/insertCommentAction" method="post">
						<table class="w-100">
							<tr>
								<td><label class="form-label" for="c_writer">닉네임</label>
									<p class="text-white">${member.name }</p> <label
									class="form-label" for="c_text">내용</label> <textarea
										class="form-control" rows="3" cols="50" name="c_text"
										id="c_text"></textarea></td>
							</tr>
						</table>
						<input type="text" class="d-none" name="c_boardSeq"
							value="${boardContent.b_seq }"> <input type="text"
							class="d-none" name="c_writer" value="${member.name }"> <input
							type="submit" value="댓글작성" class="btn btn-primary">
					</form>
				</div>
			</c:if>
		</div>
	</div> --%>
	<jsp:include page="../init/footer.jsp"></jsp:include>

	<script src="/resources/js/goToList.js"></script>

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