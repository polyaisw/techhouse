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
.td_in {
	text-align: center;
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
.black_f .black_t{
	align:center;
}
/* #modal {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
	display:none;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    
    background: rgba(255, 255, 255, 0.25);
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
    backdrop-filter: blur(1.5px);
    -webkit-backdrop-filter: blur(1.5px);
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.18);
}
#modal .modal-window {
    background: rgba( 69, 139, 197, 0.70 );
    box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
    backdrop-filter: blur( 13.5px );
    -webkit-backdrop-filter: blur( 13.5px );
    border-radius: 10px;
    border: 1px solid rgba( 255, 255, 255, 0.18 );
    width: 400px;
    height: 500px;
    position: relative;
    top: -100px;
    padding: 10px;
}
#modal .title {
    padding-left: 10px;
    display: inline;
    text-shadow: 1px 1px 2px gray;
    color: white;
    
}
#modal .title h2 {
    display: inline;
}
#modal .close-area {
    display: inline;
    float: right;
    padding-right: 10px;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

#modal .content {
    margin-top: 20px;
    padding: 0px 10px;
    text-shadow: 1px 1px 2px gray;
    color: white;
} */
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
						<table class="table table-dark table-hover rounded" id="user_admin">
							<thead class="">
								<tr>
									<th class="text_in">아이디</th>
									<th class="text_in">닉네임</th>
									<th class="text_in">게시글 수</th>
									<th class="text_in">판매 게시글 수</th>
									<th class="text_in">댓글 수</th>
									<th class="text_in">블랙 상황(0 정상, 1 블랙)</th>
									<th class="text_in text-center">권한</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${ userInfo }">
									<tr class="admin_board_content">
										<td class=""><a
											class="mypageModal user_id" >${ vo.id }</a></td>
										<td class="">${ vo.name }</td>
										<td class="td_in"><a href="/admin/board?userName=${vo.name}" id="board" onclick="window.open(this.href, '_blank', 'width=1500, height=800, toolbars=no, scrollbars=yes'); return false;"
											class="modal_boardList_admin" data-user-id="${vo.id}">${vo.boardCnt}</a></td>
										<td class="td_in"><a href="/admin/trade?userName=${vo.name}" id="trade" onclick="window.open(this.href, '_blank', 'width=1500, height=800, toolbars=no, scrollbars=yes'); return false;"
											class="modal_boardList_admin" data-user-id="${vo.id}">${vo.tradeCnt}</a></td>
										<td class="td_in"><a href="/member/mypage_comment?userName=${vo.name}" id="comment" onclick="window.open(this.href, '_blank', 'width=1500, height=800, toolbars=no, scrollbars=yes'); return false;"
											class="modal_reply_admin" data-user-id="${vo.id}">${vo.commentCnt}</a></td>
										<td class="td_in">
											<a class="modal_reply_admin" data-user-id="${vo.id}">${vo.blacklist}</a>
										</td>
										<c:if test="${ vo.blacklist == 1 }">
											<td class="td_in">
												<form id="black_f" method="post">
													<input type="text" name="id" value="${ vo.id }" style="display:none">
													<input type="button" class="black_f btn btn-light" value="해지">
												</form>
											</td>
										</c:if>
										<c:if test="${ vo.blacklist != 1 }">
											<td class="td_in">
												<form id="black_t" method="post">
													<input type="text" name="id" value="${ vo.id }" style="display:none">
													<input type="button" class="black_t btn btn-danger" value="블랙">
												</form>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
<%-- 					<div id="modal" class="modal">
						<div class="modal-window">
							<div class="title">
								<h2>모달</h2>
							</div>
							<div class="close-area">X</div>
							<div class="content">
								${vo.name}
							</div>
						</div>
					</div> --%>
				</div>
			</div>
		</div>
	</div>
	<script>
/* 		const modal = document.getElementById("modal")
		const board = document.getElementById("board")
		board.addEventListener("click", e => {
			modal.style.display = "flex"
		})
		const closeBtn = modal.querySelector(".close-area")
		closeBtn.addEventListener("click", e => {
		    modal.style.display = "none"
		})
		modal.addEventListener("click", e => {
		    const evTarget = e.target
		    if(evTarget.classList.contains("modal")) {
		        modal.style.display = "none"
		    }
		}) */
		/* 블랙 해지 버튼 클릭 메서드 */
		$(".black_f").click(function() {

			alert("해당 계정을 블랙 해지하였습니다.");
			$("#black_f").attr("action", "/admin/successId");
			$("#black_f").submit();

		});
		/* 블랙 버튼 클릭 메서드 */
		$(".black_t").click(function() {

			alert("해당 계정을 블랙하였습니다");
			$("#black_t").attr("action", "/admin/failId");
			$("#black_t").submit();

		});
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