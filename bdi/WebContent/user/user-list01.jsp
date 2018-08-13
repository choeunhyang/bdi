<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page  import = " com.bdi.test.UserService " %>
<%@ page  import = " java.util.HashMap " %>
<%@ page  import = " java.util.ArrayList " %>
<%@ page  import = " java.util.Map " %>
<%@ page  import = " java.util.List " %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- <%!
    public String checkSel(String str1, String str2){
    	if(str1==null){
    		return "";
    	}
    	if(!str1.equals(str2)){
			return "";
		}
		return "selected";
    }
    %> --%>
    <%!
    private static String driver = "org.mariadb.jdbc.Driver";
	private static String url = "jdbc:mariadb://localhost:3306/dbi";
	private static String id = "root";
	private static String pwd = "12345678";
	
	public List<Map<String,String>> getUserlist(){
		Connection con = null;
		List<Map<String,String>> userList = new ArrayList<Map<String,String>>();
		try {
			Class.forName(driver); // 나 오류날수 있어 반드시 예외처리 해줘 내가 모르는 오류
			con = DriverManager.getConnection(url, id, pwd);
			Statement stmt = con.createStatement();
			String sql = "select * from user_info";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Map<String,String>user = new HashMap<String,String>();
				user.put("uiNo", rs.getString("uiNo"));
				user.put("uiId", rs.getString("uiId"));
				user.put("uipwd", rs.getString("uipwd"));
				user.put("uiName", rs.getString("uiName"));
				/*System.out.print(rs.getInt("uiNo"));
				System.out.print(rs.getString("uiId"));
				System.out.print(rs.getString("uipwd"));
				System.out.print(rs.getString("uiName"));
				System.out.println();*/
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		/*} catch (ClassNotFoundException e) { //에러가 나면 잡아준다  종류가 다르다.
			e.printStackTrace(); // 드라이버 못찾았을때
		} catch (SQLException e) {
			e.printStackTrace();	// SQL못찾았을때
		}*/
		return userList;
	}
    %>
<%
/* String search = request.getParameter("search");
String type= request.getParameter("type");
UserService us = UserService.getUS();
List<Map<String,String>> userList = us.getUserList(type, search);*/
List<Map<String,String>> userList = getUserlist();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/bs-3.3.7/dist/css/bootstrap.css" />
<link rel="stylesheet" href="/bs-3.3.7/dist/css/bootstrap-theme.css" />
<style>
	table td, th{
		text-align:center;
	}
</style>
</head>
<body>
<div class="contatiner"><br>
	<%-- <form>
		<select name="type">
				<option value="name" <%=checkSel(type,"name")%>>이름</option>
				<option value="age" <%=checkSel(type,"age")%>>나이</option>
				<option value="address" <%=checkSel(type,"address")%>>주소</option>
				<option value="id" <%=checkSel(type,"id")%>>아이디</option>
			<option value="name" <%=type!=null?type.equals("name")?"selected":"":""%>>이름</option>
			<option value="age" selected <%=type!=null?type.equals("age")?"selected":""%>>나이</option>
			<option value="address" <%=type!=null?type.equals("address")?"selected":""%>>주소</option>
			<option value="id" <%=type!=null?type.equals("id")?"selected":""%>>아이디</option>
		</select> : <input type = "text" name="search" value="<%=search!=null?search:""%>">
		<button>검색</button>
	</form> --%>
	<br>
	<table class="table table-hover table-bordered">
	<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
	</thead>
	<tbody>
<%
for(int i=0;i<userList.size();i++){
	Map<String,String> user = userList.get(i);
%>
	<tr>
		<td><%=user.get("uiNo")%></td>
		<td><%=user.get("uiId")%></td>
		<td><%=user.get("uiPwd")%></td>
		<td><%=user.get("uiName")%></td>
	</tr>
	<%-- 
	<tr>
		<td>홍길동<%=i%></td>
		<td><%=i+10%></td>
		<td>서울 구로구 가산동<%=i%>번지</td>
		<td>hong<%=i%></td>
	</tr> 
	--%>
<%
}
%>
	</tbody>
	</table>
</div>
</body>
</html>