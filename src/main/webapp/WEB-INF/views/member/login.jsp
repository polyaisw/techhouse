<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
<style>
	/* 로그인 실패시 경고글 */
	.login_warn{
	    margin-top: 30px;
	    text-align: center;
	    color : red;
	}
</style>
<meta charset="UTF-8" />
</head>
<body>
	<form id="login_form" method="post">
		아이디 :<input class="id_input" name="id">
		비밀번호 :<input class="pw_iput" name="password" type="password">
		
		<c:if test = "${result == 0 }">
                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
        </c:if>
		
		<input type="button" class="login_button" value="로그인">
	</form>
	
<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        
        //alert("로그인 버튼 작동");
    	/* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/member/login");
        $("#login_form").submit();
        
    });
 
</script>
</body>
</html>