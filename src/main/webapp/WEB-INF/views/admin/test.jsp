<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>TECH HOUSE - 관리자 페이지</title>
<style>
.text_in {
	color: lightgreen;
	font-weight: bold;
}

.board-title {
	margin-top: 15px;
	text-align: center;
	font-size: 30px;
	letter-spacing: 2px;
	font-weight: bold;
	color: #FF8000;
}

.board-search {
	margin-top: 15px;
	text-align: right;
	letter-spacing: 2px;
}

input:focus {
	outline: none;
	box-shadow: 0 0 0;
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<meta charset="UTF-8" />
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

</head>
<jsp:include page="../init/header.jsp"></jsp:include>
<body>

	<div class="container text-white">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<div class="col-lg-12 board-title">유저 조회</div>
					<div class="member_List">
						<table class="admin_" id="user_admin">
							<thead class="admin_boardList">
								<th class="admin_board_head">아이디</th>
								<th class="admin_board_head">닉네임</th>
								<th class="admin_board_head">게시글 수</th>
								<th class="admin_board_head">판매 게시글 수</th>
								<th class="admin_board_head">댓글 수</th>
								<th class="admin_board_head">블랙 상황</th>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ userInfo }">
									<tr class="admin_board_content">
										<td class="admin_board_content_nm"><a
											class="mypageModal user_id" value="${ vo.id }"></a></td>
										<td class="admin_board_content_nm">${ vo.name }</td>
										<td class="admin_board_content_nm"><a href="#"
											class="modal_boardList_admin" data-user-id="${vo.id}">${vo.boardCnt}</a></td>
										<td class="admin_board_content_nm"><a href="#"
											class="modal_boardList_admin" data-user-id="${vo.id}">${vo.tradeCnt}</a></td>
										<td class="admin_board_content_nm"><a href="#"
											class="modal_reply_admin" data-user-id="${vo.id}">${vo.commentCnt}</a></td>
										<c:choose>
											<c:when test="${ vo.black == 0 }">
												<td class="admin_board_content_nm">
													<button data-user-id="${ vo.id }" type="button" value="블랙"
														class="reject">블랙</button>
												</td>
											</c:when>
											<c:when test="${ vo.black >= 0 }">
												<td class="admin_board_content_nm">
													<button data-user-id="${ vo.id }" type="button"
														value="블랙 해지" class="accept">블랙 해지</button>
												</td>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="modal_approve">
						<div class="po">
							<div class="check_listWrap">
								<div class="modal_appr">
									블랙이 해지되었습니다.
									<div class="close_modal_btn approve-btn">
										<button class="modalAppro_end_btn">확인</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal_deni">
						<div class="po">
							<div class="check_listWrap">
								<div class="modal_de">
									블랙 되었습니다.
									<div class="close_modal_btn">
										<button class="modal_deni_btn">확인</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 게시글 모달로 가져오기-->
					<div class="modal_list">
						<div class="modal_boradlist">
							<div class="reply_listWrap">

								<div class="modal_wrap">
									<h3 id="ListName"></h3>
									<p class="modallist">작성한 게시글 수 : 총 01개</p>
									<table class="admin_boardM_wrap" id="comment-admin">
										<thead class="admin_boardMList">
											<th class="admin_boardM_title">글 번호</th>
											<th class="admin_boardM_title">글 제목</th>
											<th class="admin_boardM_title boardleng">작성일</th>
											<th class="admin_boardM_title">조회수</th>
											<th class="admin_boardM_title">좋아요</th>
										</thead>
										</tbody>
										<tbody id="getBoardList">
											<!-- 게시글이 들어갈 공간 -->
										</tbody>
									</table>


									<div class="close_modal_btn">
										<button class="modal_list_end_btn">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal_reply">
						<div class="modal_replylist">
							<div class="reply_listWrap">
								<div class="modal_wrap">
									<div>
										<h3 id="comment_name"></h3>
									</div>

									<table class="admin_reply_wrap">
										<tbody class="admin_replyList">
											<th class="admin_reply_title">글번호</th>
											<th class="admin_reply_title replyleng">작성한 댓글</th>
											<th class="admin_reply_title">작성한 일자</th>
										</tbody>
										<tbody id="commentList_box">


										</tbody>
									</table>
									<!-- 모달 페이징 -->
									<div>

										<s_paging>
										<div id="pagingM">
											<br> <a href="#" class="prev" title="이전페이지">◀ PREV </a>
											<s_paging_rep>
											<a href="#" class="num">1</a></s_paging_rep>
											<s_paging_rep>
											<a href="#" class="num">2</a></s_paging_rep>
											<s_paging_rep>
											<a href="#" class="num">3</a></s_paging_rep>
											<a href="#" class="prev" title="다음페이지">NEXT ▶</a> <br />&nbsp;
										</div>
										</s_paging>
										<div class="close_modal_btn">
											<button class="modal_reply_end_btn">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 회원관리 모달 -->
					<div class="mypage_modal">
						<div class="service_box">
							<div class="mem_box_inner">
								<div class="mypage">

									<!-- <div class="service_title_outline"><span class="service_title">회원관리</span></div> -->
									<div class="mypage_form">
										<h3 class="memInfo"></h3>
										<div class="line"></div>
										<div class="insert">
											<!--이름-->
											<div class="name_box">
												&nbsp;&nbsp;
												<p>이름</p>
												<input type="text" name="name" readonly value="홍길동"><br>
											</div>
											<!--아이디-->
											<div class="id_box">
												&nbsp;&nbsp;
												<p>아이디</p>
												<input type="text" name="id" readonly value="abc1234"><br>
											</div>
											<!--전화번호-->
											<div class="tel_box">
												&nbsp;
												<p>전화번호</p>
												<input type="tel" name="tel" readonly><br>
											</div>
											<!--주소-->
											<div class="addr_box">
												&nbsp;
												<p>주소</p>
												<input type="text" name="post" readonly> <input
													type="text" class="addr addr1" name="addr1" readonly><br>
												<input type="text" class="addr addr2" name="addr2" readonly>
											</div>

										</div>
										<div class="close_btn">
											<button class="close">닫기</button>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		let str = '';
		// 모달 스크립트 
		$(function() {
			$("#user_admin").DataTable();
			// 게시판 모달
			$('.modal_boardList_admin').click(function() {
				var board_name = $(this).data("name");
				console.log(board_name);
				getList(true, board_name);
				$('.modal_list').fadeIn(500);
			}); // open modal end

			function getList(reset, board_id) {

				if (reset) {
					str = '';
				}

				$.ajax({
					type : 'post',
					url : '<c:url value ="/admin/getUserBoardList"/>',
					data : {
						name : board_name,
					},
					dataType : "json",
					success : function(data) {
						for ( var i = 1 in data) {
							console.log(data[i].b_title);
							str += "<tr class='admin_boardM_content'>"
							str += "<td class='admin_boardM_nm'><a href='#'>"
									+ data[i].b_seq + "</a></td>"
							str += "<td class='admin_boardM_nm'><a href='#'>"
									+ data[i].board_title + "</a></td>"
							str += "<td class='admin_boardM_nm'><a href='#'>"
									+ timeStamp(data[i].b_date)
									+ "</a></td>"
							str += "<td class='admin_boardM_nm'>"
									+ data[i].b_views + "</td>"
							str += "<td class='admin_boardM_nm'>"
									+ data[i].b_recommed + "</td>"
							str += "</tr>"
						}
						$('#ListName').html(board_name + '님의 작성 게시물')
						$('#getBoardList').html(str);
						$("#comment-admin").DataTable();
					},
					error : function(status, error) {
						console.log('에러발생!!');
						console.log(status, error);
					}
				});//ajax 종료
			}

			$('.modal_list_end_btn').click(function() {
				console.log('모달 닫기 이벤트 발생!');
				$('.modal_list').fadeOut();
			});

			// 댓글 모달
			$('.modal_reply_admin').click(function() {
				$('.modal_reply').fadeIn(500);
				var comment_name = $(this).data("name");
				console.log(comment_name);
				getList2(true, comment_name);
			});

			function getList2(reset, comment_name) {
				if (reset) {
					str = '';
				}

				$.ajax({
					type : 'post',
					url : '<c:url value ="/admin/getCommentList"/>',
					data : {
						name : comment_name,
					},
					dataType : "json",
					success : function(data) {
						console.log('잘됨!')
						for ( var i = 1 in data) {
							console.log(data[i].com_no);
							str += "<tr class='admin_reply_content'>"
							str += "  <td class='admin_reply_con'><a href='#'>"
									+ data[i].c_seq + "</a></td>"
							str += " <td class='admin_reply_con'><a href='#'>"
									+ data[i].c_text + "</a></td>"
							str += " <td class='admin_reply_con'>"
									+ timeStamp(data[i].c_date) + "</td>"
							str += " </tr>"
						}
						$('#commentList_box').html(str);
						$('#comment_name').html(comment_name + '님의 작성 댓글 ')

					},
					error : function(status, error) {
						console.log('에러발생!!');

						console.log(status, error);
					}

				});//ajax 종료
			}

			$('.modal_reply_end_btn').click(function() {
				$('.modal_reply').fadeOut();
			});
			// 마이페이지 모달
			$('.mypageModal').click(function() {
				$('.mypage_modal').fadeIn(500);
				var Id = $(this).attr('value');
				console.log(Id);
				// 아이디 값 불러옴 

				$.ajax({
					type : 'post',
					url : '<c:url value="/admin/getuserInfo" />',
					data : {
						id : Id,
					},
					dataType : "json",
					success : function(data) {
						console.log(data.name);
						console.log(data.id);
						$("input[name='name']").val(data.name);
						$("input[name='id']").val(data.id);
						$("input[name='tel']").val(data.tel);
						$("input[name='addr1']").val(data.addr);
						$("input[name='addr2']").val(data.addr2);
						$("input[name='post']").val(data.post);
						$(".memInfo").html(data.name + "님의 회원 정보");
					},
					error : function(status, error) {
						console.log('에러발생!!');
						console.log(status, error);
					}

				})//ajax 종료
			});
			$('.close').click(function() {
				$('.mypage_modal').fadeOut();
			});
			// 회원가입 승인
			$('.accept').click(function() {
				const successId = $(this).data("id");
				console.log(successId);
				// 0 가입대기 , 1.가입승인, 2. 가입거절

				$.ajax({
					type : 'post',
					url : '<c:url value="/admin/successId" />',
					data : {
						id : successId,
					},
					success : function(data) {
					},
					error : function(status, error) {
						console.log('에러발생!!');
						console.log(status, error);
					}

				}); // 아작스 종료
				$('.modal_approve').fadeIn(500);
			});
			$('.modalAppro_end_btn').click(function() {
				$('.modal_approve').fadeOut();
			});

			// 회원가입 거부
			$('.reject').click(function() {
				const failId = $(this).data("id");
				console.log(failId);

				$.ajax({
					type : 'post',
					url : '<c:url value="/admin/failId" />',
					data : {
						id : failId,
					},
					success : function(data) {
					},
					error : function(status, error) {
						console.log('에러발생!!');
						console.log(status, error);
					}
				});//아작스 끝
				$('.modal_deni').fadeIn(500);
			});
			$('.modal_deni_btn').click(function() {
				$('.modal_deni').fadeOut();
			});
		});
		//검색
		$('.search_onclick_submit').click(function() {
			/* alert('검색되니?')
			location.href = "" + "검색어 이름" + "" + "검색어 아이디";*/
			if ($('.search-input').val() === '') {
				alert('서비스 준비 중입니다..');
				return;
			}
		});
		// 엔터키누를시 검색버튼 눌리기
		$('.search-input').keypress(function(e) {
			if (e.keyCode == 13) {
				//실행할 function작성
				alert("엔터 잘 실행되니?");
			}
		});
		// 가입승인 버튼 클릭시 회원가입승인
		$('.accept').click(function() {
			const successId = $(this).data("id");
			console.log(successId);
			// 0 가입대기 , 1.가입승인, 2. 가입거절

			$.ajax({
				type : 'post',
				url : '<c:url value="/admin/successId" />',
				data : {
					id : successId,
				},
				success : function(data) {
				},
				error : function(status, error) {
					console.log('에러발생!!');
					console.log(status, error);
				}

			}); // 아작스 종료
			$('.modal_approve').fadeIn(500);
		});
		// 가입거부 버튼 클릭시 요청 삭제
		$('.reject').click(function() {
			console.log('회원가입거부!');
			// 가입승인 거부됨 메일전송 서비스 만들면 좋을듯
		});

		function timeStamp(millis) {

			const date = new Date(); //현재 날짜
			//현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
			const gap = date.getTime() - millis;

			let time; //리턴할 시간
			if (gap < 60 * 60 * 24 * 1000) { //1일 미만인 경우
				if (gap < 60 * 60 * 1000) { //1시간 미만일 경우
					time = '방금 전';
				} else { //1시간 이상일 경우
					time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
				}
			} else { //1일 이상일 경우
				const today = new Date(millis);
				const year = today.getFullYear(); //년
				const month = today.getMonth() + 1; //월
				const day = today.getDate(); //일
				const hour = today.getHours(); //시
				const minute = today.getMinutes(); //분

				time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시 '
						+ minute + '분';

			}
			return time;
		}
	</script>

	<jsp:include page="../init/footer.jsp"></jsp:include>
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