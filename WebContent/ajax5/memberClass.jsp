<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="<%=cp%>/data/js/log.js"></script>
<script type="text/javascript" src="<%=cp%>/data/js/member.js"></script>

<script type="text/javascript">

	function memberClass() {
		
		//1.member.js없이 실행
		//예전에 많이 사용함. object1이라는 객체를 생성
		var object1 = {};
		
		object1.id = "suzi";
		object1.name = "배수지";
		
		log("log1: "+ object1.id + "," + object1.name);
		
		//2.member.js없이 실행
		var object2 = new Object();
		object2.id = "inna";
		object2.name = "유인나";
			
		log("log2: "+ object2.id + "," + object2.name);	
		
		//3.Member 클래스 활용
		var member = new Member("ina","송인아","서울");
		
		log("member1: " + member.id + "," 
				+ member.name + "," + member.addr);
		
		//setter를 통해 데이터 주입
		member.setValue("shin","박신혜",37)
		
		log("member2: " + member.id + "," 
				+ member.name + "," + member.addr);
		
		//5.getter
		var memberInfo = member.getValue();
		log("member.getValue(): " + memberInfo);

	}
	
	window.onload = function() {
		memberClass();
	}
	
	
	
	

</script>

<body>

<h1>JavaScript Class</h1>

<hr/>

<div id="console"></div>

</body>
</html>