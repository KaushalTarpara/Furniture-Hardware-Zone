<%@page import="frm.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"  import="java.sql.*"%>

 <%
 DBConnection cn = new DBConnection(
			application.getInitParameter("MySQL_ConnString").toString(),
			application.getInitParameter("MySQL_User").toString(),
			application.getInitParameter("MySQL_Pass").toString(),
			application.getInitParameter("MySQL_Driver").toString()
			);
	
 %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    	<link rel="shortcut icon" type="image/png" href="images/cromat.png">
		
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" integrity="sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/adminstyle.css">
    <title>Admin Panel</title>
</head>
<body>
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon"><img src="icon/cromat.png" height="50vh"></span>
                        <span class="title"><h2> Cromat</h2></span>
                    </a>    
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><img src="icon/home.png" height="17vh"></span>
                        <span class="title">Dashboard</span>
                        </a>
                </li>
                <li>
                    <a href="adminuser.jsp">
                        <span class="icon"><img src="icon/cst.png" height="17vh"></span>
                        <span class="title">Users</span>
                    </a>
                </li>
                <li>
                    <a href="adminProduct.jsp">
                        <span class="icon"><img src="icon/product.png" height="17vh"></span>
                        <span class="title">Product</span>
                    </a>
                </li>
                <li>
                    <a href="adminsupplier.jsp">
                        <span class="icon"><img src="icon/Supplier.png" height="17vh"></span>
                        <span class="title">Supplier</span>
                    </a>
                </li>
                <li>
                    <a href="adminCategory.jsp">
                        <span class="icon"><img src="icon/categories.png" height="17vh"></span>
                        <span class="title">Category & Sub Category</span>
                    </a>
                </li>
                <li>
                    <a href="adminAbout_Contact.jsp">
                        <span class="icon"><img src="icon/about.png" height="17vh"></span>
                        <span class="title">AboutUs & ContectUs</span>
                    </a>                        
                </li>
                <li>
                    <a href="AdminLogin.jsp">
                        <span class="icon"><img src="icon/signout.png" height="17vh"></span>
                        <span class="title">Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="main">
            <div class="topbar">
          
                <div class="toggle" onclick="toggleMenu();"></div>
                  
               <h1>Anjali Enterprice</h1>
            </div>

            <div class="cardBox">
                
                <div class="card">
                    <div>
                  <%                 			
                  if(cn.openConn())
                  {
                 	       String qry="select * from tbl_product";
                 	       int pro=0;
                 	       pro=cn.exeSelect(qry); 
                  
                  %>
                        <div class="numbers"><% out.print(pro);%></div>
                        <div class="cardName">Total Product</div>
                    </div>
                    <div class="iconbox">
                        <img src="icon/totproduct.png" height="30px">
                    </div>
                </div>

                <div class="card">
                    <div>
                      <%                 			
                
                 	       qry="select * from tbl_billing";
                 	       int order=0;
                 	       order=cn.exeSelect(qry); 
                  
                  %>
                        <div class="numbers"><% out.print(order);%></div>
                        <div class="cardName">Sales</div>
                    </div>
                    <div class="iconbox">
                        <img src="icon/sales.png" height="30px">
                    </div>
                </div>

                <div class="card">
                    <div>
                     <%                 			
                
                 	       qry="select * from tbl_user";
                 	       int totuser=0;
                 	       totuser=cn.exeSelect(qry); 
                  
                  %>
                        <div class="numbers"><% out.print(totuser);%></div>
                        <div class="cardName">Total User</div>
                    </div>
                    <div class="iconbox">
                        <img src="icon/totuser.png" height="30px">
                    </div>
                </div>

                <div class="card">
                    <div>
                       <%                 			
                 
                 	       qry="select * from tbl_supplier";
                 	       int totsup=0;
                 	       totsup=cn.exeSelect(qry); 
                  
                  %>
                
                        <div class="numbers"><% out.print(totsup);%></div>
                        <div class="cardName">Total Supplier</div>
                    </div>
                    <div class="iconbox">
                        <img src="icon/totsupplier.png" height="30px">
                    </div>
                </div>
            </div>

            <div class="details">
                <div class="recentOrders">
                    <div class="cardHeader">
                        <h2>Recent Orders</h2>
                        <a href="adminProduct.jsp" class="btn">View All</a>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <td>Name</td>
                                <td>Price</td>
                                <td>Size</td>
                                <td>Quantity</td>
                            </tr>
                        </thead>
                        <tbody>
                        	<%
                     	
                          ResultSet rs1 = cn.getResultSet("select * from tbl_product  where category_id=1");
                 	        if(rs1!=null)
                 	        {
                 	        while (rs1.next()) 
                 	        {  %>
                 	        	<tr>
                                <td><% out.print(rs1.getString("name")); %></td>
                                <td><% out.print(rs1.getString("price")); %></td>
                                <td><% out.print(rs1.getString("size")); %></td>
                                <td><% out.print(rs1.getString("quantity")); %></td>
                               
                            	</tr>
                            	<% 
                 	        }
                 	        }
                 	                  			 
                		%>
                           
                        </tbody>
                    </table>
                </div>
                <div class="recentCustomers">
                    <div class="cardHeader">
                        <h2>Recent Customers</h2>
                    </div>
                    <table>
                        <tbody>
                       
                		<%

                	
                 			
                 	        ResultSet rs = cn.getResultSet("select * from tbl_user");  
                 	        while (rs.next()) 
                 	        {  %>
                 	        	 <tr>
                                 <td width="60px"><div class="imgBx"><img src="icon/img.png"></div></td>
                                 <td><h4><% out.print(rs.getString("user_name"));%></h4></td>
                            	 </tr>
                           <% }	
    	
                		}
					
                        %> 
                	
                        </tbody>
                    </table>
                </div>
            </div>
       
        </div>
    
    </div>

    <script>
        function toggleMenu(){
            let toggle=document.querySelector('.toggle');
            let navigation=document.querySelector('.navigation');
            let main=document.querySelector('.main');
            toggle.classList.toggle('active');
            navigation.classList.toggle('active'); 
            main.classList.toggle('active');
        }
    </script>
    
</body>
</html>