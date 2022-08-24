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
<title>j-Query를 활용해 Ajax 구현하기</title>

<!-- j-Query를 사용하기 때문에 라이브러리가 있어야하기 때문에 import함 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">

$(function(){
	
	//sendButton을 click하면 이 함수를 실행시켜라
	$("#sendButton").click(function(){
		
		//post방식(데이터만 정렬)
		var param = "subject=" + $("#subject").val() +
					"&content=" + $("#content").val();
		
		$.ajax({
			
			type:"post",
			url:"test2_ok.jsp",
			data:param, //post방식이기 때문에 데이터가 param에 있다.
			dataType:"xml",
			success:function(args){//변수이름 - 사용자 정의
				
				//alert(args);
				
				$(args).find("status").each(function() {
					//status의 텍스트인 권장도서가 뜬다.
					alert($(this).text());
				});
				
				var str = "";
				
				$(args).find("record").each(function() {
					var id = $(this).attr("id");
					var subject = $(this).find("subject").text();
					var content = $(this).find("content").text();
				
					str += "id=" + id +
							"subject=" + subject +
							"content=" + content + "<br/>"
				
				});
				
				//str에 누적된 데이터를 출력시켜주는 작업
				$("#resultDIV").html(str);
				
			},
			//ajax의 j-query
			//데이터를 보내기 전에 showRequest(메소드명)를 먼저 실행해라
			beforeSend:showRequest,
			error:function(e){
				//에러가 생기면 alert 발생 - 응답받은 e의 내용을 띄워라
				alert(e.responseText);
				//에러가 없으면 success로 돌아감
			}
		});			
	});
});

//데이터를 보내기 전에 미리 오류가 있나 확인해주는 작업
function showRequest() {

	var flag = true;
	
	if(!$("#subject").val()){
		alert("제목을 입력하세요.");
		$("#subject").focus();
		
		return false;
	}
	
	if(!$("#content").val()){
		alert("내용을 입력하세요.");
		$("#content").focus();
		
		return false;
	}
	//정상적으로 값이 입력된 경우에는 flag(true값이 있음)를 입력해줘야 ajax작업을 실행시켜준다.
	//그렇지 않으면 동작이 멈춰 실행되지 않는다.
	
	return flag;
}

</script>

</head>

<body>

제목:<input type="text" id="subject"/><br/>
내용:<input type="text" id="content"/><br/>
<input type="button" id="sendButton" value="보내기"/>
<div id="resultDIV"></div>
</body>
</html>