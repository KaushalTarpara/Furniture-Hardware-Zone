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

String cidd=request.getParameter("ciddelete");
if(cidd!=null)
{	
	String qryD="delete from tbl_addtocart where cart_id="+cidd;
	cn.exeUpdate(qryD);
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Details</title>

<link rel="stylesheet" type="text/css" href="AdminCss.css">
</head>
<body>
<%
		
// 	String qryTd="select p.*,c.* from tbl_product p,tbl_category c where";
// 			qryTd +=" p.category_id=c.category_id  order by product_id";

	String qryTd="select * from tbl_addtocart";
		ResultSet rs = cn.getResultSet(qryTd);
	%>

	<div id=table class="table-wrapper">
		<table 	class="fl-table" style="width: 98%;">
			<thead>
				<tr>
				<th>Cart ID</th>
				<th>User Name</th>				
				<th>Product Name</th>				
				<th>Image</th>				
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
					out.print(rs.getString("cart_id"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("user_id"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("pro_name"));
					%>
				</td>
				<td><img src=<%out.print(rs.getString("image"));%>
					alt="Products_images" width="200px"></td>
				<td>
					<%
					out.print(rs.getString("pro_price"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("quantity"));
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
				<a href='adminCart.jsp?ciddelete=<%out.print(rs.getString("cart_id"));%>'><img src="images/delete.png" width="23px" height="20px"></a></td>
			</tr>
			<% }
	%>
	</tbody>
		</table>
	</div>
</body>
</html>