<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<form name="login" action="controller?action=login" method="post">
		<table >
			<tr>
				<td align="center"><img src="img/login1.png" /></td>
			</tr>
			<tr>
				<td><input type="text" name="id" placeholder="아이디"  style="height: 42px; width: 322px"/></td>
			</tr>
			<tr>

				<td><input type="password" name="pw" placeholder="비밀번호" style="height: 42px; width: 322px"/></td>
			</tr>
			<tr>

				<td style="height: 42px; width: 322px"><input type="checkbox" name="logink" style=""/><font size="2">로그인 유지</font></td>
			</tr>
			<tr>
				<td><input type="image" src="img/login2.png"/></td>
			</tr>
		</table>
		<br>
		<hr style="width: 21%">
		<div align="center">
		<a href="#" onclick="readying()"><font size="2" color="">ID/PW 찾기</font></a>&nbsp;|&nbsp;<a href="#" onclick="readying()"><font size="2">회원가입</font></a>
		</div>
	</form>
	</div>
</body>
</html>