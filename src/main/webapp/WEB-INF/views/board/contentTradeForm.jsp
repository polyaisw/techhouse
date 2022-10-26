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
				<form action="/board/updateTradeForm" method="post">
					<input type="text" class="d-none" name="t_seq"
						value="${ tradeContent.t_seq }">
					<table class="boarder w-100">
						<tr>
							<td>글번호</td>
							<td>${ tradeContent.t_seq }</td>
						<tr>
						<tr>
							<td>조회수</td>
							<td>${ tradeContent.t_views }</td>
						<tr>
							<td>이 름</td>
							<td>${ tradeContent.t_writer}</td>
						</tr>
						<tr>
							<td>상태</td>
							<td>${ tradeContent.t_state}</td>
						</tr>
						<tr>
							<td>가격</td>
							<td>${ tradeContent.t_price}원</td>
						</tr>
						<tr>
							<td>상품명</td>
							<td>${ tradeContent.t_prodName}</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>${ tradeContent.t_category }</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>${ tradeContent.t_title}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>${tradeContent.t_text}</td>
						</tr>

						<tr>
							<td>업로드이미지(임시)</td>
							<td>${ tradeContent.t_uploadImg }</td>
						</tr>
						<tr>
							<c:if test="${member.name == tradeContent.t_writer}">
								<td><input type="submit" value="글 수정하기"
									class="btn btn-primary"> <a
									href="/board/deleteTradeBoardAction?t_seq=${ tradeContent.t_seq}"
									class="btn btn-primary">삭제하기</a></td>
							</c:if>
						</tr>
						<tr>
							<td><input type="button" class="btn btn-primary"
								value="목록으로" onclick="goToList('${tradeContent.t_category}')"></td>
						</tr>
						<tr>
							<c:choose>
								<c:when test="${member.name != null}">
									<c:if test="${member.rank != '관리자' }">
										<c:if test="${member.name != tradeContent.t_writer}">
											<c:choose>
												<c:when test="${ tradeContent.t_state != '판매중'}">
													<td><input type="button"
														class="btn btn-primary disabled" value="바로구매" onclick="#">
														<input type="button" class="btn btn-primary disabled"
														value="안심거래" onclick="#"></td>
													
												</c:when>
												<c:otherwise>
															<td><a class="btn btn-success" href="#">바로구매</a> <a
														class="btn btn-success" href="#">안심거래</a></td>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:if>
								</c:when>
								<c:otherwise>
									<td><a class="btn btn-primary" href="/member/login">바로구매</a>
										<a class="btn btn-primary" href="/member/login">안심거래</a></td>
								</c:otherwise>
							</c:choose>
							<!-- if, else의 종료임을 정의-->



							<%-- 		<c:if test="${member.name != tradeContent.t_writer}">
								<c:if test="${ tradeContent.t_state != '판매중'}">
									<td><input type="button" class="btn btn-primary disabled"
										value="바로구매" onclick="#" > <input type="button"
										class="btn btn-primary disabled" value="안심거래" onclick="#"></td>

								</c:if>
								<td><input type="button" class="btn btn-primary"
									value="바로구매" onclick="#"> <input type="button"
									class="btn btn-primary" value="안심거래" onclick="#"></td>
							</c:if>
							<c:if test="${member.name == null}">
								<td><a class="btn btn-primary" href="/member/login">바로구매</a>
									<a class="btn btn-primary" href="/member/login">안심거래</a></td>
							</c:if> --%>
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
					<c:forEach var="commentContent" items="${commentList}">
						<tr>
							<td>${commentContent.c_writer}</td>
							<td>${commentContent.c_text}</td>
							<td>${ commentContent.c_date }</td>
							<c:if test="${member.name == commentContent.c_writer }">
								<td><a class="btn btn-primary"
									href="/board/deleteCommentAction?t_seq=${tradeContent.t_seq }&c_boardSeq=${commentContent.c_boardSeq }&c_seq=${commentContent.c_seq}">
										삭제</a></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<c:if test="${member==null}">
				<div class="col-md-12 mt-5">
					<span class="text-white">로그인을 해주세요</span>
				</div>
			</c:if>
			<c:if test="${member!=null}">
				<div class="col-md-12 mt-5">
					<form
						action="/board/insertCommentAction?t_seq=${ tradeContent.t_seq}"
						method="post">
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
							value="${tradeContent.t_seq }"> <input type="text"
							class="d-none" name="c_writer" value="${member.name }"><input
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