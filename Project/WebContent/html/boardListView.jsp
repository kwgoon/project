<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>날짜</th>
		<th>작성자</th>
		<th>조회수</th>
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