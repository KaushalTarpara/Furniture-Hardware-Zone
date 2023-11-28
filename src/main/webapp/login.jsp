<%@page import="frm.DBConnection"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	
    pageEncoding="ISO-8859-1"  import="java.sql.*"   
     %>  
    
<!--     import="java.sql.*" import="com.mysql.jdbc.Connection"%> -->
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <title>Login Page</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
 </head>
<body   style="background-image:url('about-bg.jpg');  background-size:cover; height: 110%; background-position: center; background-repeat: no-repeat; ">
	<div class="container">
        <h2>Log In</h2>
        <form method="POST">
            <div class="inputbox">
                <input type="text" name="txtUser" required>
                <span>Username</span>
            </div>
            <div class="inputbox">
                <input type="password" name="txtPass" required>
                <span>Password</span>
            </div>
         
            <div class="inputbox">
                <input type="submit" value="submit" name="submit">                
            </div>
            <div class="error">
              <%
	DBConnection cn = new DBConnection(
		application.getInitParameter("MySQL_ConnString").toString(),
		application.getInitParameter("MySQL_User").toString(),
		application.getInitParameter("MySQL_Pass").toString(),
		application.getInitParameter("MySQL_Driver").toString()
		);
	
if(request.getParameter("submit")!=null)
{
		String u = request.getParameter("txtUser");
		String p = request.getParameter("txtPass");
		String QRY = "select * from tbl_user where ";
		QRY += " user_name = '"+ u +"' and ";
		QRY += " password = '"+ p +"' ";
		
		try {

			if (u != null) {

				if (cn.openConn()) {

					if(cn.exeQuery(QRY))
					{	
						ResultSet rsUI= cn.getResultSet(QRY);
						

															
								
								while(rsUI.next())
								{
								String userID = rsUI.getString("user_id");
								
							    session.setAttribute("userKey",userID);
								}
							 
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
					}else
					{ %>
						 
			            	<span>Sorry,You Are not a registered user! </span><br>
			            	<span>Please Create New Account First</span>
			           
					<%}
				}else{
					out.print("Connation not Done");
				}
			}

		} catch (Exception e) {
			out.print("Error is : " + e.toString());
		}
}
	%>
       </div>      
          <div >
            	<a href="UserReg.jsp">Create new Account</a> 
            </div>
            
        </form>
    </div>

	

</body>
</html>