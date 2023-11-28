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
 String qryUc="select * from tbl_addtocart where user_id="+userId;
// String qryU="select * from tbl_user where user_id="+session.getId(); 
 ResultSet rsUc=cn.getResultSet(qryUc);

 String qryU="select * from tbl_user where user_id="+userId;
// String qryU="select * from tbl_user where user_id="+session.getId(); 
 ResultSet rsU=cn.getResultSet(qryU);

 
 
 %>
	<%
   	  
		   	   	  	if( request.getParameter("Remove")!=null)
		   	   	  	{
		   	   				String	qryD="delete from tbl_addtocart  where pro_id="+request.getParameter("rpid"); 	 
		   	   			  cn.exeUpdate(qryD);
		   	   	  	
		   	   	  	}
   	   	  	%> 
   	
	   	 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>

	<title>Shopping Cart UI</title>
	<link rel="stylesheet" type="text/css" href="css/Cart.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,900" rel="stylesheet">
	  <link rel="stylesheet" type="text/css" href="css/index.css">
	 
	 
	  <style type="text/css">
	  .quantity {
  position: relative;
}

input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button
{
  -webkit-appearance: none;
  margin: 0;
}

input[type=number]
{
  -moz-appearance: textfield;
}

.quantity input {
  width: 45px;
  height: 42px;
  line-height: 1.65;
  float: left;
  display: block;
  padding: 0;
  margin: 0;
  padding-left: 20px;
  border: 1px solid #eee;
}

.quantity input:focus {
  outline: 0;
}

.quantity-nav {
  float: left;
  position: relative;
  height: 42px;
}

.quantity-button {
  position: relative;
  cursor: pointer;
  border-left: 1px solid #eee;
  width: 20px;
  text-align: center;
  color: #333;
  font-size: 13px;
  font-family: "Trebuchet MS", Helvetica, sans-serif !important;
  line-height: 1.7;
  -webkit-transform: translateX(-100%);
  transform: translateX(-100%);
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  -o-user-select: none;
  user-select: none;
}

.quantity-button.quantity-up {
  position: absolute;
  height: 50%;
  top: 0;
  border-bottom: 1px solid #eee;
}

.quantity-button.quantity-down {
  position: absolute;
  bottom: -1px;
  height: 50%;
}
</style>
</head>
<body >
<jsp:include page="UserNav.jsp" flush="true" />
   <div class="CartContainer" style="height:90%">
   	   <div class="Header">
   	   	<h3 class="Heading">Shopping Cart</h3>
   	   	<h5 class="Action">Remove all</h5>
   	   </div>
 	<form method="GET">
<%
		while(rsUc.next())
		{
		%>
		  
   	   <div class="Cart-Items">
   	   	  <div class="image-box">
   	   	  	<img src="<% out.print(rsUc.getString("image")); %>" style="height:140px;width:230px; border-radius: 20px; " />
   	   	  </div>
		
		<input type="hidden" name="rpid" value="<%out.print(rsUc.getString("pro_id"));%>">

   	   	  <div class="about">
   	   	  	<h1 class="title"><% out.print(rsUc.getString("pro_name")); %></h1>
   	   	  	<h3 class="subtitle"><% out.print(rsUc.getString("size")); %></h3>
   	   	  
   	   	  </div>
   	   	 
   	   	 
   	   	  
   	   	
   	   	  	<div  class="quantity">	
   	   	  	<h3>Quntity:</h3>
   	   	  	<input 	
   	   	  	type="number" name="qun" value=<%out.print(rsUc.getString("quantity")); %> min="10" max="100" step="10"></div>
   	   	  
   	   	  
   	   	  <div class="prices">
   	   	  	<div class="amount">Rs. <% int price = Integer.parseInt(rsUc.getString("pro_price")); tot+=price; items+=1;
   	   	  	out.print(price); %><br><p style="font-size: 10px;">Per Pice</p></div>
   	   	   	<div class="remove" >
   	   			<%  
   	   			if(  request.getParameter("confirm")!=null)
   	   			{
   	   		String qunQu="update tbl_addtocart set quantity='"+request.getParameter("qun")+"' where pro_id="+rsUc.getString("pro_id");
   	   		cn.exeUpdate(qunQu);	
   	   		
   	   			}
   	   			%>
   	   	  	<input type="submit" style="width: 70px" value="Remove" name="Remove">
   	   	  	</div>
   	   	  </div>
   	   </div>
   	     
   	   	  <% } 
   	   	 %>
   	   
   	 <hr> 
   	 <div class="checkout">
   	 
   	   
   	 <div class="total">
   	 	<div>
   	 		<div class="Subtotal">Sub-Total</div>
   	 		<div class="items"><% out.print(items); %> Items </div>
   	 	</div>
   	 	<div class="total-amount">Rs.<%out.print(tot);  %></div>
   	 </div>
   	 	 <input type="submit" name="confirm" style="background-color: blue; color: white; height: 40px;width: 90px; font-size: 20px; border-radius: 10px;" value="Confirm">
   	 	 <br>
   	 	
   	   		</form>		 
   	
   	 <a href="Billing.jsp">Checkout</a></div>
   </div>
</body>
</html>