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


if(request.getParameter("update")!=null)
{	
	String uid=request.getParameter("aid");
	String uname=request.getParameter("aname");
	String udetail=request.getParameter("adetail");
	
		String qryU ="UPDATE `tbl_about` SET "; 
		qryU += "`name`='"+uname+"',";
 		qryU += "`detail`='"+udetail+"' ";				
		qryU += "WHERE id="+uid;

		cn.exeUpdate(qryU);

}
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="ISO-8859-1">
<title>About Details</title>
   <link rel="stylesheet" type="text/css" href="css/adminstyle.css">
<link rel="stylesheet" type="text/css" href="AdminCss.css">
</head>

<body bgcolor=" #b565a7">
<div id="adminuser">



	<div id="from" style="overflow-y: flex;">
	<div id="innerfrom" style=" align-content: center;">
	
	<%
	String uuid=request.getParameter("id");
	
	if(uuid==null){
		String qrtUd="selete *from tbl_about";
		
		%>
		
		<h1 style="font-size: 60px;">Edit AboutUs and ContactUs</h1>
		<%
	
	}
	else{
		
	String qry = "select * from tbl_about where id="+uuid;
		
		
		ResultSet rsd = cn.getResultSet(qry);
		

		while (rsd.next()) {
		
		
	%>
		<form  method="GET">
			<h1 style="margin:8px; line-height:50px; font-size: 40px;">Update AboutUs Details </h1>
				<h3>
								<input type="hidden" name="aid" value='<%out.print(rsd.getString("id"));%>'>
				
			
				NAME : <input type="text" name="aname" value='<%out.print(rsd.getString("name"));%>' required><br>
				Details:<br>  <textarea rows = '10' cols = "50"  name = "adetail"  style="border-radius: 5px; font-size: 18px; width: 90%;"><%out.print(rsd.getString("detail"));%></textarea><br>
				
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
	String qryTd="select * from tbl_about";
		ResultSet rs = cn.getResultSet(qryTd);
	%>

		<div id=table class="table-wrapper" >
		
		<table 	class="fl-table" >
			<thead>
				<tr>
						<th >Id</th>
							<th style="width:150px">Name</th>
							<th >Details</th>
							<th>Edit</th>
							</tr>
			<thead>
			<tbody >
				<%
				while (rs.next()) {
				%>
			<tr>
			
						    <td><%out.print(rs.getString("id")); %></td>
						    <td><%out.print(rs.getString("name")); %></td>
						     <td style="white-space:pre-line"><%out.print(rs.getString("detail")); %></td>
							<td><a   href='adminAbout_Contact.jsp?id=<%out.print(rs.getString("id"));%>'> <img src="images/edit.png" width="23px" height="20px"> </a>  
						 
			</tr>
			
	
			
				<% }
	%>
	</tbody>
		</table>
		
	</div>
	
	
</div>
</body>
</html>