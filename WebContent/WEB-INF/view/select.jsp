<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.data"%>
<%@page import="database.DataBase"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
<title>Insert title here</title>
</head>
<body>
	<size=4%>
		<form action = "/Bulletin_Board/form">
			<input type = "submit" value="トップページへ">
		</form>
	</size>
	<br>
	<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<data> list =(ArrayList<data>)request.getAttribute("list");
	for(int i = 0 ; i < list.size() ; i++){
		data data = list.get(i);
	%>
		<img src=<%=data.getFaile()%> width="223" height="43" alt="画像">
		<font size=5%>内容：<%=data.getComment() %></font><br><br>
		<font size = 4%>
			投稿者：<%=data.getName() %>
			メールアドレス：<%=data.getMail() %><br>
			投稿時間：<%=data.getTime() %><br>
			編集時間：<%=data.getUpdateTime() %>
			<form class = "change" action = "/Bulletin_Board/update" method="post">
				<input type ="hidden" name = "id" value = <%=data.getId()%>>
				<input type = "submit" value="編集">
			</form>
			<form class = "remove" action = "/Bulletin_Board/remove" method="post">
				<input type ="hidden" name = "ID" value = <%=data.getId()%>>
				<input type = "submit" value="削除" >
			</form><br>
			------------------------------------------------------------<br>
			------------------------------------------------------------<br>
		</font>
	<%} %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$('.change').submit(function(){
		var res = confirm("本当に変更しますか？");
		if( res == true ) {

		}else{
			alert("変更をキャンセルしました");
			return false;
		}
	});
	$('.remove').submit(function(){
		var res = confirm("本当に削除しますか？");
		if( res == true ) {
		}else{
	 		alert("データ削除をキャンセルしました")
  			return false;
		}
	});
</script>
</body>
</html>