<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
							<td>${boardContent.b_text}</td>
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

							<c:if test="${member.name == boardContent.b_writer}">
								<td><input type="submit" value="글 수정하기"
									class="btn btn-primary"> <a
									href="/board/deleteBoardAction?b_seq=${ boardContent.b_seq}"
									class="btn btn-primary">삭제하기</a></td>
							</c:if>

						</tr>
						<tr>

							<td><a
								href="/board/recommendAction?b_seq=${boardContent.b_seq }"
								class="btn btn-primary">추천하기</a>
							<input type="button" class="btn btn-primary"
								value="목록으로" onclick="goToList('${boardContent.b_category}')">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-12">
				<table class="border w-100">
					<thead class="border">
						<tr>
							<th>닉네임</th>
							<th>내용</th>
							<th>날짜</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="commentContent" items="${commentList}">
							<tr>
								<td>${ commentContent.c_writer }</td>
								<td>${commentContent.c_text}</td>
								<td>${ commentContent.c_date }</td>
								<c:if test="${member.name == commentContent.c_writer }"><td><a
									href="/board/deleteCommentAction?c_seq=${commentContent.c_seq}&c_boardSeq=${commentContent.c_boardSeq}"><input
										type="button" class="btn btn-primary"value="삭제"></a></td></c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:if test="${member==null}">
				<div class="col-md-12 mt-5">
					<span class="text-white">로그인을 해주세요</span>
				</div>
			</c:if>
			<c:if test="${member!=null}">
				<div class="col-md-12 mt-5">
					<form action="/board/insertCommentAction" method="post">
						<table class="w-100">
							<tr>
								<td><label class="form-label" for="c_writer">닉네임</label>
									<p class="text-white">${member.name }</p> <label
									class="form-label" for="c_text">내용</label> <textarea
										class="form-control" rows="3" cols="50" name="c_text"
										id="c_text"></textarea></td>
							</tr>
						</table>
						<input type="text" class="d-none" name="c_boardSeq"
							value="${boardContent.b_seq }"> <input type="text"
							class="d-none" name="c_writer" value="${member.name }"> <input
							type="submit" value="댓글작성" class="btn btn-primary">
					</form>
				</div>
			</c:if>
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