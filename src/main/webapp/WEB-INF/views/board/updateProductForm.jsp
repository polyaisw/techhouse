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

<title>TECH HOUSE - 메인</title>

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
<link href="/resources/css/nav.css" rel="stylesheet">
<!-- <link href="/resources/css/default.css" rel="stylesheet"> -->
</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<div class="container text-white">
	<div class="page-content">
		<div class="row w-75 mx-auto">
			<div class="col">
				<h2 class="h2 text-white">상품수정 페이지 관리자</h2>

				<form method="post" action="/board/updateProductAction">
						<input type="text" value="${productContent.prod_seq }" name="prod_seq" class="d-none was-validated" >
				
						<label for="prod_productName" class="form-label text-white">수정 하실 상품명</label>
						<input type="text" placeholder="상품명을 입력하세요" class="form-control mb-3"
						id="prod_productName" name="prod_productName" value="${productContent.prod_productName }" required> 
						<div class="invalid-feedback">상품명을 반드시 입력해주세요</div>
						
						<label for="prod_price" class="form-label text-white">수정 하실 상품가격</label> 
						<input type="text" class="form-control mb-3" placeholder="상품가격을 입력하세요"
						id="prod_price" name="prod_price" value="${productContent.prod_price }" required> 
						<div class="invalid-feedback">상품가격을 반드시 입력해주세요</div>
						
						<label for="prod_uploadImg" class="form-label text-white">수정 하실 업로드 이미지</label>
						<input type="file" id="prod_uploadImg" name="prod_uploadImg" class="form-control mb-3" value="${productContent.prod_uploadImg }">
						
						<label for="prod_selectedId" class="form-label text-white">당첨된 유저 아이디</label>
						<input type="text" id="prod_selectedId" name="prod_selectedId" class="form-control mb-3" value="${ productContent.prod_selectedId }" >
						
						<label for="prod_selectedName" class="form-label text-white">당첨된 유저 닉네임</label>
						<input type="text" id="prod_selectedName" name="prod_selectedName" class="form-control mb-3" value="${ productContent.prod_selectedName }" >
						
						<label for="prod_selectedTel" class="form-label text-white">당첨된 유저 연락처</label>
						<input type="text" id="prod_selectedTel" name="prod_selectedTel" class="form-control mb-3" value="${ productContent.prod_selectedTel }" >
						
						<label for="prod_date" class="form-label text-white">상품 게시 날짜</label>
						<span id="prod_date"class="mb-3 form-control">${ productContent.prod_date }</span>
						
						
						<input type="submit" class="btn btn-primary" value="수정완료">
						<a href="javascript:window.history.back()" class="btn btn-primary">뒤로가기</a>
				</form>
			</div>
		</div>
	</div>
	</div>

	<jsp:include page="../init/footer.jsp"></jsp:include>

	<script src="https://kit.fontawesome.com/5547fa07a6.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>