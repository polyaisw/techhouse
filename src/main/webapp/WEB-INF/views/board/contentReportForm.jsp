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

<style>
p {
	color: white;
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
					<span class="badge bg-danger" style="line-height: 1.5;">${ boardContent.b_category }</span>
					<span class="page-number" style="color: #666666;">No. ${ boardContent.b_seq }</span>
				</div>
				<h3>${ boardContent.b_title }</h3>
				<div
					class="title-content-box d-flex flex-row justify-content-between">
					<div class="user-content d-flex align-items-center mt-2">
						<img src="/resources/images/member/user_default.png"
							class="img-fluid rounded-circle text-center d-inline me-1"
							style="width: 17px; height: 17px;"> <span class="user-name"
							style="color: #a7a7a7;">${boardContent.b_writer }</span>
					</div>
					<div class="icon-content" style="color: #666666;">
						<span class="m-1"><i class="fa-regular fa-comment"
							style="color: #666666;"></i> ${ boardContent.b_commentcount }</span> <span
							class="m-1"><i class="fa-solid fa-eye text-white"
							style="color: #666666 !important;"></i> ${ boardContent.b_views }</span>
					</div>
				</div>
			</div>
			<hr>
			<div class="goTolist-button text-end">
				<input type="button" class="button-1-border" value="목록"
					onclick="goToList('${boardContent.b_category}')">
			</div>
			<div class="content-main-section text-white">
				<c:choose>
					<c:when test="${boardContent.b_writer eq '관리자' }">
						<p class="mt-5">${boardContent.b_text}</p>
					</c:when>
					<c:otherwise>
						<c:forEach var="imageList" items="${imageList }">
							<p class="mb-3">
								<img src="/resources/images/user_upload/${imageList.i_img }"
									alt="" class="rounded"
									style="max-width: 500px; max-height: 1500px;">
							</p>

						</c:forEach>
						<p class="mt-5">${boardContent.b_text}</p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="content-main button-box">
				<form action="/board/updateForm" method="post"
					class="d-flex justify-content-end">
					<input type="text" class="d-none" name="b_seq"
						value="${ boardContent.b_seq }">

					<c:if test="${member.name == boardContent.b_writer}">
						<td><input type="submit" value="글 수정하기" class="button-1">
							<a href="/board/deleteBoardAction?b_seq=${ boardContent.b_seq}"
							class="button-1-border">삭제하기</a></td>
					</c:if>
					<input type="button" class="button-1-border" value="목록"
						onclick="goToList('${boardContent.b_category}')">

				</form>
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