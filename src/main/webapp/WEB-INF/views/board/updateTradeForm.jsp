<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/default.css" rel="stylesheet">
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
	if (t_prodName == "") {
		alert("상품명은 반드시 입력해야 합니다.");
		frm['t_prodName'].focus;
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

</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<jsp:include page="../init/nav.jsp"></jsp:include>
	<div class="container text-white">
		<div class="row">
			<div class="col ">
				<form action="/board/updateTradeBoardAction" name="updateTradeBoardForm" onsubmit="return chkWrite()" method="post">
					<input type="text" name="t_seq" class="d-none"
						value="${ updateTradeContent.t_seq }"> <input type="text"
						name="t_category" class="d-none"
						value="${ updateTradeContent.t_category }">
					<table class="boarder w-100">
						<tr>
							<td>글번호</td>
							<td>${ updateTradeContent.t_seq }</td>
						</tr>
						<tr>
							<td>조회수</td>
							<td>${ updateTradeContent.t_views }</td>
						</tr>
						<tr>
							<td>이 름</td>
							<td>${ updateTradeContent.t_writer }</td>
						</tr>

						<tr>
							<td>상태</td>
							<td>${ updateTradeContent.t_state}</td>
						</tr>

						<tr>
							<td>카테고리</td>
							<td>${ updateTradeContent.t_category}</td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="t_price" value="${ updateTradeContent.t_price }"></td>
						</tr>
						<tr>
							<td>상품명</td>
							<td><input type="text" name="t_prodName" value="${ updateTradeContent.t_prodName}"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="t_title"
								value="${ updateTradeContent.t_title}" size="30"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="t_text" rows="5" cols="35">${ updateTradeContent.t_text }</textarea></td>
						</tr>

						<tr>
							<td>업로드이미지(임시)</td>
							<td><div class="mb-3">
									<label for="formFileSm" class="form-label"></label> <input
										class="form-control form-control-sm" id="formFileSm"
										type="file" name="t_uploadImg">
								</div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="수정완료"> <a
								href="javascript:window.history.back();"> <input
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