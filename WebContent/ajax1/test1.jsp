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
<title>js로 ajax구현하기</title>

<script type="text/javascript" src="<%=cp%>/data/js/ajaxUtil.js"></script>

<script type="text/javascript">

/* 
readystate
XMLHttpRequest 객체의 상태를 나타내는 코드. 
처음 XMLHttpRequest 객체를 생성하면(createXMLHttpRequest) = 0
요청할 페이지 정보를 설정하면 = 1
send() 메소드로 요청을 보내면 = 2
서버에서 응답이 오기 시작하면 = 3
서버 응답이 완료되면 = 4 (서버가 처리한 후 다시 나에게 값을 되돌려줄 때)
*/

/*
status
서버로부터 받은 응답 코드를 나타내는 숫자. 
정상적으로 응답을 받은 경우 = 200
페이지를 찾지 못한 경우 = 404 에러
*/

/*
callback함수를 언제 실행하면 되는가?
readystate가 4이면서 status가 200인 경우 서버가 나에게 데이터를 완전히 돌려준 것임
-> 이 작업을 감지해주는 것이 onreadystatechange이다.
그 이후 사용자에게 데이터를 어떻게 보여줄 것인지 생각해야함
 */
	function sendIt() {
		
		//XMLHttpRequest객체
		//크롬브라우저에서만 쓸거야, 익스플로어에서는 안뜸
		//xmlHttp = new XMLHttpRequest();
		
		//모든 브라우저에서 뜨게 하려면?
		xmlHttp =  createXMLHttpRequest();
		
		var query = "";
		var su1 = document.getElementById("su1").value; //js로 ajax구현하기
		var su2 = document.getElementById("su2").value; 
		var oper = document.getElementById("oper").value;
	
		//get방식으로 데이터 전송
		//post방식으로도 데이터 전송이 가능하다.
		query = "test1_ok.jsp?su1=" + su1 + "&su2=" + su2 + "&oper=" + oper;
	
		//되돌아오는 데이터를 받는 함수를 지정하는 부분임.
		//test1_ok.jsp로 데이터를 보내면 값을 처리한다음에
		//다시 되돌아 오는 데이터를 받을수 있게 하는 코드
		xmlHttp.onreadystatechange = callback;
		
		//get방식으로 query에 있는 주소와 데이터를 가지고 넘어가라
		//데이터를 비동기 방식으로 전송하여라(true를 사용)
		xmlHttp.open("GET",query,true);
		
		//get방식은 주소 뒤에 데이터를 적어놨기 때문에 괄호 안에 데이터를 쓰지 않아도 된다.
		//post방식은 주소 뒤에 데이터가 없기 때문에 괄호 안에 데이터를 다 적어주어야 한다.
		//(지금같은 경우는 ?뒤의 데이터들)
		xmlHttp.send(null);
		
		
	}
	
	/* 함수 생성
	데이터를 보냈다가 다시 받아서 사용자에게 보여주려할 때 사용하는 함수,
	사용자가 직접 생성할것임. 
	callback함수가 데이터를 받으면 제대로 된 값인지 확인하는 
	if문으로 확인을 한 후 내가 해야할 작업을 그 안에 작성한다.
	강사님이 주신 ajaxbasic.pdf 21p 참조할 것.
	*/
	
	function callback() {
		if(xmlHttp.readyState==4) {
			if(xmlHttp.status==200) {
				//readyStated와 status가 문제가 없을때만 작동함
				printData();
			}
		}
		
	} 

	//코딩이 너무 길어진다면 별도의 함수를 만들어 둔 후 위의 메소드에 넣어두면 함수가 실행될것임
	
	function printData() {

		//xml로 보낸 후 xml로 받는다.
		//받은 xml에서 root를 찾아 그 값을 result에 넣어라.
		// **TagName에는 getElements
		var result = xmlHttp.responseXML.getElementsByTagName("root")[0]; 
		
		//받아낸 데이터를 밑에 div id=resultDIV 넣어줄 것이기 때문에 div를 객체화 시켜 값을 넣어주어야함.
		// **id에는 getElement
		//out이라는 이름으로 객체를 생성
		var out = document.getElementById("resultDIV");
		
		//out에 HTML형식의 객체를 만들어놓을 것임
		out.innerHTML = "";
		//out.style.display에 내용이 있다면 null로 만듦.
		//처음 실행시 비어있기 때문에 2번째부터 효과를 낸다.
		out.style.display = "";
		
		// rsult에 _ok.jsp의 firstChild에 있는 nodeValue를 읽어내라
		// firstChild: _.jsp의 xml에 있는 문장 중 첫번째를 데려와라
		var value = result.firstChild.nodeValue;
		
		//읽어낸 value값을 out.innerHTML에 넣어라.
		//out의 위치? 139번 째 줄의 resultDIV
		out.innerHTML = value;
		
	}
	

</script>

</head>
<body>

<input type="text" id="su1"/>
<select id="oper">
	<option value="hap">더하기</option>
	<option value="sub">빼기</option>
	<option value="mul">곱하기</option>
	<option value="div">나누기</option>
</select>
<input type="text" id="su2" />
<input type="button" value=" = " onclick="sendIt();" />
<br/>

<div id="resultDIV" style="display: none;"></div>

</body>
</html>