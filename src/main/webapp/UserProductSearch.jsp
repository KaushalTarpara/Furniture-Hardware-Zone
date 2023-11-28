<%@page import="org.apache.catalina.connector.Request"%>
<%@page import="java.sql.ResultSet"%>
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
 int totcp=0;
 String userId= (String) session.getAttribute("userKey");
 String qryU="select * from tbl_user where user_id="+userId;
// String qryU="select * from tbl_user where user_id="+session.getId(); 
 ResultSet rsU=cn.getResultSet(qryU);
	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Your Product</title>
<link rel="stylesheet" type="text/css" href="css/UserProductSearch.css">

<jsp:include page="UserNav.jsp" flush="true" /> 
</head>
<body>

 <%
	
	

// 	String qry = "select c.*,sc.*  from tbl_category c,tbl_subcategory sc where c.category_id=sc.category_id ";
	String qryC="select *from tbl_category";
	String qryS="select *from tbl_subcategory";
	
	
	%>
	<div  class="select-dropdown" style="margin-top: 10px;">
<form method="get" action="">

<ul>

<li><h2 style="margin-left: 20px;">Select Category :</h2></li>
<li><select name="Pcat" style="margin-right:20%; margin-left:10px;  height:40px; width:200px; font-size: 20px;border-radius: 20px;color:white; background: blue;" >
				
					<%
					ResultSet rsC = cn.getResultSet(qryC);
					ResultSet rsS = cn.getResultSet(qryS);
					while(rsC.next()) {
					%>
					<option style="text-align: center;" value="<% out.print(rsC.getString("category_id"));%>">
						<%
						out.print(rsC.getString("category_name"));
						%>
					</option>
					<%
						}
					%>
				</select><br><br></li>
				<li style="margin-right:10px; margin-left:100px;"><h2>Select Sub-Category :</h2></li>

				<li><select name="Psubcat"  style=" height:40px; width:200px; font-size: 20px;border-radius: 20px;color:white; background: blue;" >
				
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
				</select><br><br></li>
				
				<li><input  class="slide-hover-left-1"  type="submit" name="search" id="add" value="Search"></li></ul>
				


</form>
</div>
<%
if(request.getParameter("search")!=null)
{
	String cat=request.getParameter("Pcat");
	String sabcat=request.getParameter("Psubcat");
	String pname=request.getParameter("Pname");
// String qrySP="select p.*,c.* from tbl_product p,tbl_category c where";
// qrySP +=" p.category_id=c.category_id  order by product_id";

String qrySP="select *from tbl_product where category_id='"+cat+"' and subcat_id='"+sabcat+"'  or name='"+pname+"*' 	order by product_id";
ResultSet rs = cn.getResultSet(qrySP);
%>


 <div class="card">
               
                <div class="cards">
                   <%
                   	if(cn.openConn())
                   	{
                   		
                 while(rs.next())
                   {
                   %>
                    <div class="card-item">
                        <img src=<%out.print(rs.getString("image"));%> alt="Products_images" width="200px">
                        <div class="lines">
                            <p class="text-center my-1"><% out.print(rs.getString("name"));%></p>
                            <p class="text-center my-1">Rs.<%out.print(rs.getString("price"));%></p>
                               <a style="
									    color: white;
									    height: 50%;
									    padding: 6px 20px;
									    margin: 20%;
									    border-radius: 20px;
									    text-decoration: none;
									    background-color: blue;"
							href="Product.jsp?pid=<%out.print(rs.getString("product_id"));%>">Grub now</a>
                        
                        </div>
                    </div>
				   <% }
                   
                   	}
				   %>
                </div>
            </div>
            
<% 
}else
{
	%><h1><% out.print("Product not Avalablie");%></h1><%
}
%>

</body>
</html>