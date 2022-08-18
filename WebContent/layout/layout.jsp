<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=cp%>/data/css/style.css" type="text/css">

</head>
<body>

<div align="center">
<table width="700" align="center">

<tr height="50">
	<td><tiles:insertAttribute name="header" /></td>
</tr>	

<tr height="350" valign="top">
	<td><tiles:insertAttribute name="body" /></td>
</tr>	

<tr height="50">
	<td><tiles:insertAttribute name="footer" /></td>
</tr>	

</table>

</div>


</body>
</html>