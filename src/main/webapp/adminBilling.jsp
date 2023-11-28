<%@page import="frm.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%
DBConnection cn = new DBConnection(
		application.getInitParameter("MySQL_ConnString").toString(),
		application.getInitParameter("MySQL_User").toString(),
		application.getInitParameter("MySQL_Pass").toString(),
		application.getInitParameter("MySQL_Driver").toString());

cn.openConn();

String oidd=request.getParameter("ciddelete");
if(oidd!=null)
{	
	String qryD="delete from tbl_billing where order_id="+oidd;
	cn.exeUpdate(qryD);
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order(Sales) Details</title>

<link rel="stylesheet" type="text/css" href="AdminCss.css">
</head>
<body>
<%
		
// 	String qryTd="select p.*,c.* from tbl_product p,tbl_category c where";
// 			qryTd +=" p.category_id=c.category_id  order by product_id";

	String qryTd="select * from tbl_billing";
		ResultSet rs = cn.getResultSet(qryTd);
	%>

	<div id=table class="table-wrapper">
		<table 	class="fl-table" style="width: 98%;">
			<thead>
				<tr>
				<th>Order ID</th>
				<th>User Name</th>				
				<th>Product Name</th>				
				<th>Image</th>				
				
				<th>Pay-Type</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Totle</th>
				<th>Size</th>
				<th>Date</th>					
				<th>Delete</th>
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
					out.print(rs.getString("user_id"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("name"));
					%>
				</td>
				<td><img src=<%out.print(rs.getString("image"));%>
					alt="Products_images" width="200px"></td>
					
					<td>
					<%
					out.print(rs.getString("pay-type"));
					%>
				</td>
				
				<td>
					<%
					out.print(rs.getString("price"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("quentity"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("totle"));
					%>
				</td>
			
			
				<td>
					<%
					out.print(rs.getString("size"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("date"));
					%>
				</td>
			
				<td>
				<a href='adminBilling.jsp?ciddelete=<%out.print(rs.getString("order_id"));%>'><img src="images/delete.png" width="23px" height="20px"></a></td>
			</tr>
			<% }
	%>
	</tbody>
		</table>
	</div>
</body>
</html>