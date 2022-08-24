<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//xml로 데이터 보내는 방법
	//1. 맨 위에 있는 contentType를 html에서 xml로 고쳐준다.
	//2. 돌려보낼 데이터를 xml방식으로 만들어서 보내준다.
	
	//데이터를 받아 처리작업을 한 후 결과값 생성
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String oper = request.getParameter("oper");

	int sum = 0;
	if(oper.equals("hap")) {
		sum = su1 + su2;
	} else if (oper.equals("sub")) {
		sum = su1 - su2;
	} else if (oper.equals("mul")) {
		sum = su1 * su2;
	} else if (oper.equals("div")) {
		sum = su1 / su2;
	} 
	
	//생성된 결과값을 사용자에게 돌려줄것임.
	//xml방식으로 만들어 데이터를 보내준다.
	StringBuffer sb = new StringBuffer();
	sb.append("<?xml version='1.0' encoding='utf-8'?>\n");
	sb.append("<root>" + sum + "</root>");
	
	//html이 아닌 xml로 작성. test1에 xml로 보내줄 것이기 때문.
	response.setContentType("text/xml;charset=utf-8");
	//StringBuffer sb에 담은 데이터를 toString화 해서 보낼 것임.
	response.getWriter().write(sb.toString());
	
	//데이터를 보내준 곳에 값을 다시 돌려줄 것이다.
	//돌아간다면 서버가 나에게 값을 줄 때 readyState가 4이면서 status가 200이 됬기 때문에 값이 실행된다.
%>
