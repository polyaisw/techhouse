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

<title>TECH HOUSE - 응모 상품 페이지</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link href="/resources/css/apply.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="/resources/assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="/resources/assets/css/owl.css">
<link rel="stylesheet" href="/resources/assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->

<!-- <link href="/resources/css/default.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet"> -->

</head>
<body onload="inputData('${nowTime }','${closeTime}');">
	<jsp:include page="../../init/header.jsp"></jsp:include>

	<c:if test="${member.rank eq '관리자'}">
		<div class="container" style="margin-top: 150px; width:1280px">
			<div class="page-content " >
				<div class="most-popular m-0">
					<div class="row w-75 mx-auto">
						<div class="col">
							<h1 class="h1 text-white">관리자용</h1>

							<form method="post" action="/board/insertProductAction"
								class="was-validated">
								<label for="prod_productName" class="form-label text-white">상품명</label>
								<input type="text" placeholder="상품명을 입력하세요" class="form-control"
									id="prod_productName" name="prod_productName" required>
								<div class="invalid-feedback">상품명을 반드시 입력해주세요</div>
								<label for="prod_price" class="form-label text-white">상품가격</label>
								<input type="text" class="form-control" value="0"
									placeholder="상품가격을 입력하세요" id="prod_price" name="prod_price">
								<label for="prod_uploadImg" class="form-label text-white">업로드이미지</label>
								<input type="file" class="form-control"
									placeholder="상품이미지명 입력하세요" id="prod_uploadImg"
									name="prod_uploadImg"> <input type="submit"
									class="button-0 mt-3" value="상품등록하기">
							</form>
						</div>
					</div>
				</div>
				<div class="row w-100 mx-auto mt-5">
					<div class="col-md-12">
						<form name='myForm' method='post'>

							<table class="w-100 text-white">
								<thead>
									<tr>
										<th></th>
										<th>상품명</th>
										<th>상품 유통 가격</th>
										<th>당첨자 아이디</th>
										<th>당첨자 닉네임</th>
										<th>당첨자 연락처</th>
										<th>게시 날짜</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="productContents" items='${productList}'>
										<tr>
											<td>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="prod_seq_" id="flexRadioDefault1"
														value="${productContents.prod_seq}"> <label
														class="form-check-label" for="flexRadioDefault1">
													</label>
												</div>
											</td>
											<td>${productContents.prod_productName}</td>
											<td>${productContents.prod_price}원</td>
											<td>${productContents.prod_selectedId}</td>
											<td>${productContents.prod_selectedName}</td>
											<td>${productContents.prod_selectedTel}</td>
											<td>${productContents.prod_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>


							<c:choose>
								<c:when test="${productAppContent != null }">
									<input type="button" value="수정하기" id="updateProductBtn"
										class="btn btn-success disabled" onclick='mySubmit(1)' />
									<input type="button" value="삭제하기"
										class="btn btn-success disabled" onclick='mySubmit(2)' />
									<input type="button" name="countStart"
										class="btn btn-success disabled" onclick="mySubmit(3)"
										value="상품 게시하기">

									<a href="/board/UnPostProductAction"
										class="btn btn-success disabled">상품 게시글 내리기</a>
									<p class="text-warning">상품의 게시 카운트다운 종료시 버튼이 활성화 됩니다.
								</c:when>
								<c:otherwise>
									<input type="button" value="수정하기" id="updateProductBtn"
										class="btn btn-success" onclick='mySubmit(1)' />
									<input type="button" value="삭제하기" class="btn btn-success"
										onclick='mySubmit(2)' />
									<c:choose>
										<c:when test="${productContent.prod_posting == 1 }">
											<input type="button" name="countStart"
												class="btn btn-success" onclick="mySubmit(3)"
												value="상품 게시하기" disabled>
											<a href="/board/UnPostProductAction" class="btn btn-success">상품
												게시글 내리기</a>
											<p class="text-warning">게시중인 상품이 있습니다. 상품 게시글 내리기를 눌러주세요</p>
										</c:when>
										<c:otherwise>
											<input type="button" name="countStart"
												class="btn btn-success" onclick="mySubmit(3)"
												value="상품 게시하기">
											<a href="/board/UnPostProductAction" class="btn btn-success">상품
												게시글 내리기</a>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>

						</form>

					</div>
					<div class="col-md-12">
						<table class="w-100 text-white mt-5">
							<thead>
								<tr>
									<th></th>
									<th>진행된 상품명</th>
									<th>지원자 아이디</th>
									<th>지원자 닉네임</th>
									<th>지원자 연락처</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="applyContents" items='${applyList}'>
									<tr>
										<td>${applyContents.a_seq}</td>
										<td>${applyContents.a_productName}</td>
										<td>${applyContents.a_applyId}</td>
										<td>${applyContents.a_applyName}</td>
										<td>${applyContents.a_applyTel}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:if>


	<div class="container-fluid">
		<div class="most-popular">
			<div class="gradient-body ">
				<div class="row">
					<div class="col">
						<div class="blockquote-wrapper">
							<div class="blockquote">
								<h3 class="fw-bold">
									<i class="fa-solid fa-bolt text-warning pe-1"></i>응모를 통해 상품을 획득하세요!<i class="fa-solid fa-bolt text-warning ps-1"></i>
								</h3>
								<h4 class="fw-bold">
									&mdash;Tech house<br> <em>"룰렛을 통해 응모권을 얻을 수 있어요"</em>
								</h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col text-center">
				<a href="/board/apply/roulette" class="button-0">룰렛 돌리기</a>
			</div>

		</div>

	</div>
	<div class="container mt-5">
		<div class="page-content border"style="border-color:#e75e8d!important;">
			<div class="row ">
				<div class="col d-flex my-5 justify-content-center">
					<h4 class="">
						<em style="color:#d4d4d4;">총 사용된 응모권 : ${count}개</em>
					</h4>
				</div>
				<div class="col my-5 d-flex my-5 justify-content-center">
					<h4 class="">
						<em style="color:#d4d4d4;">나의 당첨 확률 : ${percent}%</em>
					</h4>
				</div>
			</div>

			<div class="container   d-flex flex-column ">
				<c:if test="${productContent.prod_posting != 1  }">
					<div class="row">
						<div class="col">
							<h3 class=" text-center pt-2 my-3" style="color:#e75e8d;">현재 진행중인 상품이 없습니다.</h3>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-xl-6  p-0 my-5 text-center">
							<img src="/resources/images/product/noproduct_default.png"
								class="text-center  box-shadow img-fluid border rounded "
								style="max-width: 500px; max-height: 500px;"
								style="object-fit: fill;">
						</div>
						<div class="row   ">
							<div class="col d-flex flex-row justify-content-around py-3">
								<div class="count_ticket">
									<h4 class="h4 ">
										<i class="fa-solid fa-heart-circle-bolt text-white applyIcon"></i>
										<em>${countMe }</em>
									</h4>
								</div>

								<div class="timer">
									<h4 class="h4">
										<i class="fa-regular fa-clock applyIcon text-white"></i> <em
											id="countdown" class="h3 text-white"></em>
									</h4>
								</div>
							</div>
						</div>
					</div>
				</c:if>

				<c:if test="${productContent.prod_posting == 1 }">
					<div class="row">
						<div class="col">
							<h3 class=" text-center pt-2 text-danger my-3">
								진행중 : <span class="text-white">${productContent.prod_productName}</span>
							</h3>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-xl-6  p-0 my-5 text-center">
							<img
								src="/resources/images/product/${productContent.prod_uploadImg }"
								class="text-center  box-shadow img-fluid border rounded border-0"
								style="max-width: '500px'; max-height: '500px';"
								style="object-fit: fill;">
						</div>
						<div class="row   ">
							<div class="col d-flex flex-row justify-content-around py-3">
								<div class="count_ticket">

									<i class="fa-solid fa-heart-circle-bolt text-white applyIcon"></i>
									<span class="h3 text-white">${countMe }</span>
								</div>

								<div class="timer">
									<i class="fa-regular fa-clock applyIcon text-white"></i> <span
										id="countdown" class="h3 text-white"></span>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<div class="container ">
				<div class="row text-center">
					<div class="col my-5 ">
						<c:choose>
							<c:when test="${productAppContent != null }">
								<c:if test="${member!=null }">
									<c:if test="${productContent.prod_posting == 1 }">
										<c:if test="${member.ticket == 0}">
											<div class="text-white">보유한 응모권 수 : 0</div>
											<div class="text-warning">룰렛을 돌려 응모권을 획득해보세요</div>
										</c:if>
										<c:if test="${member.ticket != 0}">

											<div class="text-white">보유한 응모권 수 : ${member.ticket }</div>
											<form action="/board/insertApplyAction" method="post">
												<input type="text" class="d-none" name="prod_productName"
													value="${ productContent.prod_productName }"> <input
													type="submit" class="button-0 my-5" value="응모하기">
											</form>
										</c:if>
									</c:if>
								</c:if>
							</c:when>
							<c:otherwise>
								<a href="javascript:alert('시간이 다 되었거나 지금은 진행중이지 않네요.');"
									class="button-0  my-5">응모하기</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr class="hr-14">
	<div class="container info ">
		<div class="row">
			<div class="col">
				<p class="h1 text-white">주의사항</p>
				<ul class="h5 text-white">
					<li><p>
							응모횟수당 한개의 응모권이 필요하며 <a href="/board/apply/roulette"
								class="text-primary">룰렛</a>에서 획득하실 수 있습니다.
						</p></li>
					<li><p>중첩응모가 가능하며 당첨확률이 높아집니다.</p></li>
					<li><p>정해진 기간동안만 응모가 가능합니다.</p></li>
					<li><p>기간 종료 시 당첨자가 표시되며 해당 유저에게 이메일이 전송됩니다.</p></li>
				</ul>
			</div>
		</div>
	</div>

	<jsp:include page="../../init/footer.jsp"></jsp:include>
	<script type="text/javascript">

 	document.getElementById('updateProductBtn').onclick = function() {
	    var radios = document.getElementsByName("prod_seq_");
	    var selected = Array.from(radios).find(radio => radio.checked);
		var prod_seq = selected.value;

		document.myForm.action = '/board/updateProductForm?prod_seq='+prod_seq;
		document.myForm.submit();
	}



	
		function mySubmit(index) {

			     radios = document.getElementsByName("prod_seq_");
				
				    var selected = Array.from(radios).find(radio => radio.checked);
					var prod_seq = selected.value;
			    	console.log(prod_seq);
				
			if (index == 1){
				
				document.myForm.action = '/board/updateProductForm?prod_seq='+prod_seq;
				document.myForm.submit();
				}
			
			else if (index == 2){
				
				document.myForm.action = '/board/deleteProductAction?prod_seq='+prod_seq;
				document.myForm.submit();
				}
			
			else if (index == 3)
				{
				var closeHour = prompt("게시할 시간(hour)을 입력해주세요");
				document.myForm.action = "/board/PostProductAction?prod_seq="+prod_seq+"&closeHour="+closeHour;
				document.myForm.submit();
				}
				
		}

		function inputData(nowTime,closeTime){
			var el = document.querySelector('#countdown');
			if(el.innerHTML === 'TIME OUT'){
				location.href="/board/timeoutAction";
				}
			else{
				countStart(nowTime,closeTime);
				}
			}
		
	</script>

	<script src="https://kit.fontawesome.com/5547fa07a6.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="/resources/js/countdown.js"></script>
</body>
</html>