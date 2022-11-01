<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>TECH HOUSE - 1:1문의</title>

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
		frm = document.forms['qnaForm'];
		var q_title = frm['q_title'].value.trim();
		var q_text = frm['q_text'].value.trim();
		var q_tel = frm['q_tel'].value.trim();
		var q_email = frm['q_email'].value.trim();

		if (q_title == "") {
			alert("제목을 입력해주세요");
			frm['q_title'].focus;
			return false;
		}
		if (q_text == "") {
			alert("입력되지 않은 내용이 있습니다.");
			frm['q_text'].focus;
			return false;
		}
		if (q_email == "") {
			alert("입력되지 않은 내용이 있습니다.");
			frm['q_email'].focus;
			return false;
		}
		if (q_tel == "") {
			alert("입력되지 않은 내용이 있습니다.");
			frm['q_tel'].focus;
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="../../init/header.jsp"></jsp:include>
	<jsp:include page="../../init/nav.jsp"></jsp:include>

	<div class="container mt-5">
	<div class="page-content border-info border">
		<form action="/board/qnaAction" name="qnaForm"
			onsubmit="return chkWrite()" method="post" class="was-validated">
			<div class="row">
				<div class="col">
					<h2 class="h2 text-white">1:1 문의하기</h2>
					<hr class="hr-14 m-3">
				</div>
			</div>
			<div
				class="row  text-white justify-content-between w-75 mx-auto mt-5">
				<div class="col-lg-6">
					<div class="mb-5">
						<label for="q_boardSeq" class="form-label">문의할 게시글 번호</label> <input
							type="text" class="form-control w-75" name="q_boardSeq"
							id="q_boardSeq" placeholder="번호를 입력해주세요">

					</div>
				</div>
				<div class="col-lg-6">
					<div class="mb-5">
						<label for="q_category" class="form-label">*게시글 카테고리</label> <select
							class="form-select" aria-label="Default select example"
							id="q_category" name="q_category">
							<option selected value="자유게시판">[커뮤니티] 자유게시판</option>
							<option value="인증게시판">[커뮤니티] 인증게시판</option>
							<option value="취미공유">[커뮤니티] 취미공유</option>
							<option value="거래게시판">[거래] 거래게시판</option>
							<option value="벤치마킹인증">[거래] 벤치마킹 인증</option>
							<option value="거래후기">[거래] 거래 후기</option>
							<option value="IT/트렌드">[뉴스] IT/트렌드</option>
							<option value="핫이슈">[뉴스] 핫이슈</option>
							<option value="게임출시정보">[뉴스] 게임 출시 정보</option>
							<option value="꿀딜/장터">[뉴스] 꿀딜 장터</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row text-white w-75 mx-auto">
				<div class="col-lg-12">
					<div class="mb-3">
						<label for="q_title" class="form-label">*문의 제목</label> <input
							type="text" class="form-control" id="q_title" name="q_title"
							placeholder="제목을 입력해주세요" required>
						<div class="invalid-feedback">제목을 반드시 입력해주세요</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="mb-3">
						<label for="q_text" class="form-label">*문의 내용</label>
						<textarea class="form-control" id="q_text" name="q_text"
							placeholder="내용을 상세히 입력해주세요" rows="20" required></textarea>
						<div class="invalid-feedback">내용을 반드시 입력해주세요</div>
					</div>
				</div>

				<div class="col-lg-12">
					<div class="mb-3">
						<label for="q_email" class="form-label">*이메일 주소</label> <input
							type="email" class="form-control" id="q_email" name="q_email"
							placeholder="sample123@sample.com" required>
						<div class="invalid-feedback">이메일양식에 맞게 입력해주세요</div>

					</div>
				</div>
				<div class="col-lg-12">
					<div class="mb-3">
						<label for="q_tel" class="form-label">*휴대폰 번호</label> <input
							type="text" class="form-control" id="q_tel" name="q_tel"
							placeholder="01012345678" required>
						<div class="invalid-feedback">휴대폰번호를 반드시 입력해주세요</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="mb-3">
						<label for="formFileSm" class="form-label">파일 첨부하기 </label> <input
							class="form-control form-control-sm" id="formFileSm"
							name="q_uploadImg" type="file">
					</div>
				</div>
			</div>
			<div class="row text-center">
				<div class="col m-3">
					<input type="submit"
						class="btn button-3-border d-inline text-white" value="문의 접수">
				</div>
			</div>
		</form>
		</div>
	</div>




	<jsp:include page="../../init/footer.jsp"></jsp:include>

	<!-- script -->

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