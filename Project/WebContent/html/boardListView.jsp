<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
	<tr>
		<th>��ȣ</th>
		<th>����</th>
		<th>��¥</th>
		<th>�ۼ���</th>
		<th>��ȸ��</th>
	</tr>
	<c:forEach items="${requestScope.allList}" var="board">		
	<tr>
		<td>${board.no}</td>
		<td>${board.title}</td>
		<td>${board.days}</td>
		<td>${board.id}</td>
		<td>${board.count}</td>
	</tr>
	</c:forEach>
</table>