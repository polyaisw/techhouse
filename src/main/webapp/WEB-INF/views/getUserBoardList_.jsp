<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${getPageRange}";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
</head>
<body>

<form id="userSearchForm" method="get" action="/userSearchAction" >		<!-- userSearhAction은 SearchController에 있음 -->
<input type="search" name="userName" id="userSearch" placeholder="유저이름 검색">

</form>

	<c:url var="getPageRange" value="/getUserBoardList_">
		<c:param name="page" value="${pagination.page}" />
		<c:param name="range" value="${pagination.range}" />
	</c:url>

<div class="container">
	<div class="row">
		<div class="com-md-6">
		<!-- 모든 카테고리 게시글{s} -->
		<table class="table table-dark table-hover rounded">
							<thead class="">
								<tr>
									<th>추천</th>
									<th width="600px;">제목</th>
									<th>작성자</th>
									<th>조회수</th>
									<th>게시날짜</th>
								</tr>
							</thead>
							<tbody class="" style="color: #666666;">
								<c:forEach var="boardList" items='${boardList}'>

									<tr>
										<td>${ boardList.b_recommed }</td>
										<td><a
											href="/board/contentForm?b_seq=${ boardList.b_seq }"
											class="d-inline-block text-truncate"
											style="max-width: 550px;"> ${ boardList.b_title }</a></td>
										<td>${ boardList.b_writer }</td>
										<td>${ boardList.b_views }</td>
										<td>${ boardList.b_date }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
		
		
		
		
		
		
		<!-- 모든 카테고리 게시글{e} -->
		<!-- pagination{s} -->
						<div id="paginationBox ">
							<ul class="pagination d-flex justify-content-center">
								<c:if test="${pagination.prev}">
									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
								</c:if>
								<c:forEach begin="${pagination.startPage}"
									end="${pagination.endPage}" var="idx">
									<li
										class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
										class="page-link" href="#"
										onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
											${idx} </a></li>
								</c:forEach>
								<c:if test="${pagination.next}">
									<li class="page-item"><a class="page-link" href="#"onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
								</c:if>
							</ul>
						</div>
						<!-- pagination{e} -->
		</div>
		<div class="com-md-6">
		<!-- 거래게시글{s}-->
		<table class="w-100 border">
					<thead class="border">
						<tr>
							<th>번호</th>
							<th>이미지</th>
							<th>제목</th>
							<th>가격</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="tradeList" items='${tradeList}'>
							
							<tr>
								<td>${ tradeList.t_seq }</td>
								<td><a href="/board/contentTradeForm?t_seq=${ tradeList.t_seq }">
										${ tradeList.t_uploadImg }</a></td>
								<td><a href="/board/contentTradeForm?t_seq=${ tradeList.t_seq }">${ tradeList.t_title }</a></td>
							 	<td>${ tradeList.t_price }</td>
							 	<td>${ tradeList.t_views }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		<!-- 거래게시글{e} -->
		
		
		
		
		<!-- pagination{s} -->
							<div id="paginationBox ">
							<ul class="pagination d-flex justify-content-center">
								<c:if test="${pagination2.prev}">
									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_prev('${pagination2.page}', '${pagination2.range}', '${pagination2.rangeSize}')">Previous</a></li>
								</c:if>
								<c:forEach begin="${pagination2.startPage}"
									end="${pagination2.endPage}" var="idx">
									<li
										class="page-item <c:out value="${pagination2.page == idx ? 'active' : ''}"/> "><a
										class="page-link" href="#"
										onClick="fn_pagination('${idx}', '${pagination2.range}', '${pagination2.rangeSize}')">
											${idx} </a></li>
								</c:forEach>
								<c:if test="${pagination2.next}">
									<li class="page-item"><a class="page-link" href="#"onClick="fn_next('${pagination2.range}', '${pagination2.range}', '${pagination2.rangeSize}')">Next</a></li>
								</c:if>
							</ul>
						</div>
						
						<!-- pagination{e} -->
		
		</div>
	</div>
</div>
















</body>

	<script type="text/javascript">
		var inputForm = document.querySelector('#userSearch');

		function press(f) {
			if (f.keyCode == 13) { //javascript에서는 13이 enter키를 의미함
				inputForm.submit(); //formname에 사용자가 지정한 form의 name입력
			}
		}
	</script>
</html>