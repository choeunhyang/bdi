<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String age = request.getParameter("age");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	if(id==null){
		out.println("아이디를 입력해주세요");
		return;
	}
	if(age==null){
		out.println("나이를 입력해주세요");
		return;
	}
	if(email==null){
		out.println("이메일을 입력해주세요");
		return;
	}
	if(pwd==null){
		out.println("비밀번호를 입력해주세요");
		return;
	}
	
	out.println("ID : " + id + "<br>" + "비밀번호 : " + pwd + "<br>" +"나이 : " + age + "<br>" + "email : " + email);
%>
</body>
</html>