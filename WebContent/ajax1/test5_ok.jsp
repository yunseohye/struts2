<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	//json(key:value값)
	/* json 구조 예시
	[
	 {"id":"1","userId":"suzi","userPwd":"a123"},	 
	 {"id":"2","userId":"inna","userPwd":"b123"},	 
	 {"id":"3","userId":"insun","userPwd":"c123"},	 
	 ]
	*/
	
	String result = "";
	
	for(int i=1;i<=3;i++) {
		result += "{\"id\":\"" + i;
		result += "\",\"userId\":\"" + userId;
		result += "\",\"userPwd\":\"" + userPwd + "\"},";
	}
	
	//마지막 문장의 ,를 빼는 코드
	result = result.substring(0, result.length()-1);
	//json구조 겉의 []괄호를 붙인것
	result = "[" + result + "]";
	
	out.print(result);
	
%>
