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
<style>
p {
	color: white;
}

textarea, input {
	background-color: inherit;
	border: 0;
	border-bottom: 1px solid var(--bs-cyan);
	outline: 0;
	padding: 7px 15px;
	border-radius: 5px;
	color: white;
}
</style>
<script type="text/javascript">
	function chkWrite() {
		frm = document.forms['updateBoardForm'];
		var b_title = frm['b_title'].value.trim();
		var b_text = frm['b_text'].value;
		if (b_title == "") {
			alert("제목을 입력해주세요");
			frm['b_title'].focus;
			return false;
		}
		if (b_text == "") {
			alert("내용은 반드시 입력해야 합니다.");
			frm['b_text'].focus;
			return false;
		}
		return true;
	}
</script>

</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<div class="container text-white">
		<div class="page-content">
			<div class="row">
				<div class="col ">
					<form action="updateBoardAction" enctype="multipart/form-data" name="updateBoardForm"
						onsubmit="return chkWrite()" method="post">
						<input type="text" name="b_seq" class="d-none"
							value="${ updateContent.b_seq }"> <input type="text"
							name="b_category" class="d-none"
							value="${ updateContent.b_category }">
						<div class="content-title-section d-flex flex-column">
							<div
								class="category-box d-flex flex-row justify-content-between mb-1">
								<c:if test="${ updateContent.b_category  eq '사기피해신고'}">
									<span class="badge"
										style="line-height: 1.5; background-color: var(--bs-danger);">${ updateContent.b_category }</span>
									<span class="page-number" style="color: #666666;">No. ${ updateContent.b_seq }</span>
								</c:if>
								<c:if test="${ updateContent.b_category  ne '사기피해신고'}">
									<span class="badge"
										style="line-height: 1.5; background-color: #00b3b3;">${ updateContent.b_category }</span>
									<span class="page-number" style="color: #666666;">No. ${ updateContent.b_seq }</span>
								</c:if>
							</div>
							<h3>
								<c:if test="${ updateContent.b_category  eq '사기피해신고'}">
								<input type="text" name="b_title"
									value="${ updateContent.b_title}" name="b_title"
									class="w-100 d-block my-3 border-bottom border-warning" placeholder="수정하실 제목을 입력해주세요">
									</c:if>
								
								<c:if test="${ updateContent.b_category  ne '사기피해신고'}">
								<input type="text" name="b_title"
									value="${ updateContent.b_title}" name="b_title"
									class="w-100 d-block my-3" placeholder="수정하실 제목을 입력해주세요">
									</c:if>
							</h3>
							<div
								class="title-content-box d-flex flex-row justify-content-between">
								<div class="user-content d-flex align-items-center mt-2">
									<img src="/resources/images/member/user_default.png"
										class="img-fluid rounded-circle text-center d-inline me-1"
										style="width: 17px; height: 17px;"> <span
										class="user-name" style="color: #a7a7a7;">${updateContent.b_writer }</span>
								</div>
								<div class="icon-content" style="color: #666666;">
									<span class="m-1"><i class="fa-solid fa-thumbs-up"
										style="color: #666666;"></i> ${ updateContent.b_recommed }</span> <span
										class="m-1"><i class="fa-regular fa-comment"
										style="color: #666666;"></i> ${ updateContent.b_commentcount }</span>
									<span class="m-1"><i class="fa-solid fa-eye text-white"
										style="color: #666666 !important;"></i> ${ updateContent.b_views }</span>
								</div>
							</div>
						</div>
						<hr>
						<c:if test="${ updateContent.b_category  eq '사기피해신고'}"><div class="content-main-section text-white">
							
							<p>
								<textarea name="b_text" class="d-block w-100 mt-4 border-bottom border-warning"
									style="height: 800px;" placeholder="수정하실 내용을 입력해주세요">${ updateContent.b_text }</textarea>
							</p>
						</div></c:if>
						
						<c:if test="${ updateContent.b_category  ne '사기피해신고'}"><div class="content-main-section text-white">
							<p>
								<textarea name="b_text" class="d-block w-100 mt-4"
									style="height: 800px;" placeholder="수정하실 내용을 입력해주세요">${ updateContent.b_text }</textarea>
							</p>
						</div></c:if>
						
						<c:if test="${ updateContent.b_category  eq '사기피해신고'}">
							<input class="form-control form-control-sm my-3" id="formFileSm"
								type="file" name="files" multiple="multiple">
							<input id="mysubmit" type="submit" class="button-1 border-0" value="수정완료">
							<a href="javascript:window.history.back();"> <input
								type="button" class="button-1-border" value="뒤로가기"></a>
						</c:if>
						<c:if test="${ updateContent.b_category  ne '사기피해신고'}">
							<input class="form-control form-control-sm my-3" id="formFileSm"
								type="file" name="files" multiple="multiple">
							<input id="mysubmit" type="submit" class="button-3" value="수정완료">
							<a href="javascript:window.history.back();"> <input
								type="button" class="button-3-border" value="뒤로가기"></a>
						</c:if>
					</form>
				</div>
			</div>
		</div>
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