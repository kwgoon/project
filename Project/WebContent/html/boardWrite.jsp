<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#boardW").click(function(){
		console.log($("form").serialize());
		$.ajax({
	    	type: "POST",
    		url: "controller?action=boardWrite",
    		data: $("form").serialize(),
    		success:function(result){
      			$("#main").html(result);
    		},
    		error:function(xhr){
    			alert("error 발생시 호출되는 블록");
			}
 		});
	});
});
</script>
</head>
<body>
<center>
<form>
<table>
	<tr>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr height="2" bgcolor="#82B5DF">
					<td colspan="4"></td>
				</tr>
				<tr style="text-align: center;">
					<td>&nbsp;</td>
					<th align="center">글쓰기</th>
					<td>&nbsp;</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>&nbsp;</td>
					<td align="center">제목</td>
					<td><input name="title" size="50" maxlength="100"></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="center">종류</td>
					<td>
						<select name="type">
							<option value='1'>공지사항</option>
							<option value='2'>게시글</option>
						</select>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#dddddd">
					<td colspan="4"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="center">내용</td>
					<td><textarea name="contents" cols="50" rows="13"></textarea></td>
					<td>&nbsp;</td>
				</tr>
				<tr height="1" bgcolor="#82B5DF">
					<td colspan="4"></td>
				</tr>
				<tr align="center">
					<td>&nbsp;</td>
					<td colspan="2">
						<input type="button" value="등록" id="boardW"> 
						<input type="reset" value="다시작성">
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>