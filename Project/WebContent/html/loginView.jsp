<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<script>
$(document).ready(function(){
	$("#login").click(function(){
	    $.ajax({
	    	type: "POST",
			url: "controller?action=login",
			data:$("form").serialize(),
			success:function(result){
				location.href="";
	  			msg("�α��� ����");
	  		},
			error:function(xhr){
			}
		});
	});
});
</script>
<div align="center">
	<form name="login" action="controller?action=login" method="post">
		<table >
			<tr>
				<td align="center"><img src="img/login1.png" /></td>
			</tr>
			<tr>
				<td><input type="text" name="id" placeholder="���̵�"  style="height: 42px; width: 322px"/></td>
			</tr>
			<tr>

				<td><input type="password" name="pw" placeholder="��й�ȣ" style="height: 42px; width: 322px"/></td>
			</tr>
			<tr>

				<td style="height: 42px; width: 322px"><input type="checkbox" name="logink" style=""/><font size="2">�α��� ����</font></td>
			</tr>
			<tr>
				<td><input type="image" src="img/login2.png" id="login"/></td>
			</tr>
		</table>
		<br>
		<hr style="width: 21%">
		<div align="center">
		<a href="#" onclick="readying()"><font size="2" color="">ID/PW ã��</font></a>&nbsp;|&nbsp;<a href="#" onclick="readying()"><font size="2">ȸ������</font></a>
		</div>
	</form>
	</div>
</body>
</html>