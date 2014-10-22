<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<table class="t_e">
	<tr>
		<td>${requestScope.board.title}</td>
	<tr>
		<td align="right">${requestScope.board.days} ${requestScope.board.id} Á¶È¸¼ö:${requestScope.board.count}</td>
	</tr>
	<tr>
		<td>${requestScope.board.contents}</td>
	</tr>
</table>