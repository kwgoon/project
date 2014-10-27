<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <style>html { font-size: 12px; font-family: Arial, Helvetica, sans-serif; }</style>
    <title></title>
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2014.1.416/styles/kendo.common.min.css">
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2014.1.416/styles/kendo.default.min.css">
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2014.1.416/styles/kendo.dataviz.min.css">
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2014.1.416/styles/kendo.dataviz.default.min.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://cdn.kendostatic.com/2014.2.1008/js/angular.min.js"></script>
    <script src="http://cdn.kendostatic.com/2014.1.416/js/kendo.all.min.js"></script>
<link rel="stylesheet" href="http://cdn.kendostatic.com/2014.1.416/styles/kendo.rtl.min.css">
<link rel="stylesheet" href="http://cdn.kendostatic.com/2014.1.416/styles/kendo.mobile.all.min.css">
</head>
<body>
    
<table id="grid">
    <colgroup>
		<col style="width:10%"/>
		<col style="width:40%"/>
		<col style="width:15%" />
		<col style="width:20%" />
		<col style="width:10%" />
	</colgroup>
	<thead>
	    <tr>
	        <th data-field="no">번호</th>
	        <th data-field="title">제목</th>
	        <th data-field="days">날짜</th>
	        <th data-field="id">작성자</th>
	        <th data-field="count">조회수</th>
	    </tr>
	</thead>
	<tbody>
	<c:forEach items="${requestScope.allList}" var="board">		
		<tr class="c1" id="boardDetailView&no=${board.no}">
			<td>${board.no}</td>
			<td>${board.title}</td>
			<td>${board.days}</td>
			<td>${board.id}</td>
			<td>${board.count}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<script>
$(document).ready(function() {
    $("#grid").kendoGrid({
        height: 550,
        sortable: true
    });
});
</script>
</body>
</html>