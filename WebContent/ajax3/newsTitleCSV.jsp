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

<style type="text/css">

.news {
	font-size: 12px;
	display: block;
	margin: 0 auto;
	background-color: yellow;
	color: blue;
	border: 1px dashed black;
	width: 60%;
}

.newsError {
	font-size: 9px;
	display: block;
	margin: 0 auto;
	background-color: orange;
	color: red;
	border: 1px dashed black;
	width: 60%;

}

</style>

<script type="text/javascript" src="<%=cp %>/data/js/ajaxUtil.js"></script>

<script type="text/javascript">

	function newsTitle() {
		
		//hideNewsDiv();
		
		sendRequest("newsTitleCSV_ok.jsp",null,displayNewsTitle,"GET");
		
		setTimeout("newsTitle()",3000);
		
	}
	
	function displayNewsTitle() {
		
		if(httpRequest.readyState==4) {
			if(httpRequest.status==200) {
				
				var csvText = httpRequest.responseText;
				//alert(csvText);
				
				var csvArray = csvText.split("|");
				
				var countStr = csvArray[0];
				//alert(countStr + "개");
			
				if(countStr==0) {
					alert("News가 없다");
					return;
				}
				var csvData = csvArray[1];
				//alert(csvData);
				
				var newsTitleArray = csvData.split("*");
				//alert(newsTitleArray.length);
				
				var html = "";
				
				html += "<ol>";
				
				for(var i=0;i<newsTitleArray.length;i++) {
					
					var newsTitle = newsTitleArray[i];
					
					html += "<li>" + newsTitle + "</li>";
					
				}
				
				html += "</ol>";
				
				//alert(html);
				
				var newsDiv = document.getElementById("newsDiv");
				
				newsDiv.innerHTML = html;
				
			} else {
				
				var newsDiv = document.getElementById("newsDiv");
				
				newsDiv.innerHTML = httpRequest.status + "에러 발생"
			
			}
		}
		
	}
	
	function showNewsDiv() {
		
		var newsDiv = document.getElementById("newsDiv");
		newsDiv.style.display = "block";
		
	}
	
	function hideNewsDiv() {
	
		var newsDiv = document.getElementById("newsDiv");
		newsDiv.style.display = "none";
	
	}

	window.onload = function(){
		newsTitle();
	}
</script>
</head>
<body>
<h2>헤드라인 뉴스</h2>
<hr/>
<br/>
<div style="display: block; border: 3px solid; width: 60%; margin: 0 auto;">
뉴스보기
</div>
<div id="newsDiv" class="news"></div>
</body>
</html>