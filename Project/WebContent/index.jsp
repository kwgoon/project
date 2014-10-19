<%@page import="model.dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Project</title>
</head>
<body>
하이
<%
DeptDAO dept = new DeptDAO();

dept.getDeptAll();
%>

<div class="header">
<li class="dropdown">
	<a href="about" class="active dropdown-toggle disabled" data-toggle="dropdown">About</a>
</li>
</div>
${param}
</body>
</html>
