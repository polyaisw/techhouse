<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<title>TECH HOUSE - 메인</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
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

<link rel="stylesheet" href="/resources/css/search.css">

<style>
.intro {
	color: #666;
	font-size: 14px;
}

body {
	background: rgb(31, 33, 34);
	background: linear-gradient(180deg, rgba(31, 33, 34, 1) 4%,
		#1a4230 93%);
}
.badge-pill { 
	color : #666666;
}

.color-edit {
	color: var(--bs-success)
}

.gaming-library {
	box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px
		10px 10px;
}

.item {
	box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px
		10px 10px
}
.gaming-library .item {
	border-bottom: 1px solid #198754;
	border-radius:10px;
}
.main-banner {
	background-image : url(/resources/images/banner.jpg);
}
.h4-shadow {
	color: transparent;
background: #666666;
-webkit-background-clip: text;
-moz-background-clip: text;
background-clip: text;
text-shadow: 0px 3px 3px rgba(255,255,255,0.5);
}
.most-popular .item {
padding: 10px 10px;
    border-radius: 10px;
}
.most-popular .item img {
    border-radius: 10px;
}

.modal {
--bs-modal-header-border-color: var(--bs-border-color);
--bs-modal-footer-border-color: var(--bs-border-color);
}

.modal-content {
background-color:rgb(31,33,34);
-webkit-box-shadow: 0px 3px 0px 2px rgba(0,0,0,0.1), 0px 6px 0px 4px rgba(0,0,0,0.1), 0px 9px 0px 6px rgba(0,0,0,0.1), 0px 12px 0px 8px rgba(0,0,0,0.1), 0px 15px 0px 10px rgba(0,0,0,0.1), 0px 18px 0px 12px rgba(0,0,0,0.1), 0px 21px 0px 14px rgba(0,0,0,0.1), 0px 24px 0px 16px rgba(0,0,0,0.1), 0px 27px 0px 18px rgba(0,0,0,0.1), 0px 30px 0px 20px rgba(0,0,0,0.1), 5px 5px 15px 5px rgba(255,255,255,0); 
box-shadow: 0px 3px 0px 2px rgba(0,0,0,0.1), 0px 6px 0px 4px rgba(0,0,0,0.1), 0px 9px 0px 6px rgba(0,0,0,0.1), 0px 12px 0px 8px rgba(0,0,0,0.1), 0px 15px 0px 10px rgba(0,0,0,0.1), 0px 18px 0px 12px rgba(0,0,0,0.1), 0px 21px 0px 14px rgba(0,0,0,0.1), 0px 24px 0px 16px rgba(0,0,0,0.1), 0px 27px 0px 18px rgba(0,0,0,0.1), 0px 30px 0px 20px rgba(0,0,0,0.1), 5px 5px 15px 5px rgba(255,255,255,0);
}

li > a
</style>
</head>
<jsp:include page="init/header.jsp"></jsp:include>

<!--   						<div class="item">
							<img src="/resources/images/geforce-rtx-30-series-e77dfbf8-1ce3-4042-9baa-0629c6e17dbb-prv.png">
		                    <h4>상품명<br><span class="text-white">00: 00: 00</span></h4>
		                    <ul>
		                      	<li>
		                      		<div class="main-button">
                    					<a href="/board/apply/product">응모 하러가기 &gt;</a>
                  					</div>
                  				</li>
		                    </ul>							
						</div>
					</div> -->


<body>

	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->


	<!-- ***** Header Area Start ***** -->

	<div class="container">
		<div class="row">


			<div class="col-lg-12">
				<div class="page-content" style="margin-top: 110px;">

					<!-- ***** Banner Start ***** -->
					<div class="main-banner">
						<div class="row">
							<div class="col-lg-12 text-center">
								<div class="header-text">
									<h6>테크하우스에 오신것을 환영합니다.</h6>
									<h4>
										최신 <em class="" style="color:var(--bs-teal)">&quot;IT/트렌드&quot;</em> 정보를 확인해보세요
									</h4>
									<div class="button-4">
										<a href="/board/news/trend" class="fw-bold">소식 보러가기 &gt;</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Banner End ***** -->
					<div class="most-popular">
						<div class="row">
							<div class="col-lg-12">
								<div class="heading-section">
								</div>

								<!-- ***** NewsBoard Start ***** -->
								<div class="row">
									<h4 class="text-white h4-shadow mb-5">뉴스 최신글</h4>
									<div class="col-lg-6 mb-4">
										<div class="middle-section ">
											<h5 class="d-flex justify-content-between">
												<span><span class="color-edit">핫이슈</span></span> <a
													href="/board/news/issue"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="issueList" items="${issueList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${issueList.b_seq }"
													class="mb-2 d-inline-block text-truncate"
													style="max-width: 580px;"> ${issueList.b_title }</a> <span
													class="badge badge-pill">${issueList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
									</div>

									<div class="col-lg-6 mb-4">
										<div class="middle-section ">
											<h5 class="d-flex justify-content-between">
												<span> <span class="color-edit">IT/트렌드</span></span> <a
													href="/board/news/trend"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="trendList" items="${trendList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${trendList.b_seq }"
													class="mb-2 d-inline-block text-truncate"
													style="max-width: 350px;"> ${trendList.b_title }</a> <span
													class="badge badge-pill">${trendList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
									</div>
																		<div class="col-lg-6 mb-4">
										<div class="middle-section ">
											<h5 class="d-flex justify-content-between">
												<span> <span class="color-edit">게임 출시 정보</span></span> <a
													href="/board/news/gameInfo"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="gameInfoList" items="${gameInfoList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${gameInfoList.b_seq }"
													class="mb-2 d-inline-block text-truncate"
													style="max-width: 350px;"> ${gameInfoList.b_title }</a> <span
													class="badge badge-pill">${gameInfoList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
									</div>
																		<div class="col-lg-6 mb-4">
										<div class="middle-section ">
											<h5 class="d-flex justify-content-between">
												<span> <span class="color-edit">꿀딜/장터</span></span> <a
													href="/board/news/hotDeal"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="hotDealList" items="${hotDealList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${hotDealList.b_seq }"
													class="mb-2 d-inline-block text-truncate"
													style="max-width: 350px;"> ${hotDealList.b_title }</a> <span
													class="badge badge-pill">${hotDealList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
									</div>

									<!-- ***** NewsBoard END ***** -->
								</div>
							</div>
						</div>
					</div>
					<div class="most-popular">
						<div class="row">
								<h4 class="text-white h4-shadow mb-5">커뮤니티 최신글</h4>
									<div class="col-lg-6 mb-4">
										<div class="middle-section ">
											<h5 class="d-flex justify-content-between">
												<span><span class="color-edit">자유게시판</span></span> <a
													href="/board/community/free"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="freeList" items="${freeList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${freeList.b_seq }"
													class="mb-2 d-inline-block text-truncate"
													style="max-width: 350px;"> ${freeList.b_title }</a> <span
													class="badge badge-pill">${freeList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="col-lg-6 mb-4">
										<div class="middle-section ">
											<h5 class="d-flex justify-content-between">
												<span><span class="color-edit">인증게시판</span></span> <a
													href="/board/community/mysetting"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="mySettingList" items="${mySettingList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${mySettingList.b_seq }"
													class="mb-2 d-inline-block text-truncate"
													style="max-width: 350px;"> ${mySettingList.b_title }</a> <span
													class="badge badge-pill">${mySettingList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
										<div class="middle-section mt-4">
											<h5 class="d-flex justify-content-between">
												<span><span class="color-edit">취미공유</span></span> <a
													href="/board/community/hobby"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="hobbyList" items="${hobbyList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${hobbyList.b_seq }"
													class="mb-2 d-inline-block text-truncate"
													style="max-width: 350px;"> ${hobbyList.b_title }</a> <span
													class="badge badge-pill">${hobbyList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
									</div>
									<%-- <div class="col-lg-4 mb-4">
										<div class="middle-section ">
											<h5 class="d-flex justify-content-between">
												<span><span class="color-edit">취미공유</span></span> <a
													href="/board/news/issue"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="hobbyList" items="${hobbyList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${hobbyList.b_seq }"
													class="h5 d-inline-block text-truncate"
													style="max-width: 580px;"> ${hobbyList.b_title }</a> <span
													class="badge badge-pill">${hobbyList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
									</div> --%>
						</div>
					
					</div>
					
					<div class="carousel-inner mb-5">
						<div class="most-popular header-text">
							<div class="heading-section mb-3">
								<h4 class="mb-1 h4-shadow text-white" style="font-size:24px;">
									인증 베스트
								</h4>
								<span class="text-white ">직접 촬영한 사진을 올려보세요</span>
							</div>
							<div class="owl-features owl-carousel">
								<c:forEach var="mySettingListBest" items="${mySettingListBest }">
								<div class="item">
									<div class="thumb">
										<a href="/board/contentForm?b_seq=${mySettingListBest.b_seq }"><img
											src="/resources/images/user_upload/${mySettingListBest.b_uploadImg }"
											alt="" style="width: 250px; height: 250px;"></a>
										<div class="hover-effect mt-3">
											<h5 class="fs-6"><a href="/board/contentForm?b_seq=${mySettingListBest.b_seq }">${mySettingListBest.b_title }</a></h5>
										</div>
									</div>
									<h4>${mySettingListBest.b_writer }<br> <span>${mySettingListBest.b_date }</span>
									</h4>
									<ul>
										<li><i class="fa-regular fa-thumbs-up"></i>
											${mySettingListBest.b_recommed }</li>
										<li><i class="fa-solid fa-eye text-white"></i>
											${mySettingListBest.b_views }</li>
									</ul>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
					
					
					
					<!-- ***** Trade Start ***** -->
					<div class="most-popular">
						<div class="row">

							<div class="col-lg-12">
							
							
							
							
							
							
								<div class="heading-section d-flex justify-content-between">
									<h4 class="text-white h4-shadow" style="font-size:24px;">중고거래 최신글 
										<i
											class="fa-brands fa-hotjar text-warning"></i>
									</h4>
<!-- 									<div class="search-input">
										<form id="search" action="/searchAction" method="get"
											name="input-form">
											<input type="text" placeholder="거래글 검색" id='searchText'
												name="searchKeyword" /> <i class="fa fa-search"></i>
										</form>
									</div> -->

								</div>
								<div class="row">
									<c:forEach var="tradeList" items="${tradeList }">
										<div class="col-lg-3 col-sm-6">
											<div class="item">
												<%-- <span
													class="badge rounded-pill text-bg-success d-inline mt-3">인증</span>
												<span class="badge rounded-pill text-bg-info d-inline mt-3">${tradeList.t_state }</span> --%>
												<a href="/board/contentTradeForm?t_seq=${tradeList.t_seq }">
													<img
													src="/resources/images/user_upload/${tradeList.t_uploadImg }"
													alt="" style="width: 160px; height: 160px;">
												</a>

												<h4 class="inline">
													<a href="/board/contentTradeForm?t_seq=${tradeList.t_seq }">
														<span class=" d-inline-block text-truncate text-white" style="max-width:150px;">${tradeList.t_title}</span><br> <span>${tradeList.t_price }원</span>
													</a>
												</h4>
											</div>
										</div>
									</c:forEach>
									<div class="col-lg-12">
										<div class="main-button">
											<a href="/board/trade/tradeBoard.html" class="fw-bold">중고 거래 보러가기 &gt;</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Trade End ***** -->
					<!-- ***** Apply/HotDeal Start ***** -->
					<%-- <div class="row ">
						<div class="col-lg-6">
							<div class="most-popular">
								<div class="heading-section d-flex justify-content-between">
									<h4>
										<span class="text-white">놓치지마세요 </span> <i
											class="fa-solid fa-bolt text-warning"></i>
									</h4>
									<div class="apply-btn">
										<a href="/board/apply/product" class="btn btn-success">응모페이지로
											이동 &gt;</a>
									</div>

								</div>
								<c:choose>
									<c:when test="${productAppContent != null }">
										<div class="apply-section text-center">
											<a href="/board/apply/product"><img
												style="max-width: 400px; max-height: 400px"
												src="/resources/images/product/${productAppContent.prod_uploadImg }"
												class="mb-3 rounded" alt=""><br> 상품명 :
												${productAppContent.prod_productName }</a>
											<p class="intro" ">마감 시간 :
												${productAppContent.prod_closeTime }</p>
										</div>
									</c:when>
									<c:otherwise>
										<div class="apply-section text-center">
											<img style="max-width: 400px; max-height: 400px"
												src="/resources/images/product/noproduct_default.png"
												class="mb-3 rounded " alt=""><br> <span
												class="text-white">현재 진행중인 응모 상품이 없어요..</span>

										</div>
									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div> --%>

					
				</div>
				<!-- ***** Apply/HotDeal End ***** -->

				<!-- ***** Gaming Library Start ***** -->
			<%-- 	<div class="gaming-library">
					<div class="col-lg-12">
						<div class="heading-section">
							<h4>
								<em>활동하는 멤버</em>
							</h4>
						</div>
						<div class="item">
							<ul>
								<li><img src="/resources/assets/images/game-01.jpg" alt=""
									class="templatemo-item"></li>
								<li><h4>${userList.name }mr.kim</h4> <span>name</span></li>
								<li><h4>${userList.rank }master</h4> <span>rank</span></li>
								<li><h4>${userList.ticket }99장</h4> <span>ticket</span></li>
								<li><h4>${userList.point }9999점</h4> <span>point</span></li>
								<li><div class="main-border-button">
										<a href="#">sellList</a>
									</div></li>
							</ul>
						</div>
						<div class="item">
							<ul>
								<li><img src="/resources/assets/images/avatar-01.jpg"
									alt="" class="templatemo-item"></li>
								<li><h4>${userList.name }polypoly</h4> <span>name</span></li>
								<li><h4>${userList.rank }master</h4> <span>rank</span></li>
								<li><h4>${userList.ticket }150장</h4> <span>ticket</span></li>
								<li><h4>${userList.point }350점</h4> <span>point</span></li>
								<li><div class="main-border-button">
										<a href="#">sellList</a>
									</div></li>
							</ul>
						</div>
						<div class="item">
							<ul>
								<li><img src="/resources/assets/images/game-02.jpg" alt=""
									class="templatemo-item"></li>
								<li><h4>${userList.name }hateLemon</h4> <span>name</span></li>
								<li><h4>${userList.rank }housekeeper</h4> <span>rank</span></li>
								<li><h4>${userList.ticket }25장</h4> <span>ticket</span></li>
								<li><h4>${userList.point }200점</h4> <span>point</span></li>
								<li><div class="main-border-button">
										<a href="#">sellList</a>
									</div></li>
							</ul>
						</div>
						<div class="item">
							<ul>
								<li><img src="/resources/assets/images/game-03.jpg" alt=""
									class="templatemo-item"></li>
								<li><h4>${userList.name }S급닉네임</h4> <span>name</span></li>
								<li><h4>${userList.rank }sleepman</h4> <span>rank</span></li>
								<li><h4>${userList.ticket }11장</h4> <span>ticket</span></li>
								<li><h4>${userList.point }1010점</h4> <span>point</span></li>
								<li><div class="main-border-button">
										<a href="#">sellList</a>
									</div></li>
							</ul>
						</div>
					</div>
				</div> --%>
				<!-- ***** Gaming Library End ***** -->

			</div>
		</div>
	</div>
	
	
	
	
<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button> -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel" class="" style="color:var(--bs-success)">현재 응모가 진행중<span class="text-white">입니다!</span></h1>
        <button type="button" class="btn-close text-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <div class="apply-section text-center">
											<a href="/board/apply/product"><img
												style="max-width: 300px; max-height: 300px"
												src="/resources/images/user_upload/${productAppContent.prod_uploadImg }"
												class="mb-3 rounded" alt=""><br> 상품명 :
												${productAppContent.prod_productName }</a>
											<p class="intro" style="color:var(--bs-warning);">마감 시간 :
												${productAppContent.prod_closeTime }</p>
										</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="button-4" id = "modal-today-close">하루동안 알리지 않기</button>
        <button type="button" class="button-4-border" id="modal-close" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>	
	
	
<!-- <div class="modal" id="" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">공지</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>블라블라</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" >today</button>
                <button type="button" class="btn btn-secondary"  onclick='close()' data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div> -->
	<jsp:include page="init/footer.jsp"></jsp:include>


	<!-- Scripts -->
	<script type="text/javascript">
		var inputForm = document.querySelector('#search');

		function press(f) {
			if (f.keyCode == 13) { //javascript에서는 13이 enter키를 의미함
				inputForm.submit(); //formname에 사용자가 지정한 form의 name입력
			}
		}

		if(${productAppContent != null } == true){
		window.onload=function(e){
			e.preventDefault();

			
			
			$("#modal-today-close").click(function() {
			    $("#myModal").modal("hide");
			    setCookie("mycookie", 'popupEnd', 1);
			});
			
			

			var checkCookie = getCookie("mycookie");

			if(checkCookie == 'popupEnd') {
			    $("#myModal").modal("hide");
			} else {
			    $('#myModal').modal("show");
			}
			
		}}

		function setCookie(name, value, expiredays){
		    var today = new Date();
		    today.setDate(today.getDate() + expiredays);
		    document.cookie = name + '=' + escape(value) + '; expires=' + today.toGMTString();
		}

		function getCookie(name) {
		    var cookie = document.cookie;
		    if (document.cookie != "") {
		        var cookie_array = cookie.split("; ");
		        for ( var index in cookie_array) {
		            var cookie_name = cookie_array[index].split("=");
		            if (cookie_name[0] == "mycookie") {
		                return cookie_name[1];
		            }
		        }
		    }
		    return;
		}
	</script>


	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="/resources/assets/js/isotope.min.js"></script>
	<script src="/resources/assets/js/owl-carousel.js"></script>
	<script src="/resources/assets/js/tabs.js"></script>
	<script src="/resources/assets/js/popup.js"></script>
	<script src="/resources/assets/js/custom.js"></script>


</body>

</html>
