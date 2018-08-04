<%@ page  import = " java.util.* " %>
<%@page import="com.bdi.test.DepartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
DepartService ds = DepartService.getDS();
List<Map<String,String>> departList = ds.getDepartList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/bs-3.3.7/dist/css/bootstrap.css" />
<link rel="stylesheet" href="/bs-3.3.7/dist/css/bootstrap-theme.css" />
<style>
table td, th {
	text-align: center;
}
</style>
</head>
<body>
	<div class="contatiner">
	<form>
		<select name="type">
			<option value="name" >
		</select>
		<button>검색</button>
	</form>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>departName</th>
					<th>departCode</th>
					<th>departCnt</th>
					<th>departEtc</th>
				</tr>
			</thead>
			<tbod>
			<%
			for(int i=1;i<=20;i++){
				Map<String,String> depart = departList.get(i);
			%>
				<tr>
					<td><%=depart.get("departName") %></td>
					<td><%=depart.get("departCode") %></td>
					<td><%=depart.get("departCnt") %></td>
					<td><%=depart.get("departEtc") %></td>
				</tr>
			<%
			}
			%>
			</tbod>
		</table>
	</div>
</body>
</html>