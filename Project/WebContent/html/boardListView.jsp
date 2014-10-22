<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="t_e">
	<tr>
		<th width="10%">번호</th>
		<th width="40%">제목</th>
		<th width="15%">날짜</th>
		<th width="20%">작성자</th>
		<th width="10%">조회수</th>
	</tr>
	<c:forEach items="${requestScope.allList}" var="board">		
	<tr class="c1" onclick="location.href='<%=request.getContextPath()%>/controller?action=boardDetailView&no=${board.no}'">
		<td>${board.no}</td>
		<td>${board.title}</td>
		<td>${board.days}</td>
		<td>${board.id}</td>
		<td>${board.count}</td>
	</tr>
	</c:forEach>
</table>