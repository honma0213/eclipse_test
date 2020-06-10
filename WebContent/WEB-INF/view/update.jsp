<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="form.update"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
<title>Insert title here</title>
</head>
<body>
<% String num = (String)request.getAttribute("num");%>
<form id = "check" action="/Bulletin_Board/update_result" method="post">
		投稿者<br><input type="text" id="name" name="name" value=""><br>
		メールアドレス<br><input type="text" id="mail" name="mail" value=""><br>
		内容<br><input type="text" id="comment" name="comment" value=""><br>
		<input type ="hidden" name = "id" value = <%=num%>>
		<br>　　　　　　　　<input type="submit" value="変更">
</form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$('#check').submit(function(){
    //ここで　入力項目の不備をチェックする。
    //不備があれば return false

    var name = document.getElementById("name").value;
    var mail = document.getElementById("mail").value;
    var comment = document.getElementById("comment").value;

    if(name == "" || mail == "" || comment == ""){
      	//ERROR検知(記入してない場合、フォームを止めて警告する)
    	alert("変更する情報を入力してください。");
        $('html').hide();
        $('html').show();
        return false;
    }else{
    	//script文が記述されているか判断。
    	if(name.indexOf("<script>") != -1 || mail.indexOf("<script>") != -1 || comment.indexOf("<script>") != -1){
    		alert("Script文があるため、エスケープ処理して投稿します。");
    		return true;
    	}else{
    		//禁止語句の使用・既存するメールアドレス(@の後ろの方)か判断
    		if(name.indexOf("死ね") != -1 || comment.indexOf("死ね") != -1){
        		alert("不適切な内容です");
            	return false;
    		}else if(mail.indexOf("@") == -1){
    			alert("使用可能なメールアドレスを入力してください");
            	return false;
    		}else{
    			//登録処理へ
        		return true;
    		}
    	}
    }
});
</script>

</html>