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
</head>
<body>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<jsp:include page="../init/nav.jsp"></jsp:include>
	<div class="container text-white">
		<div class="row">
			<div class="col ">
				<form action="/board/updateBoardAction" method="post">
					<input type="text" name="b_seq" class="d-none"
						value="${ updateContent.b_seq }"> <input type="text"
						name="b_category" class="d-none"
						value="${ updateContent.b_category }">
					<table class="boarder w-100">
						<tr>
							<td>글번호</td>
							<td>${ updateContent.b_seq }</td>
						<tr>


							<td>이 름</td>
							<td>${ updateContent.b_writer}</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>${ updateContent.b_category}</td>
						</tr>

						<tr>
							<td>제목</td>
							<td><input type="text" name="b_title"
								value="${ updateContent.b_title}" name="b_title" size="30"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="b_text" rows="5" cols="35">${ updateContent.b_text }</textarea></td>
						</tr>

						<tr>
							<td>업로드(임시)</td>
							<td><div class="mb-3">
									<label for="formFileSm" class="form-label"></label> <input
										class="form-control form-control-sm" id="formFileSm"
										type="file" name="b_uploadImg">
								</div></td>
						</tr>
						<tr>
							<td colspan="2"><input id="mysubmit" type="submit"
								value="수정완료" > <a
								href="javascript:window.history.back();"> <input
									type="button" value="뒤로가기"></a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../init/footer.jsp"></jsp:include>
	<script type="text/javascript">
/* 	function mySubmit(){
		var btn1 = document.getElementById(mysubmit);
		var category = "${updateContent.b_category}";
		if(category == "사기피해신고"){
			location.href ="/board/contentReportForm?b_seq="+${updateContent.b_seq}
			console.log("사기피해신고진입"); 
			}
		else{
			location.href ="/board/contentForm?b_seq="+${updateContent.b_seq}
		console.log("이외 게시판 진입");
			}
		} */
	</script>
	<script src="https://kit.fontawesome.com/5547fa07a6.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>