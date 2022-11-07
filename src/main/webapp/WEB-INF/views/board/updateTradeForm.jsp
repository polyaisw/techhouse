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

<title>TECH HOUSE - 글 수정</title>

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
	function chkWrite() {
		frm = document.forms['updateTradeBoardForm'];
		var t_title = frm['t_title'].value.trim();
		var t_text = frm['t_text'].value.trim();
		var t_prodName = frm['t_prodName'].value.trim();
		var t_price = frm['t_price'].value.trim();

		if (t_price == "") {
			alert("가격은 반드시 입력해야 합니다.");
			frm['t_price'].focus;
			return false;
		}
		if (t_title == "") {
			alert("제목은 반드시 입력해야 합니다.");
			frm['t_title'].focus;
			return false;
		}

		if (t_text == "") {
			alert("내용은 반드시 입력해야 합니다.");
			frm['t_text'].focus;
			return false;
		}

		return true;
	}
</script>
<style>
p {
	color: white;
}

textarea, input {
	background-color: inherit;
	border: 0;
	border-bottom: 1px solid var(--bs-teal);
	outline: 0;
	padding: 7px 15px;
	border-radius: 5px;
	color: white;
}
</style>
</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<jsp:include page="../init/nav.jsp"></jsp:include>
	<div class="container text-white">
		<form action="/board/updateTradeBoardAction"
			name="updateTradeBoardForm" onsubmit="return chkWrite()"
			method="post">
			<input type="text" name="t_seq" class="d-none"
				value="${ updateTradeContent.t_seq }"> <input type="text"
				name="t_category" class="d-none"
				value="${ updateTradeContent.t_category }"> <input
				type="text" name="t_prodName" class="d-none"
				value="${ updateTradeContent.t_prodName}">

			<div class="page-content" style="margin-top: 83px;">
				<div class="row">
					<div class="col-lg-5 image-box">
						<span class="badge mb-1"
							style="line-height: 1.5; background-color: #3cb398;">거래게시판</span>
						<img
							src="/resources/images/trade/${ updateTradeContent.t_uploadImg }"
							width="500px" height="400px" class="rounded">
						<div class="mb-3">
							<label for="formFileSm" class="form-label"></label> <input
								class="form-control form-control-sm" id="formFileSm" type="file"
								name="t_uploadImg">
						</div>
					</div>
					<div class="col-lg-7 d-flex flex-column">
						<div class="trade-title d-flex flex-row justify-content-between">
							<input type="text" name="t_title"
								value="${ updateTradeContent.t_title}" placeholder="수정할 제목"
								class="d-block w-100 me-3">
							<p style="color: #666666">No.${updateTradeContent.t_seq }</p>
						</div>
						<div class="d-flex flex-row justify-content-between">
							<div>
								<input type="text" name="t_price"
									value="${ updateTradeContent.t_price }" placeholder="수정할 가격"><span>원</span>
							</div>
							<div class="">
								<c:if test="${updateTradeContent.t_state eq '판매중'}">
									<span class="badge rounded-pill text-bg-light d-inline">${updateTradeContent.t_state }</span>
								</c:if>
								<c:if test="${updateTradeContent.t_state eq '거래중'}">
									<span class="badge rounded-pill text-bg-warning d-inline">${updateTradeContent.t_state }</span>
								</c:if>
								<c:if test="${updateTradeContent.t_state eq '거래완료'}">
									<span class="badge rounded-pill text-bg-primary d-inline">${updateTradeContent.t_state }</span>
								</c:if>
								<span class="badge " style="color: var(--bs-teal)">인증</span>
							</div>
						</div>
						<hr>
						<div class="d-flex flex-row justify-content-between">
							<div class="d-flex flex-row ">
								<p class="pe-2">
									<i class="fa-solid fa-eye me-1" style="color: #666666;"></i>${ updateTradeContent.t_views }</p>
								<p class="pe-2">
									<i class="fa-regular fa-comment me-1" style="color: #666666;"></i>11
								</p>
								<!-- 댓글수 -->
								<p class="pe-2">${ updateTradeContent.t_date }</p>
							</div>
							<div class="user-info">
								<i class="fa-solid fa-medal text-danger me-2"></i> <span>${updateTradeContent.t_writer }</span>

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

					</div>
				</div>
				<hr class="mt-5">
				<textarea name="t_text" style="width: 100%; height: 800px"
					placeholder="내용을 입력해주세요">${ updateTradeContent.t_text }</textarea>
				<div class="mt-5"></div>
				<div class="button-box text-center">
					<input type="submit" value="수정완료" class="button-4 me-3"> <a
						href="javascript:window.history.back();"> <input type="button"
						class="button-4-border" value="뒤로가기"></a>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../init/footer.jsp"></jsp:include>
	<script type="text/javascript">
		
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