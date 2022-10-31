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
				<div class="page-content" style="margin-top:110px;">

					<!-- ***** Banner Start ***** -->
					<div class="main-banner">
						<div class="row">
							<div class="col-lg-6">
								<div class="header-text">
									<h6>테크하우스에 오신것을 환영합니다.</h6>
									<h4>
										<em>&quot;신작 발표&quot;</em><br> 최신 게임 정보를 확인해보세요
									</h4>
									<div class="main-button">
										<a href="/board/news/gameInfo">소식 보러가기 &gt;</a>
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
									<h4>
										<span class="text-white">뉴스 </span>
									</h4>
								</div>

								<!-- ***** NewsBoard Start ***** -->
								<div class="row">
									<div class="col-lg-6">
										<div class="middle-section ">
											<h5 class="d-flex justify-content-between">
												<span>인기 핫이슈</span> <a href="/board/news/issue"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="issueList" items="${issueList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${issueList.b_seq }"
													class="h5 d-inline-block text-truncate"
													style="max-width: 580px;"> ${issueList.b_title }</a> <span
													class="badge badge-pill">${issueList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
									</div>

									<div class="col-lg-6">
										<div class="middle-section ">
											<h5 class="d-flex justify-content-between">
												<span>현재 트렌드</span> <a href="/board/news/trend"><i
													class="fa-solid fa-caret-right"></i></a>
											</h5>
										</div>
										<hr class="hr text-white">
										<ul class="">
											<c:forEach var="trendList" items="${trendList }">
												<li
													class="list-group-item d-flex justify-content-between align-items-center mb-0">
													<a href="/board/contentForm?b_seq=${trendList.b_seq }"
													class="h5 d-inline-block text-truncate"
													style="max-width: 580px;"> ${trendList.b_title }</a> <span
													class="badge badge-pill">${trendList.b_recommed }</span>
												</li>
											</c:forEach>
										</ul>
									</div>

									<!-- ***** NewsBoard END ***** -->
								</div>
							</div>
						</div>


					</div>
					<!-- ***** Trade Start ***** -->
					<div class="most-popular">
						<div class="row">
						
							<div class="col-lg-12">
								<div class="heading-section d-flex justify-content-between">
									<h4>
										<span class="text-white">중고 상품 </span> <i
											class="fa-brands fa-hotjar text-warning"></i>
									</h4>
									<div class="search-input">
										<form id="search" action="/searchAction" method="get"
											name="input-form">
											<input type="text" placeholder="거래글 검색" id='searchText'
												name="searchKeyword" /> <i class="fa fa-search"></i>
										</form>
									</div>

								</div>
								<div class="row">
									<c:forEach var="tradeList" items="${tradeList }">
										<div class="col-lg-3 col-sm-6">
											<div class="item pt-1">
												<span class="badge rounded-pill text-bg-info d-inline mt-3" >${tradeList.t_state }</span>
												<a href="/board/contentTradeForm?t_seq=${tradeList.t_seq }">
													<img
													src="/resources/images/trade/${tradeList.t_uploadImg }"
													alt="">
												</a>

												<h4 class="inline">
													<a href="/board/contentTradeForm?t_seq=${tradeList.t_seq }">
														${tradeList.t_title}<br> <span>${tradeList.t_price }원</span>
													</a>
												</h4>
												<ul>
													<li><i class="fa fa-star"></i> 4.8</li>
													<li><i class="fa fa-download"></i> 2.3M</li>
												</ul>
											</div>
										</div>
									</c:forEach>
									<div class="col-lg-12">
										<div class="main-button">
											<a href="/board/trade/tradeBoard.html">중고 거래 보러가기 &gt;</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Trade End ***** -->
					<!-- ***** Apply/HotDeal Start ***** -->
					<div class="row ">
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
											<p class="intro">마감 시간 :
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
						<div class="col-lg-6">
							<div class="most-popular">
								<div class="heading-section d-flex justify-content-between">
									<h4>
										<span class="text-white">핫딜 </span>
									</h4>
									<div class="hotDeal-btn">
										<a href="/board/news/hotDeal" class="btn btn-success">핫딜페이지로
											이동 &gt;</a>
									</div>
								</div>
								<div class="slide-section">
									<div id="carouselExampleIndicators" class="carousel slide"
										data-bs-ride="true">
										<div class="carousel-indicators">
											<button type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide-to="0" class="active" aria-current="true"
												aria-label="Slide 1"></button>
											<button type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide-to="1" aria-label="Slide 2"></button>
											<button type="button"
												data-bs-target="#carouselExampleIndicators"
												data-bs-slide-to="2" aria-label="Slide 3"></button>
										</div>
										<div class="carousel-inner">
											
										
											<c:forEach var="hotDealList" items="${hotDealList}" varStatus="status">
												<c:if test="${status.index == 0 }">
												<div class="carousel-item active">
													<a href="/board/contentForm?b_seq=${hotDealList.b_seq }">
														<img src="/resources/images/board/${hotDealList.b_uploadImg }"
														style="max-width: 400px; max-height: 400px"
														class="d-block w-100 rounded mx-auto" alt="...">
													</a>
												</div>
												</c:if>
												<c:if test="${status.index > 0 }">
												<div class="carousel-item ">
													<a href="/board/contentForm?b_seq=${hotDealList.b_seq }">
														<img src="/resources/images/board/${hotDealList.b_uploadImg }"
														style="max-width: 400px; max-height: 400px"
														class="d-block w-100 rounded mx-auto" alt="...">
													</a>
												</div>
												</c:if>
												
											</c:forEach>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>

								</div>
							</div>
						</div>
					</div>

					<div class="carousel-inner">
					              <div class="most-popular header-text">
                <div class="heading-section mb-3">
                  <h4 class="mb-1"><em>인증 게시판</em></h4>
                  <span class="text-white ">직접 촬영한 사진을 올려보세요</span>
                </div>
                <div class="owl-features owl-carousel">
                
                
                  <div class="item">
                    <div class="thumb">
                      <img src="/resources/assets/images/${mySettingList.b_uploadImg }featured-01.jpg" alt="" style="max-width:300px; max-height:300px;">
                      <div class="hover-effect">
                        <h5>${mySettingList.b_title }b_title</h5>
                      </div>
                    </div>
                    <h4>${mySettingList.b_writer }b_writer<br><span>${mySettingList.b_date }b_date</span></h4>
                    <ul>
                      <li><i class="fa-regular fa-thumbs-up"></i> ${mySettingList.b_recommed }55</li>
                      <li><i class="fa-solid fa-eye text-white"></i> ${mySettingList.b_views }219</li>
                    </ul>
                  </div>
                  <div class="item">
                    <div class="thumb">
                      <img src="/resources/assets/images/${mySettingList.b_uploadImg }featured-02.jpg" alt="" style="max-width:300px; max-height:300px;">
                      <div class="hover-effect">
                        <h5>${mySettingList.b_title }b_title</h5>
                      </div>
                    </div>
                    <h4>${mySettingList.b_writer }b_writer<br><span>${mySettingList.b_date }b_date</span></h4>
                    <ul>
                      <li><i class="fa-regular fa-thumbs-up"></i> ${mySettingList.b_recommed }55</li>
                      <li><i class="fa-solid fa-eye text-white"></i> ${mySettingList.b_views }219</li>
                    </ul>
                  </div>                  
                  <div class="item">
                    <div class="thumb">
                      <img src="/resources/assets/images/${mySettingList.b_uploadImg }featured-03.jpg" alt="" style="max-width:300px; max-height:300px;">
                      <div class="hover-effect">
                        <h5>${mySettingList.b_title }b_title</h5>
                      </div>
                    </div>
                    <h4>${mySettingList.b_writer }b_writer<br><span>${mySettingList.b_date }b_date</span></h4>
                    <ul>
                      <li><i class="fa-regular fa-thumbs-up"></i> ${mySettingList.b_recommed }55</li>
                      <li><i class="fa-solid fa-eye text-white"></i> ${mySettingList.b_views }219</li>
                    </ul>
                  </div>                  

                </div>
              </div>
					
					</div>
				</div>
					<!-- ***** Apply/HotDeal End ***** -->

				<!-- ***** Gaming Library Start ***** -->
				<div class="gaming-library">
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
								<li><h4>${userList.name } mr.kim</h4> <span>name</span></li>
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
								<li><img src="/resources/assets/images/avatar-01.jpg" alt=""
									class="templatemo-item"></li>
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
					<div class="col-lg-12">
						<div class="main-button">
							<a href="/member/mypage">내 정보 보러가기 &gt;</a>
						</div>
					</div>
				</div>
				<!-- ***** Gaming Library End ***** -->

			</div>
		</div>
	</div>

<jsp:include page="init/footer.jsp"></jsp:include>


	<!-- Scripts -->
	<script type="text/javascript">
		var inputForm = document.querySelector('#search');

		function press(f) {
			if (f.keyCode == 13) { //javascript에서는 13이 enter키를 의미함
				inputForm.submit(); //formname에 사용자가 지정한 form의 name입력
			}
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
