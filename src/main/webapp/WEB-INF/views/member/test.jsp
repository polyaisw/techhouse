<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
<meta charset="UTF-8" />
</head>
<body>

	<form id="user_del" method="post">
		<input class="id_input" name="id">
		<input class="pw_input" name="password" type="text">
		<input type="button" class="my_del_button" value="회원탈퇴">
	</form>
	<script>
	$(".my_del_button").click(function(){
		$("#user_del").attr("action", "/member/memberDel.do");
		$("#user_del").submit();
	});
	</script>
</body>
</html>