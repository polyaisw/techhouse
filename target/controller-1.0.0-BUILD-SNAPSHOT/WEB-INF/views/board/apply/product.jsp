<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TECH HOUSE - 이달의 상품</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link href="/resources/css/apply.css" rel="stylesheet">
<link href="/resources/css/default.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../../init/header.jsp"></jsp:include>
	<jsp:include page="../../init/nav.jsp"></jsp:include>

	<div class="container">
		<div class="row w-75 mx-auto">
			<div class="col">
				<h2 class="h2 text-white">관리자용</h2>

				<form method="post" action="/board/insertProductAction">
					<label for="prod_productName" class="form-label text-white">상품명</label>
					<input type="text" placeholder="상품명을 입력하세요" class="form-control"
						id="prod_productName" name="prod_productName"> <label
						for="prod_price" class="form-label text-white">상품가격</label> <input
						type="text" class="form-control" placeholder="상품가격을 입력하세요"
						id="prod_price" name="prod_price"> <label
						for="prod_uploadImg" class="form-label text-white">업로드이미지</label>
					<input type="file" class="form-control" placeholder="상품이미지명 입력하세요"
						id="prod_uploadImg" name="prod_uploadImg"> <input
						type="submit" class="btn btn-primary" value="상품등록하기">
				</form>
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
											<input class="form-check-input" type="radio" name="prod_seq_"
												id="flexRadioDefault1" value="${productContents.prod_seq}">
											<label class="form-check-label" for="flexRadioDefault1">
											</label>
										</div>
									</td>
									<td>${productContents.prod_productName}</td>
									<td>${productContents.prod_price}</td>
									<td>${productContents.prod_selectedId}</td>
									<td>${productContents.prod_selectedName}</td>
									<td>${productContents.prod_selectedTel}</td>
									<td>${productContents.prod_date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>



					<input type="button" value="수정하기" id="updateProductBtn"
						class="btn btn-primary" onclick='mySubmit(1)' /> <input
						type="button" value="삭제하기" class="btn btn-primary"
						onclick='mySubmit(2)' /> <input type="button" name="countStart"
						class="btn btn-primary" onclick="mySubmit(3)" value="상품 게시하기">
					<a href="/board/UnPostProductAction" class="btn btn-primary">상품
						게시글 내리기</a>
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
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="blockquote-wrapper">
					<div class="blockquote">
						<h1>
							Increase your odds of winning with an entry <span
								style="color: #ffffff">"ticket"</span>. That is the same as the
							<span style="color: #ffffff">${productContent.prod_productName}</span>
						</h1>
						<h4>
							&mdash;Tech house<br> <em>development team support...</em>
						</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="row mb-5">
			<div class="col text-center">
				<a href="/board/apply/roulette"
					class="btn btn-outline-warning text-white ">룰렛 돌리기</a>
			</div>
		</div>
		<div class="row ">
			<div class="col d-flex my-5 justify-content-center">
				<span class="h3  text-white ">사용된 응모권 : ${count}개</span> <i
					class="fa-solid fa-bolt text-warning applyIcon"></i><i
					class="fa-solid fa-bolt text-warning applyIcon"></i>
			</div>
			<div class="col my-5 d-flex my-5 justify-content-center">
				<span class="h3 text-white ">나의 당첨 확률 : ${percent}%</span>
			</div>
		</div>
	</div>

	<div class="container border border-white d-flex flex-column rounded">
		<div class="row">
			<div class="col">
				<h3 class=" text-center pt-2 text-danger my-3">
					<c:if test="${productContent.prod_posting != 1 }">현재 진행중인 상품이 없습니다.</c:if>
					<c:if test="${productContent.prod_posting == 1 }">
					진행중<span class="text-white"> : ${ productContent.prod_productName }</span>
					</c:if>
				</h3>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-xl-6  p-0 my-5 text-center">
				<img
					src="/resources/image/geforce-rtx-30-series-e77dfbf8-1ce3-4042-9baa-0629c6e17dbb-prv.png"
					class="text-center  box-shadow img-fluid " width="600px"
					height="350px" style="object-fit: fill;">
			</div>
			<div class="row border-top border-1 ">
				<div class="col d-flex flex-row justify-content-around py-3">
					<div class="count_ticket">

						<i class="fa-solid fa-heart-circle-bolt text-white applyIcon"></i>
						<span class="h3 text-white">${countMe }</span>
					</div>

					<div class="timer">
						<i class="fa-regular fa-clock applyIcon text-white"></i> <span
							id="countdown" class="h3 text-white">00:00:00</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container ">
		<div class="row text-center">
			<div class="col my-5 ">
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
									type="submit" class="btn btn-outline-warning text-white my-5"
									value="응모하기">
							</form>
						</c:if>
					</c:if>
				</c:if>

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
			    
				
			if (index == 1){
				
				document.myForm.action = '/board/updateProductForm?prod_seq='+prod_seq;
				document.myForm.submit();
				}
			
			else if (index == 2){
				
				document.myForm.action = '/board/deleteProductAction?prod_seq='+prod_seq;
				document.myForm.submit();
				}
			
			else if (index == 3)
				
				countStart(prod_seq); 
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