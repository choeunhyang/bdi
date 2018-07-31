<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String[] strs = {"가","나","다","라","마","바","사","아","자","차"};
for(int i = 1;i<=10;i++){
%>
	<%=i %>.<%=strs[i-1]%><br>
	<!-- out.write(i + "." + strs[i-1] + "<br>"); -->
<%
}
%>
</body>
</html>