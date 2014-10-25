<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${requestScope.allList}" var="reply">
	${reply.no} ${reply.contents} ${reply.days} ${reply.id}<br>
</c:forEach>