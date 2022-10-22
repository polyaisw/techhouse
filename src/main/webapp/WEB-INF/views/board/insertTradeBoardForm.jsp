<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/default.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<jsp:include page="../init/nav.jsp"></jsp:include>
	<h2>글쓰기</h2>
	<div class="container text-white">
		<div class="row">
			<div class="col ">
				<form action="insertTradeBoardAction" method="post">
				<input type="text" class="d-none" value="거래게시판" name="t_category">
					<table class="boarder w-100">
						<tr>
							<td>이름</td>
							<td>${member.name } <input type="text" name="t_writer" value="${member.name }"
								size="30" class="d-none"></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>거래게시판</td>
						</tr>
						<tr>
							<td>제목</td>	
							<td><input type="text" name="t_title" value="" size="30"></td>
						</tr>
						<tr>
							<td>상품명</td>
							<td><input type="text" name="t_prodName" value="" size="30"></td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="t_price" value="" size="30"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="t_text" rows="5" cols="35"></textarea></td>
						</tr>

						<tr>
							<td>업로드(임시)</td>
							<td><div class="mb-3">
									<label for="formFileSm" class="form-label"></label> <input
										class="form-control form-control-sm" id="formFileSm"
										type="file" name="t_uploadImg">
								</div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="글쓰기"> <a
								href="javascript:window.history.back();"><input
									type="button" value="뒤로가기"></a></td>
						</tr>
					</table>
				</form>
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