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


String userId= (String) session.getAttribute("userKey");

String qryU="select * from tbl_user where user_id="+userId;
ResultSet rsU=cn.getResultSet(qryU);
rsU.next();
String qryUC="select *from tbl_addtocart where user_id="+userId;
ResultSet rsUC=cn.getResultSet(qryUC);


	
String pid=request.getParameter("pid");
String qryP="select * from tbl_product p,tbl_category c,tbl_subcategory s where"; 
		qryP+="	p.category_id=c.category_id and ";
		qryP+="	p.subcat_id=s.subcategory_id and ";
		qryP+="	product_id="+pid;
ResultSet rsP=cn.getResultSet(qryP);


if(request.getParameter("PlaceOrder")!=null)
{
	while(rsUC.next())
	{
			String cid=rsUC.getString("cart_id");	
			String prid=rsUC.getString("pro_id");
			String pname=rsUC.getString("pro_name");
			String pimage=rsUC.getString("image");	
			String ppri=rsUC.getString("pro_price");
			String ppt=request.getParameter("paytype");
			String uid=rsUC.getString("user_id");
			String pqun=rsUC.getString("quantity");;
			String psize=rsUC.getString("size");
			String tot=rsUC.getString("totle");
			java.sql.Date Odate = new java.sql.Date(System.currentTimeMillis()); 
			 
			 
		String qryIB="INSERT INTO `tbl_billing`(`product_id`, `name`, `image`, `price`, `pay-type`, `user_id`, `quentity`, `size`, `totle`, `date`) VALUES ";
		qryIB+="('"+prid+"','"+pname+"','"+pimage+"',";
		qryIB+="'"+ppri+"','"+ppt+"','"+uid+"',";
		qryIB+="'"+pqun+"','"+psize+"','"+tot+"','"+Odate+"')";
		
		
		String pidn=request.getParameter("pidn");
		
		
		String qrtPq="select *from tbl_product where product_id="+pidn;
		ResultSet gq=cn.getResultSet(qrtPq);
		gq.next();
		int poldq=Integer.parseInt(gq.getString("quantity"));
		

		String qryoq="select *from tbl_addtocart where pro_id="+pidn+" and user_id="+userId;
		ResultSet rsoq=cn.getResultSet(qryoq);
		rsoq.next();
		int poderq=Integer.parseInt(rsoq.getString("quantity"));
		
		
		int updatedqun = poldq - poderq;
		String qryUq="update tbl_product set quantity='"+String.valueOf(updatedqun)+"' where product_id="+pidn;
		cn.exeUpdate(qryUq);

		if(	cn.exeUpdate(qryIB))
		{
				String qryRc="delete from tbl_addtocart where cart_id="+cid;
				cn.exeUpdate(qryRc);
		}
	}
}




%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Out</title>
			<link rel="stylesheet" type="text/css" href="css/Billing.css">
			
			<style type="text/css">
			.select-dropdown,
.select-dropdown * {
	margin: 0;
	padding: 0;
	position: relative;
	box-sizing: border-box;
}
.select-dropdown {
	position: relative;
	background-color: #E6E6E6;
	border-radius: 4px;
	margin: 20px auto;
}
.select-dropdown select {
	font-size: 1rem;
	font-weight: normal;
	max-width: 100%;
	padding: 8px 24px 8px 10px;
	border: none;
	background-color: transparent;
		-webkit-appearance: none;
		-moz-appearance: none;
	appearance: none;
}
.select-dropdown select:active, .select-dropdown select:focus {
	outline: none;
	box-shadow: none;
}
.select-dropdown:after {
	content: "";
	position: absolute;
	top: 50%;
	right: 8px;
	width: 0;
	height: 0;
	margin-top: -2px;
	border-top: 5px solid #aaa;
	border-right: 5px solid transparent;
	border-left: 5px solid transparent;
}</style>
</head>
<body>
<jsp:include page="UserNav.jsp" flush="true" />
<div class='container'>
  <div class='window'>
    <div class='order-info'>
      <div class='order-info-content'>
        <h2>Order Summary</h2>
            
                <div class='line'></div>
       
       
           <%
           int totprice=0;
           	while(rsUC.next())
           	{
           		
           		int ppprice=Integer.parseInt(rsUC.getString("quantity"))*Integer.parseInt(rsUC.getString("pro_price"));	
           		totprice +=ppprice;
           %>
        
        <table class='order-table'>
          <tbody>
       
            <tr>
              <td><img src='<% out.print(rsUC.getString("image")); %>' class='full-width'></img>
              </td>
            
              <td>
                <br> <span class='thin'><%out.print(rsUC.getString("pro_name"));%></span>
             
                   <br> Price:<%out.print(rsUC.getString("pro_price"));%><br>
                 Qun:<%out.print(rsUC.getString("quantity"));%><br>
              </td>

            </tr>
            <tr>
              <td>
              <%  %>
        
                <div class='price'>Rs. <%out.print(ppprice);%> </div>
              </td>
            </tr>
          </tbody>

        </table>
           <form method="GET">
       <input type="hidden" name="pidn" value="<%out.print(rsUC.getString("pro_id"));%>">
        <div class='line'></div>
       <%} %>
               <div class='line'></div>
        <div class='total'>
          <span style='float:left;'>
            TOTAL
          </span>
          <span style='float:right; text-align:right;'>
         Rs.<% out.print(totprice); %>   
          </span>
        </div>
</div>
</div>
        <div class='credit-info'>
          <div class='credit-info-content'>
            <table class='half-input-table'>
            
<!--               <tr><td>Please select your card: </td> -->
<!-- 		              <td><div class='dropdown' id='card-dropdown'> -->
<!-- 		              <div class='dropdown-btn' id='current-card'>Visa</div> -->
<!-- 		                <div class='dropdown-select'> -->
<!-- 		                <ul> -->
<!-- 		                  <li>Master Card</li> -->
<!-- 		                  <li>American Express</li> -->
<!-- 		                  </ul></div> -->
<!-- 		                </div> -->
<!-- 		               </td></tr> -->
         
            <h3>User Name : </h3> <h2><%out.print(rsU.getString("user_name")); %></h2>
<!--          	   <img src='https://dl.dropboxusercontent.com/s/ubamyu6mzov5c80/visa_logo%20%281%29.png' height='80' class='credit-card-image' id='credit-card-image'></img> -->
         
            Select Payment Type:
            <div class='dropdown' id='card-dropdown'>
       
          <div class="select-dropdown">
            <select name="paytype">
            	<option>COD (case on Delivery)</option>
            	<option>Pay Later</option>
            </select>
            </div>

 <%
 if(request.getParameter("PlaceOrder")!=null)
 {
	%> <p style="margin:15px; font-size: 30px; ">Your Order is On the Way</p>
	  <button type="submit" class='pay-btn' name="ViewDeatials" onclick="">View Details</button><%
 }else
 {
	%>        
         
  <button type="submit" class='pay-btn' name="PlaceOrder">Place Order</button>
  <%
 }
 %>
 
  			</form>
  			 </div>
        </div>
      </div>
</div>
</body>
</html>