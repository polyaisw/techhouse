<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/default.css" rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
	%>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<jsp:include page="../init/nav.jsp"></jsp:include>
	<div class="container text-white">
		<div class="row">
			<div class="col ">
				<form action="/board/updateForm" method="post">
					<input type="text" class="d-none" name="b_seq"
						value="${ boardContent.b_seq }">
					<table class="boarder w-100">
						<tr>
							<td>글번호</td>
							<td>${ boardContent.b_seq }</td>
						<tr>
						<tr>
							<td>조회수</td>
							<td>${ boardContent.b_views }</td>
						<tr>
						<tr>
							<td>추천수</td>
							<td>${ boardContent.b_recommed }</td>
						<tr>
						<tr>
							<td>댓글수</td>
							<td>${ boardContent.b_commentcount }</td>
						<tr>
							<td>이 름</td>
							<td>${ boardContent.b_writer}</td>
						</tr>

						<tr>
							<td>제목</td>
							<td>${ boardContent.b_title}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${ boardContent.b_text  }</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>${ boardContent.b_category }</td>
						</tr>
						<tr>
							<td>업로드이미지(임시)</td>
							<td>${ boardContent.b_uploadImg }</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="글 수정하기"
								class="btn btn-primary"> <a
								href="/board/deleteBoardAction?b_seq=${ boardContent.b_seq}"
								class="btn btn-primary">삭제하기</a> <a href="/main"
								class="btn btn-primary">목록으로</a></td>
						</tr>
						<tr>
							<td><a
								href="/board/recommendAction?b_seq=${boardContent.b_seq }"
								class="btn btn-primary">추천하기</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<table class="border w-100">
					<tr>
						<th>닉네임</th>
						<th>내용</th>
						<th>날짜</th>
						<th>삭제</th>
					</tr>
					<%-- 					<c:forEach var="commentContent" items="${commentList}">
						<tr>
							<td>${commentContent.c_writer}</td>
							<td>${commentContent.c_text}</td>
							<td>${ commentContent.c_date }</td>
							<td><a
								href="/board/deleteCommentAction?c_seq=${commentContent.c_seq}"><input
									type="button" value="삭제"></a></td>
						</tr>
					</c:forEach> --%>
				</table>
			</div>
			<div class="col mt-5">
				<form action="/board/insertCommentAction" method="post">
					<table class="w-100">
						<tr>
							<td><label class="form-label" for="c_writer">닉네임</label> <input
								class="form-control" type="text" name="c_writer" id="c_writer"
								value=""> <label class="form-label" for="c_text">내용</label>
								<textarea class="form-control" rows="3" cols="50" name="c_text"
									id="c_text"></textarea></td>
						</tr>
					</table>
					<input type="text" class="d-none" name="c_boardSeq"
						value="${boardContent.b_seq }"> <input type="submit"
						value="댓글작성" class="btn btn-primary">
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