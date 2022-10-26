<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TECH HOUSE - 벤치마크 인증</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/resources/css/default.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="../../init/header.jsp"></jsp:include>
	<jsp:include page="../../init/nav.jsp"></jsp:include>

<div class="container text-white">
		<div class="row">
			<div class="col ">
				<table class="w-100 border">
					<thead class="border">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="boardList" items='${list}'>

							<tr>
								<td>${ boardList.b_seq }</td>
								<td><a href="/board/contentForm?b_seq=${ boardList.b_seq }">
										${ boardList.b_title }</a></td>
								<td>${ boardList.b_writer }</td>
								<td>${ boardList.b_views }</td>
								<td>${ boardList.b_recommed }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		<div class="row">
			<div class="col">
				<c:if test="${member != null}">
					<a href="/board/insertBoardForm" class="btn btn-primary">글작성</a>
				</c:if>
			</div>
		</div>
	</div>

	<jsp:include page="../../init/footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script src="https://kit.fontawesome.com/5547fa07a6.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>