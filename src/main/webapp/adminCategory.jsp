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

if(request.getParameter("add")!=null){
	String cname=request.getParameter("cname");
	String sname=request.getParameter("sname");
	
		
	String qryIc ="INSERT INTO `tbl_category`";
		   qryIc +="(`category_name`)";
		   qryIc +="VALUES ('"+cname+"')";

	cn.exeUpdate(qryIc);
	
		String qrySci="selete *from tbl_category where category_name="+cname;
		ResultSet rsSci=cn.getResultSet(qrySci);
		while(rsSci.next())
		{
		String cateId=request.getParameter("category_id");
		

	String qryIs ="INSERT INTO `tbl_subcategory`";
		   qryIs +="(`category_id`.`subcat_name`)";
		   qryIs +="VALUES ("+cateId+",'"+sname+"')";

	cn.exeUpdate(qryIs);
		
	}
}
String cidd=request.getParameter("ciddelete");
if(cidd!=null)
{	
	String qryD="delete from tbl_category where category_id="+cidd;
	cn.exeUpdate(qryD);
	
}
if(request.getParameter("update")!=null)
{	
	String uid=request.getParameter("pid");
	String uname=request.getParameter("uname");
	String uimage=request.getParameter("uimage");
	String usize=request.getParameter("usize");	

	
		String qryU ="UPDATE `tbl_product` SET "; 
		qryU += "`name`='"+uname+"',";
 		qryU += "`image`='images/"+uimage+"',";
		
		qryU += "WHERE product_id="+uid;

		cn.exeUpdate(qryU);

}
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="ISO-8859-1">
<title>Category Details</title>
<link rel="stylesheet" type="text/css" href="AdminCss.css">
</head>

<body bgcolor=" #b565a7">
<div id="adminpro">

	<%
	
	String sno = request.getParameter("cidedit");

// 	String qry = "select c.*,sc.*  from tbl_category c,tbl_subcategory sc where c.category_id=sc.category_id ";
	String qryC="select *from tbl_category";
	String qryS="select *from tbl_subcategory";
	
	String qrysc="select * form sub_category";
	ResultSet rssc=cn.getResultSet(qrysc);
	if (sno == null) {
	%>
	
		<div id="from" >
		<form  id="insert" method="POST" >
			<h1 style="margin:6px; font-size:60px;   line-height: 50px;" >Insert Category</h1>
			<h4>

				Category NAME : <input type="text" name="cname" required><br>
				Sub Category NAME : <input type="text" name="sname" required><br>								
				
				<input type="submit" name="add" id="add" value="Add Category">
				<input type="reset" id="reset">
			</h4>
			<br>
		</form>
	
	</div>
	<%
				} else {
				String qry = "select * from tbl_category where cateogry_id=" + sno;
					
					ResultSet rsd = cn.getResultSet(qry);
					
			
					while (rsd.next()) {
	%>
	<div id="from" >
	<div id="innerfrom">
		<form  method="GET">
			<h1 style="margin:8px; font-size:60px;   line-height: 50px;">Update Product</h1>
				<h3>
								<input type="hidden" name="pid" value='<%out.print(rsd.getString("category_id"));%>'>
				Product NAME : <input type="text" name="uname" 	value='<%out.print(rsd.getString("name"));%>' required><br>
				Select Image : <br>
				<img  name="uimg"	 width="150px" height="150px"	src='<%out.print(rsd.getString("image"));%>' >
				
				
				<input type="file" name="uimage" value="Upload New Image" accept=".png, .jpg, .jpeg"  src='<%out.print(rsd.getString("image"));%>' ><br>
				
				Size : <br><input type="text" name="usize" max=100 min=0 	value='<%out.print(rsd.getString("size"));%>' required><br>
			    Price : <br><input type="text" name="uprice" max=100 min=0 	value='<%out.print(rsd.getString("price"));%>' required><br>
				Quantity : <input type="number" name="uquantity"    value='<%out.print(rsd.getString("quantity"));%>'required><br>
				Description : <input type="text" name="udescription"value='<%out.print(rsd.getString("description"));%>' required><br>
				
				Category : <br><select name="ucat">
					<%
				
					int ccid=Integer.parseInt( rsd.getString("category_id"));			
					String qrySc="select * from tbl_category ";
				    ResultSet rsSc = cn.getResultSet(qrySc);			    
				    		
					while(rsSc.next())
					{
						int scid=Integer.parseInt(rsSc.getString("category_id"));	
						
							    if(ccid==scid){	%>
							    
								<option value="<% out.print(rsSc.getString("category_id"));%>" selected="selected">
								<% out.print(rsSc.getString("category_name"));%></option>
							    <%}else{
							    	%><option value="<% out.print(rsSc.getString("category_id"));%>" >
									<% out.print(rsSc.getString("category_name"));%></option>
							    <%}
				   	}
					%>
				</select><br><br>
				
				
				 Sub Category : <br>
				<select name="usubcat">
						<%
				
					int csid=Integer.parseInt( rsd.getString("subcat_id"));
						String ccidfors=rsd.getString("category_id");
					String qrySs="select * from tbl_subcategory where category_id="+ccidfors;
				    ResultSet rsSs = cn.getResultSet(qrySs);			    
				    		
					while(rsSs.next())
					{
						int ssid=Integer.parseInt(rsSs.getString("subcategory_id"));	
						
							    if(csid==ssid){	%>
							    
								<option value="<% out.print(rsSs.getString("subcategory_id"));%>" selected="selected">
								<% out.print(rsSs.getString("subcat_name"));%></option>
							    <%}else{
							    	%><option value="<% out.print(rsSs.getString("subcategory_id"));%>" >
									<% out.print(rsSs.getString("subcat_name"));%></option>
							    <%}
				   	}
					%>
				</select><br><br>
				
				
				
				
				<input type="submit" name="update" id="update" value="Update">
				  <input type="reset" id="reset">
				<br>
			</h3>
		</form>
		</div>
	</div>





	<%
		}
	}
	String qryTd="select s.*,c.* from tbl_subcategory s,tbl_category c where";
			qryTd +=" s.category_id=c.category_id order by c.category_id ";
		
		ResultSet rs = cn.getResultSet(qryTd);
	%>

	<div id=table class="table-wrapper">
		<table 	class="fl-table" >
			<thead>
				<tr>
				<th>Category ID</th>
				<th>Category </th>
				<th>Sub Category</th>
				
				<th>Edit/Delete</th>
				<tr>
			<thead>
			<tbody>
				<%
				while (rs.next()) {
				%>
			
			<tr>
				<td>
					<%
					out.print(rs.getString("category_id"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("category_name"));
					%>
				</td>
				<td>
							<%
					
					out.print(rs.getString("subcat_name"));
					%>
				
				
						</td>
				<td><a   href='adminCategory.jsp?c_idedit=<%out.print(rs.getString("category_id"));%>'>
				<img src="images/edit.png" width="23px" height="20px"> </a> 
				<a href='adminCategory.jsp?ciddelete=<%out.print(rs.getString("category_id"));%>'><img src="images/delete.png" width="23px" height="20px"></a></td>
			</tr>
			<% }
	%>
	</tbody>
		</table>
	</div>
</div>
</body>
</html>