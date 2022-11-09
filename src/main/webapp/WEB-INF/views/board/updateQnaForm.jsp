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

<title>TECH HOUSE - Qna 답변하기</title>

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
		var q_title = frm['q_title'].value.trim();
		var q_text = frm['q_text'].value;
		if (q_title == "") {
			alert("제목을 입력해주세요");
			frm['q_title'].focus;
			return false;
		}
		if (q_text == "") {
			alert("내용은 반드시 입력해야 합니다.");
			frm['q_text'].focus;
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
					<form action="updateQnaAction" enctype="multipart/form-data" name="updateBoardForm"
						onsubmit="return chkWrite()" method="post">
						<input type="text" name="q_seq" class="d-none"
							value="${ updateContent.q_seq }"> <input type="text"
							name="q_category" class="d-none"
							value="${ updateContent.q_category }">
							<input type="text" name="q_boardSeq" value="${updateContent.q_boardSeq }" class="d-none">
						<div class="content-title-section d-flex flex-column">
							<div
								class="category-box d-flex flex-row justify-content-between mb-1">
									<div class="">
									<span class="badge"
										style="line-height: 1.5; background-color: #00b3b3;">QNA</span>
									
									<span class="badge bg-warning"
										style="line-height: 1.5;">답변예정</span>
									</div>
									<span class="page-number" style="color: #666666;">No. ${ updateContent.q_seq }</span>
								
							</div>
							<h3>
								${ updateContent.q_title}
								<input type="text" name="q_title"
									value="${ updateContent.q_title}"
									class="w-100 d-block my-3 border-bottom border-warning d-none" placeholder="수정하실 제목을 입력해주세요">
									
							</h3>
							<div
								class="title-content-box d-flex flex-row justify-content-between">
								<div class="user-content d-flex align-items-center mt-2">
									<img src="/resources/images/member/user_default.png"
										class="img-fluid rounded-circle text-center d-inline me-1"
										style="width: 17px; height: 17px;"> <span
										class="user-name" style="color: #a7a7a7;">${updateContent.q_writer }</span>
								</div>
							</div>
						</div>
						<hr>
							<p class="mb-3">
							<c:forEach var="imageList" items="${imageList }">
								<img src="/resources/images/user_upload/${imageList.i_img }"
											alt="" class="rounded" style="max-width: 500px; max-height: 1500px;">
							</c:forEach></p>
							<p>
								<textarea name="q_text" class="w-100 mt-4"
									style="min-height: 80px;" rows="15" placeholder="">${ updateContent.q_text }
									






고객센터 답변 : 

</textarea>
							</p>
							<div>
							<input id="mysubmit" type="submit" class="button-3" value="답변완료">
							<a href="javascript:window.history.back();"> <input
								type="button" class="button-3-border" value="뒤로가기"></a>
							</div>
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