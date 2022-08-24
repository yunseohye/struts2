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

<script type="text/javascript" src="<%=cp %>/data/js/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

//jquery방식
$(function(){
	
	//'',"" 어떤 것을 쓰던 상관이 없음.
	//id=btnOK를 클릭했을 때 이 함수를 실행해라 -> jquery방식
	$("#btnOK").click(function(){
		
		var msg = $("#userName").val();
		
		//radio버튼 읽는 방법 name이 gender인 radio에 체크되어있는 value의 값을 읽어와라
		//gender의 값이 2개이기 때문에 name을 gender라는 이름으로 통일해야 둘 중 선택한 것을 불러올 수 있음
		msg += "\r\n" + $("input:radio[name=gender]:checked").val();
		
		//여러개의 값 중에 선택을 하는 것.
		//id가 hobby인 value값을 읽어 join을 하는데 사이에 |를 넣어줌.
		msg += "\r\n" + $("#hobby").val().join("|");
		
		alert(msg);
		
	});
	
	
});



//js방식
//action form을 사용하지 않고 id로 읽어오는 방식임. 
//돔객체, 하나하나를 객체화 시켜서 값을 읽어냄.
	function result() {
		
		var msg = document.getElementById("userName").value;
		alert(msg);
		
	}

</script>

</head>
<body>

이름:<input type="text" id="userName" /><br/>

성별:<input type="radio" id="gender1" value="M" name="gender"/>남자
<input type="radio" id="gender2" value="F" name="gender"/>여자<br/>

취미:<br/>
<select id="hobby" multiple="multiple">
<option value="여행">여행</option>
<option value="영화">영화</option>
<option value="운동">운동</option>
<option value="게임">게임</option>
</select>
<br/><br/>

jQuery:<input type="button" value="확인" id="btnOK"/><br/>
<!-- js는 일반적으로 button에 onclick을 줘서 method를 호출함 -> form이 필요하다.
form을 사용하지 않는 방법은 38번째 줄에 적어놓음.  -->
javascript:<input type="button" value="확인" onclick="result();"/>

</body>
</html>