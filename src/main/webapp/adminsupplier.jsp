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

String sidd=request.getParameter("siddelete");
if(sidd!=null)
{	
	String qryD="delete from tbl_supplier where sup_id="+sidd;
	cn.exeUpdate(qryD);
	
}
if(request.getParameter("update")!=null)
{	
	String sid=request.getParameter("sid");
	String sname=request.getParameter("sname");
	
	String semail=request.getParameter("semail");	
	String scontactno=request.getParameter("scontectno");
	String saddress=request.getParameter("saddress");
	
	
		String qryU ="UPDATE `tbl_supplier` SET "; 
		qryU += "`sup_name`='"+sname+"',";
 		qryU += "`email`='"+semail+"',";
		qryU += "`contact_no`="+scontactno+",";
		qryU += "`address`='"+saddress+"' ";
		
			
		qryU += "WHERE sup_id="+sid;

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
	String suid=request.getParameter("sup_idedit");
	
	if(suid==null){
		String qrtUd="selete *from tbl_user";
		
		%>
		
		<h1>Edit And Delete Supplier Details</h1>
		<%
	
	}
	else{
		
	String qry = "select * from tbl_supplier where sup_id="+suid;
		
		
		ResultSet rsd = cn.getResultSet(qry);
		

		while (rsd.next()) {
		
		
	%>
		<form  method="GET">
			<h1 style="margin:8px;  font-size: 40px;">Update User Info</h1>
				<h3>
								<input type="hidden" name="sid" value='<%out.print(rsd.getString("sup_id"));%>'>
				
			
				Supplier NAME : <input type="text" name="sname" value='<%out.print(rsd.getString("sup_name"));%>' required><br>
						
			    E-mail : <br><input	type="email" name="semail" value='<%out.print(rsd.getString("email"));%>'  required><br>
				Contact Number: :<br><input type="number" name="scontectno" pattern="[0-9]{10,10}" value='<%out.print(rsd.getString("contact_no"));%>' required><br>
				Address:<br>  <textarea rows = '4' cols = "40"  name = "saddress"  style="border-radius: 5px; font-size: 18px; width: 285px;"><%out.print(rsd.getString("address"));%></textarea><br>
				
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
	String qryTd="select * from tbl_supplier";
		ResultSet rs = cn.getResultSet(qryTd);
	%>

		<div id=table class="table-wrapper">
		<table 	class="fl-table" >
			<thead>
				<tr>
						<th >Supplier Id</th>
							<th style="width:150px">Name</th>
							
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
			
						    <td><%out.print(rs.getString("sup_id")); %></td>
						    <td><%out.print(rs.getString("sup_name")); %></td>
							
							<td><%out.print(rs.getString("email")); %></td>
							<td><%out.print(rs.getString("contact_no")); %></td>
							<td width="30px"><%out.print(rs.getString("address")); %></td>
							<td><a   href='adminsupplier.jsp?sup_idedit=<%out.print(rs.getString("sup_id"));%>'> <img src="images/edit.png" width="23px" height="20px"> </a>  
							<td><a href='adminsupplier.jsp?siddelete=<%out.print(rs.getString("sup_id"));%>'><img src="images/delete.png" width="23px" height="20px"></a></td> 
			</tr>
			
	
			
				<% }
	%>
	</tbody>
		</table>
	</div>
</div>
</body>
</html>