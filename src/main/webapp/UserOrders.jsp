<%@page import="java.sql.*"%>
<%@page import="frm.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
 DBConnection cn = new DBConnection(
			application.getInitParameter("MySQL_ConnString").toString(),
			application.getInitParameter("MySQL_User").toString(),
			application.getInitParameter("MySQL_Pass").toString(),
			application.getInitParameter("MySQL_Driver").toString()
			);
 
 cn.openConn();		
 
 
 int tot=0,items=0,i=0;
 String userId= (String) session.getAttribute("userKey");
 String qryUc="select * from tbl_billing where user_id="+userId;
// String qryU="select * from tbl_user where user_id="+session.getId(); 
 ResultSet rsUc=cn.getResultSet(qryUc);
	
 String qryU="select * from tbl_user where user_id="+userId;
// String qryU="select * from tbl_user where user_id="+session.getId(); 
 ResultSet rsU=cn.getResultSet(qryU);

 
 
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Orders</title>

	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900" rel="stylesheet">
	  <link rel="stylesheet" type="text/css" href="css/index.css">
	 
<link rel="stylesheet" type="text/css" href="css/UserOrders.css">
	 
</head>
<body >

<jsp:include page="UserNav.jsp" flush="true" />

<%
String qryTd="select *from tbl_billing where user_id="+userId;
ResultSet rs = cn.getResultSet(qryTd);
%>

	<div id=table class="table-wrapper">
		<table 	class="fl-table" >
			<thead>
				<tr>
				<th>Order NO</th>
				<th>Name</th>
				<th>Price</th>
				<th>Size</th>
				<th>Images</th>
				<th>Quantity</th>
				<th>Pay-Type</th>
				<th>Totle</th>
				<th>Date</th>
				<tr>
			<thead>
			<tbody>
				<%
				while (rs.next()) {
				%>
			
			<tr>
				<td>
					<%
					out.print(rs.getString("order_id"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("name"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("price"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("size"));
					%>
				</td>
				<td><img src=<%out.print(rs.getString("image"));%>
					alt="Products_images" width="200px"></td>
				<td>
					<%
					out.print(rs.getString("quentity"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("pay-type"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("totle"));
					%>
				</td>
					<td>
					<%
					out.print(rs.getString("date"));
					%>
				</td>
				
			</tr>
			<% }
	%>
	</tbody>
		</table>
</body>
</html>