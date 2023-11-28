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

String uidd=request.getParameter("uiddelete");
if(uidd!=null)
{	
	String qryD="delete from tbl_user where user_id="+uidd;
	cn.exeUpdate(qryD);
	
}
if(request.getParameter("update")!=null)
{	
	String uid=request.getParameter("uid");
	String uname=request.getParameter("uname");
	String ufullname=request.getParameter("ufullname");
	String uemail=request.getParameter("uemail");	
	String ucontactno=request.getParameter("ucontectno");
	String uaddress=request.getParameter("uaddress");
	
		String qryU ="UPDATE `tbl_user` SET "; 
		qryU += "`user_name`='"+uname+"',";
 		qryU += "`user_fullname`='"+ufullname+"',";
		qryU += "`email`='"+uemail+"',";
		qryU += "`contact_no`="+ucontactno+",";
		qryU += "`address`='"+uaddress+"' ";
			
		qryU += "WHERE user_id="+uid;

		cn.exeUpdate(qryU);

}
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>
<link rel="stylesheet" type="text/css" href="AdminCss.css">
</head>

<body bgcolor=" #b565a7">
<div id="adminuser">



	<div id="from" style="overflow-y: hidden;">
	<div id="innerfrom" style=" align-content: center;">
	
	<%
	String uuid=request.getParameter("user_idedit");
	
	if(uuid==null){
		String qrtUd="selete *from tbl_user";
		
		%>
		
		<h1>Edit And Delete User Details</h1>
		<%
	
	}
	else{
		
	String qry = "select * from tbl_user where user_id="+uuid;
		
		
		ResultSet rsd = cn.getResultSet(qry);
		

		while (rsd.next()) {
		
		
	%>
		<form  method="GET">
			<h1 style="margin:8px;  font-size: 40px;">Update User Info</h1>
				<h3>
								<input type="hidden" name="uid" value='<%out.print(rsd.getString("user_id"));%>'>
				
			
				User NAME : <input type="text" name="uname" value='<%out.print(rsd.getString("user_name"));%>' required><br>
				Full Name : <input type="text" name="ufullname" value='<%out.print(rsd.getString("user_fullname"));%>' required><br>			
			    E-mail : <br><input	type="email" name="uemail" value='<%out.print(rsd.getString("email"));%>'  required><br>
				Contact Number: :<br><input type="number" name="ucontectno" pattern="[0-9]{10,10}" value='<%out.print(rsd.getString("contact_no"));%>' required><br>
				Address:<br>  <textarea rows = '4' cols = "40"  name = "uaddress"  style="border-radius: 5px; font-size: 18px; width: 285px;"><%out.print(rsd.getString("address"));%></textarea><br>
				
				<br>				
				<input type="submit" name="update" id="update" value="Update">
				  <input type="reset"  id="reset" value="Old Data">
				<br>
			</h3>
		</form>
		<%
		}
	} %>
		</div>
	</div>





	<%
	String qryTd="select * from tbl_user";
		ResultSet rs = cn.getResultSet(qryTd);
	%>

		<div id=table class="table-wrapper">
		<table 	class="fl-table" >
			<thead>
				<tr>
						<th >User Id</th>
							<th style="width:150px">Name</th>
							<th >Full Name</th>
							<th>Email</th>
							<th>Contac_no</th>
							<th style="width:250px">Address</th>
						    <th colspan="2">Operations	</th>				<tr>
			<thead>
			<tbody>
				<%
				while (rs.next()) {
				%>
			
				
	
			<tr>
			
						    <td><%out.print(rs.getString("user_id")); %></td>
						    <td><%out.print(rs.getString("user_name")); %></td>
							<td><%out.print(rs.getString("user_fullname")); %></td>
							<td><%out.print(rs.getString("email")); %></td>
							<td><%out.print(rs.getString("contact_no")); %></td>
							<td width="30px"><%out.print(rs.getString("address")); %></td>
							<td><a   href='adminuser.jsp?user_idedit=<%out.print(rs.getString("user_id"));%>'> <img src="images/edit.png" width="23px" height="20px"> </a>  
							<td><a href='adminuser.jsp?uiddelete=<%out.print(rs.getString("user_id"));%>'><img src="images/delete.png" width="23px" height="20px"></a></td> 
			</tr>
			
	
			
				<% }
	%>
	</tbody>
		</table>
	</div>
</div>
</body>
</html>