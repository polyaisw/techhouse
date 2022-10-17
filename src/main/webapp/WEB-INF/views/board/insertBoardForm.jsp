<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/default.css" rel="stylesheet">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=UTF-8");
	%>
	<jsp:include page="../init/header.jsp"></jsp:include>
	<jsp:include page="../init/nav.jsp"></jsp:include>
	<h2>글쓰기</h2>
	<div class="container text-white">
		<div class="row">
			<div class="col ">
				<form action="insertBoardAction" method="post">
					<table class="boarder w-100">
						<tr>
							<td>이름</td>
							<td>닉네임_1 <input type="text" name="b_writer" value="닉네임_1"
								size="30" class="d-none"></td>
						</tr>
						<tr>
							<td>카테고리(옵션바로)</td>
							<td><select class="form-select"
								aria-label="Default select example" name="b_category">
									<option selected value="자유게시판">[커뮤니티] 자유게시판</option>
									<option value="인증게시판">[커뮤니티] 인증게시판</option>
									<option value="취미공유">[커뮤니티] 취미공유</option>
									<option value="거래게시판">[거래] 거래게시판</option>
									<option value="벤치마킹인증">[거래] 벤치마킹 인증</option>
									<option value="거래후기">[거래] 거래 후기</option>
									<option value="IT/트렌드">[뉴스] IT/트렌드</option>
									<option value="핫이슈">[뉴스] 핫이슈</option>
									<option value="게임출시정보">[뉴스] 게임 출시 정보</option>
									<option value="꿀딜/장터">[뉴스] 꿀딜 장터</option>
							</select></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="b_title" value="" size="30"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="b_text" rows="5" cols="35"></textarea></td>
						</tr>

						<tr>
							<td>업로드(임시)</td>
							<td><div class="mb-3">
									<label for="formFileSm" class="form-label"></label> <input
										class="form-control form-control-sm" id="formFileSm"
										type="file" name="b_uploadImg">
								</div></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="글쓰기"> <a
								href="javascript:window.history.back();"><input
									type="button" value="취소"></a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../init/footer.jsp"></jsp:include>

	<script src="https://kit.fontawesome.com/5547fa07a6.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>