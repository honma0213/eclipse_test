<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.data"%>
<%@page import="database.DataBase" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
<title>Insert title here</title>
</head>
<body>
	<center>
	<div class="fixing-base">
  		<div class="fixing-box">
	 		<button id = "display" type ="button" onclick="clickBtn()">管理者画面へ</button>
			<form id = "login" action = "/Bulletin_Board/TopAuthority">
				ユーザー<input id = "user" type = "text" name = "user" value="">
				Password<input id = "pw" type = "password" name = "pw" value="">
	 			<input type = "submit" value="ログイン">
			</form>
			<form id = "check" enctype="multipart/form-data" action="/Bulletin_Board/compleate" method = "post">
				投稿者<br><input type="text" id="name" name="name" value=""><br>
				メールアドレス<br><input type="text" id="mail" name="mail" value=""><br>
				内容<br><input type="text" id="comment" name="comment" value=""><br>
				<input type="text" name="id">
				<input type="file" name="file"/><br>
				<input type="submit" value="投稿">
			</form>
		</div>
	</div>
	<br>


	<%
	ArrayList<data> list =(ArrayList<data>)request.getAttribute("list");
	for(int i = 0 ; i < list.size() ; i++){
		data data = list.get(i);
	%>
		-----------------------------------------------------------------------------------------------------------------------------<br>
		<img src=<%=data.getFaile()%> width="223" height="43" alt="画像">
		<font size=5%>内容：<%=data.getComment() %></font><br><br>
		<font size = 4%>
			投稿者：<%=data.getName() %>
			メールアドレス：<%=data.getMail() %><br>
			投稿時間：<%=data.getTime() %>
			編集時間：<%=data.getUpdateTime() %><br>
		</font>
	<%} %>
</center>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	document.getElementById("login").style.visibility ="hidden";
	function clickBtn(){
	    const login = document.getElementById("login");

	    if(login.style.visibility=="visible"){
	        // hiddenで非表示
	        login.style.visibility ="hidden";
	    }else{
	        // visibleで表示
	        login.style.visibility ="visible";
	        login.style.visibility ="visible";
	    }
	}

	$('#login').submit(function(){
	    //ここで　入力項目の不備をチェックする。
	    //不備があれば return false

	    var user = document.getElementById("user").value;
	    var pw = document.getElementById("pw").value;

	    if(user == "" || pw == ""){
	      	//ERROR検知(記入してない場合、フォームを止めて警告する)
	    	alert("ユーザーID・パスワードを入力してください。");
	        $('html').hide();
	        $('html').show();
	        return false;
	    }else{
			if(user=="master" && pw=="master"){
		    	return true;
			}else{
		    	alert("ユーザーID・パスワードが違います");
				return false;
			}
	    }
	});


	$('#check').submit(function(){
    //ここで　入力項目の不備をチェックする。
    //不備があれば return false

    var name = document.getElementById("name").value;
    var mail = document.getElementById("mail").value;
    var comment = document.getElementById("comment").value;

    if(name == "" || mail == "" || comment == ""){
      	//ERROR検知(記入してない場合、フォームを止めて警告する)
    	alert("投稿者名・メールアドレス・内容を入力してください。");
        $('html').hide();
        $('html').show();
        return false;
    }else{
    	//script文が記述されているか判断。
    	if(name.indexOf("<script>") != -1 || mail.indexOf("<script>") != -1 || comment.indexOf("<script>") != -1){
    		alert("Script文があるため、エスケープ処理して投稿します。");
    		return true;
    	}else{
        	if(name.indexOf("死ね") != -1 || comment.indexOf("死ね") != -1){
        		alert("不適切な内容です");
            	return false;
    		}else if(mail.indexOf("@") == -1){
    			alert("ドメイン名を入力してください");
            	return false;
    		}else{
				alert("投稿しました。");
    			return true;
    		}
    	}
    }
});
</script>
</body>
</html>