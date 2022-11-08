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

<title>TECH HOUSE - 글 내용</title>

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
</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<div class="container text-white">
		<div class="page-content">
			<div class="row">
				<div class="col-lg-5 image-box">
				<span class="badge mb-1" style="line-height: 1.5; background-color: #3cb398;">거래게시판</span>
				
				
				
				<c:if test="${tradeContent.t_uploadImg eq 'trade_default.png' }">
					<img src="/resources/images/user_upload/${tradeContent.t_uploadImg }" class="d-block w-100 rounded" style="width:350px; height:350px" alt="...">
				</c:if>
				
				<c:if test="${tradeContent.t_uploadImg ne 'trade_default.png' }">
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
					  <div class="carousel-inner">
					  	<c:forEach var="imageList" items="${imageList }" varStatus="status">
					  		<c:if test="${status.count eq 1 }">
							    <div class="carousel-item active" data-bs-interval="3000">
							      <img src="/resources/images/user_upload/${imageList.i_img }" class="d-block rounded w-100" style="width:350px; height:350px;" alt="...">
							    </div>
					  		</c:if>
					  		<c:if test="${status.count ne 1 }">
							    <div class="carousel-item" data-bs-interval="3000">
							      <img src="/resources/images/user_upload/${imageList.i_img }" class="d-block rounded w-100" style="width:350px; height:350px;" alt="...">
							    </div>
					  		</c:if>
					    </c:forEach>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>
				
				</c:if>
				</div>
				<div class="col-lg-7 d-flex flex-column">
					<div class="trade-title d-flex flex-row justify-content-between">
						<h4 class="my-5">${tradeContent.t_title }</h4>
						<p>No.${tradeContent.t_seq }</p>
					</div>
					<div class="d-flex flex-row justify-content-between">
						<span class="fs-2 fw-bold">${tradeContent.t_price }원</span>
						<div class="">
							<c:if test="${tradeContent.t_state eq '판매중'}">
								<span class="badge rounded-pill text-bg-light d-inline">${tradeContent.t_state }</span>
							</c:if>
							<c:if test="${tradeContent.t_state eq '거래중'}">
								<span class="badge rounded-pill text-bg-warning d-inline">${tradeContent.t_state }</span>
							</c:if>
							<c:if test="${tradeContent.t_state eq '거래완료'}">
								<span class="badge rounded-pill text-bg-primary d-inline">${tradeContent.t_state }</span>
							</c:if>
							<span class="badge " style="color: var(--bs-teal)">인증</span>
						</div>
					</div>
					<hr>
					<div class="d-flex flex-row justify-content-between">
						<div class="d-flex flex-row ">
							<p class="pe-2">
								<i class="fa-solid fa-eye me-1" style="color: #666666;"></i>${ tradeContent.t_views }</p>
							
							<!-- 댓글수 -->
							<p class="pe-2">${ tradeContent.t_date }</p>
						</div>
						<div class="user-info">
							<i class="fa-solid fa-medal text-danger me-2"></i> <span>${tradeContent.t_writer }</span>

						</div>
					</div>
					<div class="info-box my-4">
						<div class="d-inline-block" style="width: 90px">상품상태</div>
						<span>새상품</span><br>
						<div class="d-inline-block mt-2" style="width: 90px">사용기간</div>
						<span>1개월 미만</span><br>
						<div class="d-inline-block mt-2" style="width: 90px">교환여부</div>
						<span>교환불가능</span><br>
						<div class="d-inline-block mt-2" style="width: 90px">배송비</div>
						<span>배송비포함</span>
					</div>
					<form action="/board/updateTradeForm" method="post"
						class="d-flex align-items-end justify-content-end mt-2"
						style="vertical-align: bottom">
						<input type="text" class="d-none" name="t_seq"
							value="${ tradeContent.t_seq }">


						<c:if test="${member.name == tradeContent.t_writer}">
							<input type="submit" value="글 수정하기" class="button-4 ms-1">
							<a
								href="/board/deleteTradeBoardAction?t_seq=${ tradeContent.t_seq}"
								class="button-4-border ms-1">삭제하기</a>
						</c:if>



						<c:choose>
							<c:when test="${member.name != null}">
								<c:if test="${member.rank != '관리자' }">
									<c:if test="${member.name != tradeContent.t_writer}">
										<c:choose>
											<c:when test="${ tradeContent.t_state != '판매중'}">
											<a class="button-4 ms-1" href="javascript:alert('거래중이거나 거래 완료된 상품입니다.')">바로구매</a>
											<a class="button-0 ms-1" href="javascript:alert('준비중입니다.')">안심거래</a>
											</c:when>
											<c:otherwise>
												<a class="button-4 ms-1" href="#">바로구매</a>
												<a class="button-0 ms-1" href="javascript:alert('준비중입니다.')">안심거래</a>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:if>
							</c:when>
							<c:otherwise>
								<a class="button-4 ms-1" href="/member/login">바로구매</a>
								<a class="button-0 ms-1" href="javascript:alert('준비중입니다.')">안심거래</a>
							</c:otherwise>
						</c:choose>

						<input type="button" class="button-4-border ms-1" value="목록으로"
							onclick="goToList('${tradeContent.t_category}')">
					</form>
				</div>



				<hr class="mt-5">
				<div class="col-md-12 mt-4">${tradeContent.t_text}</div>
				<hr class="mt-5">
			</div>

			<div class="content-comment-section my-3">
				<div class="comment-title">
					<i class="fa-regular fa-comment" style="color: #666666;"></i> <span
						class="fw-bold px-1">댓글</span><span class="fw-bold"
						style="color: #00b3b3;"></span>
				</div>
				<c:forEach var="commentContent" items="${commentList}">
					<div
						class="comment-main d-flex flex-row mt-4 justify-content-between">
						<div class="comment-in d-flex flex-row">
							<div class="comment-user-icon">
								<img src="/resources/images/member/user_default.png"
									class="img-fluid rounded-circle text-center d-inline me-2"
									style="width: 22px; height: 22px;">
							</div>
							<div class="comment-box d-flex flex-column">
								<span class="user-info">${commentContent.c_writer}</span>
								<p class="text-content text-white">${commentContent.c_text}</p>
								<span class="write-date" style="color:#666666;">${ commentContent.c_date }</span>
							</div>
						</div>
						<c:if test="${member.name == commentContent.c_writer }">
							<a class=""
									href="/board/deleteCommentAction?t_seq=${tradeContent.t_seq }&c_boardSeq=${commentContent.c_boardSeq }&c_seq=${commentContent.c_seq}">
										<input
								type="button" class="button-4-border" value="삭제"></a>
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
						<form
						action="/board/insertCommentAction?t_seq=${ tradeContent.t_seq}"
						method="post">
							<table class="w-100">
								<tr>
									<td>
										<p class="text-white">${member.name }</p> <textarea
											class="form-control" style="" rows="3" cols="50"
											name="c_text" id="c_text"></textarea>
									</td>
								</tr>
							</table>
							<input type="text" class="d-none" name="c_boardSeq"
								value="${tradeContent.t_seq }"> <input type="text"
								class="d-none" name="c_writer" value="${member.name }">
							<input type="submit" value="작성 완료" class="button-4">
						</form>
					</div>
				</c:if>
			</div>
		</div>
		</div>
		
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