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
	
	String pname=request.getParameter("Pname");
	String pimage=request.getParameter("Pimage");
	String psize=request.getParameter("Psize");	
	String pprice=request.getParameter("Pprice");
	String pquantity=request.getParameter("Pquantity");
	String pdescription=request.getParameter("Pdescription");
	String pcat=request.getParameter("Pcat");
	String psubcat=request.getParameter("Psubcat");
	
	
	String qryI ="INSERT INTO `tbl_product`";
		   qryI +="(`name`, `image`, `price`, `size`, `quantity`, `description`, `category_id`, `subcat_id`)";
		   qryI +="VALUES ('"+pname+"','images/"+pimage+"','"+pprice+"','"+psize+"','"+pquantity+"','"+pdescription+"',"+pcat+","+psubcat+")";

	cn.exeUpdate(qryI);
}
String pid=request.getParameter("piddelete");
if(pid!=null)
{	
	String qryD="delete from tbl_product where product_id="+pid;
	cn.exeUpdate(qryD);
	
}
if(request.getParameter("update")!=null)
{	
	String uid=request.getParameter("pid");
	String uname=request.getParameter("uname");
	String uimage=request.getParameter("uimage");
	String usize=request.getParameter("usize");	
	String uprice=request.getParameter("uprice");
	String uquantity=request.getParameter("uquantity");
	String udescription=request.getParameter("udescription");
	String ucat=request.getParameter("ucat");
	String usubcat=request.getParameter("usubcat");
	
		String qryU ="UPDATE `tbl_product` SET "; 
		qryU += "`name`='"+uname+"',";
 		qryU += "`image`='images/"+uimage+"',";
		qryU += "`price`="+uprice+",";
		qryU += "`size`='"+usize+"',";
		qryU += "`quantity`="+uquantity+",";
		qryU += "`description`='"+udescription+"',";
 		qryU += "`category_id`="+ucat+",";
	 	qryU += "`subcat_id`="+usubcat+" ";
		qryU += "WHERE product_id="+uid;

		cn.exeUpdate(qryU);

}
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="ISO-8859-1">
<title>Product Details</title>
<link rel="stylesheet" type="text/css" href="AdminCss.css">
</head>

<body bgcolor=" #b565a7">
<div id="adminpro">

	<%
	
	String sno = request.getParameter("product_idedit");

// 	String qry = "select c.*,sc.*  from tbl_category c,tbl_subcategory sc where c.category_id=sc.category_id ";
	String qryC="select *from tbl_category";
	String qryS="select *from tbl_subcategory";
	
	if (sno == null) {
	%>
	
		<div id="from" >
		<form  id="insert" method="POST" >
			<h1 style="margin:6px; font-size:60px;   line-height: 50px;" >Insert Product</h1>
			<h4>

				Product NAME : <input type="text" name="Pname" required><br>
				Select Image : <input type="file" name="Pimage"	accept=".png, .jpg, .jpeg" required><br>
			    Price : <br><input	type="number" name="Pprice" min=0 required><br>
				Size :<br><input type="text" name="Psize" max=100 min=0 required><br>
				Quantity : <input type="number" name="Pquantity" required><br>
				Description : <input type="text" name="Pdescription" required><br>
				<select name="Pcat">
				<option selected="selected">--Select Category--</option>
					<%
					ResultSet rsC = cn.getResultSet(qryC);
					ResultSet rsS = cn.getResultSet(qryS);
					while(rsC.next()) {
					%>
					<option value="<% out.print(rsC.getString("category_id"));%>">
						<%
						out.print(rsC.getString("category_name"));
						%>
					</option>
					<%
						}
					%>
				</select><br><br>
				
				<select name="Psubcat">
				<option selected="selected">--Select  Sub Category--</option>
					<%
					while (rsS.next()) {
					%>
					<option value="<% out.print(rsS.getString("subcategory_id"));%>">
						<%
						out.print(rsS.getString("subcat_name"));
						%>
					</option>
					<%
					}
					%>
				</select><br><br>
				<input type="submit" name="add" id="add" value="Add Product">
				<input type="reset" id="reset">
			</h4>
			<br>
		</form>
	
	</div>
	<%
				} else {
				String qry = "select * from tbl_product where product_id=" + sno;
					
					ResultSet rsd = cn.getResultSet(qry);
					
			
					while (rsd.next()) {
	%>
	<div id="from" >
	<div id="innerfrom">
		<form  method="GET">
			<h1 style="margin:8px; font-size:60px;   line-height: 50px;">Update Product</h1>
				<h3>
								<input type="hidden" name="pid" value='<%out.print(rsd.getString("product_id"));%>'>
				Product NAME : <input type="text" name="uname" 	value='<%out.print(rsd.getString("name"));%>' required><br>
				Select Image : <br>
				<img  name="uimg"	 width="150px" height="150px"	src='<%out.print(rsd.getString("image"));%>' >
				
				
				<input type="file" name="uimage" value="Upload New Image" accept=".png, .jpg, .jpeg"  src='<%out.print(rsd.getString("image"));%>' ><br>
				
				Size : <br><input type="text" name="usize" max=100 min=0 	value='<%out.print(rsd.getString("size"));%>' required><br>
			    Price : <br><input type="text" name="uprice" max=100 min=0 	value='<%out.print(rsd.getString("price"));%>' required><br>
				Quantity : <input type="number" name="uquantity"    value='<%out.print(rsd.getString("quantity"));%>'required><br>
				Description : <input type="text" name="udescription"value='<%out.print(rsd.getString("description"));%>' required><br>
				
				Category : <br><select name="ucat" style="hight:25px; wight:270px;">
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
	String qryTd="select p.*,c.* from tbl_product p,tbl_category c where";
			qryTd +=" p.category_id=c.category_id  order by product_id";
		ResultSet rs = cn.getResultSet(qryTd);
	%>

	<div id=table class="table-wrapper">
		<table 	class="fl-table" >
			<thead>
				<tr>
				<th>Product NO</th>
				<th>Name</th>
				<th>Price</th>
				<th>Size</th>
				<th>Images</th>
				<th>Quantity</th>
				<th>Descriptiom</th>
				<th>Category</th>
				<th>Sub-category</th>
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
					out.print(rs.getString("Product_id"));
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
					out.print(rs.getString("quantity"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("description"));
					%>
				</td>
				<td>
					<%
					out.print(rs.getString("category_name"));
					%>
				</td>
				<td>
					<%
					String sid=rs.getString("subcat_id");
					String cid=rs.getString("category_id");
					String qrySc="select * from tbl_subcategory where subcategory_id="+sid+" and category_id="+cid;
			
				    ResultSet rsSc = cn.getResultSet(qrySc);
				    while (rsSc.next()) {			
					out.print(rsSc.getString("subcat_name"));
				    }
					%>
				</td>
				<td><a   href='adminProduct.jsp?product_idedit=<%out.print(rs.getString("product_id"));%>'>
				<img src="images/edit.png" width="23px" height="20px"> </a> 
				<a href='adminProduct.jsp?piddelete=<%out.print(rs.getString("product_id"));%>'><img src="images/delete.png" width="23px" height="20px"></a></td>
			</tr>
			<% }
	%>
	</tbody>
		</table>
	</div>
</div>
</body>
</html>