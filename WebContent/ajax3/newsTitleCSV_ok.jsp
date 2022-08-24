<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%!
	String[] newsTitle = { 
	"8월 1~20일 수출 3.9% 증가…무역적자 102억달러(상보)", 
	"전문가들 '파월, 잭슨홀에서 경기침체에도 인플레 낮추겠다 할 것'",
	"[뉴욕마켓워치] 연준 당국자들 '큰 폭 금리인상 지속'…주식·채권↓달러↑", 
	"[연금 릴레이①] 최종진 미래에셋證 '이제는 연금WM 시대…디지털화 집중'",
	"LG CNS, 최대 매출에 외상값 받고도 현금흐름 '악화'", 
	"'리치먼드 연은 총재' 인플레 억제 위해 필요한 조치 " };

	/*
		6|8월 1~20일 수출 3.9% 증가…무역적자 102억달러(상보) [2022.08.22 오전 11:15:21]*
		전문가들 '파월, 잭슨홀에서 경기침체에도 인플레 낮추겠다 할 것' [2022.08.22 오전 11:15:21]*
	
	*/
%>

<%
	out.print(newsTitle.length + "|");
	for (int i = 0; i < newsTitle.length; i++) {
		out.print(newsTitle[i] + " [" + new Date() + "]");

		if (i != (newsTitle.length - 1)) {
			out.print("*");
		}
	}
%>
