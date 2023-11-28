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
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link rel="shortcut icon" type="image/png" href="images/cromat.png">
		
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <img src="images/cromat.png" alt="">
                <h1 style="margin-left:10px; color: white;">Anjali Enterprice</h1>
            </div>
            
            <ul>
                <li><a href="index.jsp">Home</a></li>
                 <li><a href="UserProductSearch.jsp">Search</a></li>
                   <li><a href="UserOrders.jsp">Orders</a></li>
                <li><a href="AboutUS.jsp">About</a></li>
                <li><a href="ContectUs.jsp">Contact</a></li>
               
            </ul>
            
            <ul style="margin-left: 15%;">
            <li><%
            String qryCi="select * from tbl_addtocart where user_id="+userId;
            ResultSet rsCi=cn.getResultSet(qryCi);
            while(rsCi.next())
            {
             totcp += 1;
            }
            %>
            
            <li>       <div class="logo">
               <a href="Cart.jsp" >  <img src="images/cart.png" alt=""></a><%--<% out.print(totcp); %> --%>
            </div>
     </li>
     
           
           
           <li>
           		<a style="font-size: 20px;color:margin-left: 250px;"href="UserPro.jsp"> <%
           		
                while(rsU.next())
                {
                out.print(rsU.getString("user_name"));
                }
                %>
           </a></li>

           <li><a  style="margin-left:0px;"href="login.jsp">Logout</a></li>
           </ul>
          
        </nav>
    </header>    
</body>
</html>