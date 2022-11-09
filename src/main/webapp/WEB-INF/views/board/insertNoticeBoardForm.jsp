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

<title>TECH HOUSE - 공지사항 쓰기</title>

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

	
	 textarea, input {
	background-color:inherit;
	border:0;
	 border-bottom:1px solid var(--bs-cyan);
	outline:0;
	padding:7px 15px;
	border-radius:5px;
	color:white;
	 }
	
	.form-select {
	background-color:inherit;
	color:white;
	border:0;
	border-bottom:1px solid var(--bs-cyan);
	
	outline:0;
	}
	option {
	color:black;
	}
</style>

<script type="text/javascript">
	function chkWrite() {
		frm = document.forms['insertBoardForm'];
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
			<h2 class="mt-5"><i class="fa-solid fa-pencil fs-3 pe-2"></i>공지사항 글 작성</h2><hr class="mb-5">
			<div class="row">
				<div class="col">
					<form action="insertBoardAction" name="insertBoardForm"
						onsubmit="return chkWrite()" enctype="multipart/form-data" method="post" class="text-white">
						<input type="text" name="b_writer"
									value="${member.name }" size="30" class="d-none">
									
									
						<div class="insert-main">
								
								<input type="text" class="d-none" name="b_category" value="공지사항">
								<input type="file" class="d-none" name="files" value="">
								<span class="badge badge-pill bg-warning fw-bold">공지사항</span>
							
							
								
								<input type="text" name="b_title"
									value="${boardContent.b_title }" class="d-block w-100 mt-4"  placeholder="제목을 입력해주세요">
							
							
							
								<textarea name="b_text" class="d-block w-100 mt-4" style="height:800px;" placeholder="내용을 입력해주세요">${boardContent.b_text }</textarea>
							

							
								<div class="mb-3">
										<!-- <label for="formFileSm" class="form-label"></label> <input
											class="form-control form-control-sm" id="formFileSm"
											type="file" name="b_uploadImg"> -->
									</div>
							
							
								<input type="submit" value="글쓰기" class="button-3"> <a
									href="javascript:window.history.back();"><input
										type="button" value="뒤로가기" class="button-3-border"></a>
						
						
						
						
						
						</div>
								
							
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../init/footer.jsp"></jsp:include>

	<script src="/resources/js/goToList.js"></script>
	<script src="https://kit.fontawesome.com/5547fa07a6.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>