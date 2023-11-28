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
      %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<title>About Us</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" type="text/css" href="css/AboutUs.css">
</head>
   <body>
 <jsp:include page="UserNav.jsp" flush="true" />
   
      <%
      String qryA="select * from tbl_about";
      ResultSet rsA=cn.getResultSet(qryA);
      
      rsA.next();
   
      %>
      
      
      
      
        <div class="main center">
            <div class="box center">
                <img src="images/M3.JPG" alt="Worng">
                <div>
                    <p class="user_name">Sanjay Tarpara</p>
                    <p class="skill">Ovner Of AE</p>
                </div>

                <div class="arr_container center">
                    <img src="images/down.png" alt="Worng">
                </div>
            
                <div class="left_container off">
                    <p>Contect</p>
              
                    
                     <ul class="social_icon">

                        <li><a href="#"><img src="images/facebook.png" style="height: 33px; width: 33px;"></a></li>
                        <li><a href="#"><img src="images/insta.png" style="height: 33px; width: 33px;"></a></li>
                      
                            <li><a href="#"><img src="images/whatsapp.png" style="height: 33px; width: 33px;"></a></li>
                        
                        </ul>    
                  
            
                    <div class="cancel center">
                        <img src="images/Cansel.png" alt="Worng">
                    </div>
             
                </div>
            </div>
            
            <div class="discription">   <p><% out.print(rsA.getString("detail")); %> </p>
           
        </div>
		 
    
    </div>
       

    </body>

    <script >
        const clc = document.querySelector( ".cancel" );
const arr = document.querySelector(".arr_container");
const left_container = document.querySelector(".left_container");

arr.addEventListener("click", ()=>{
 arr.classList.add( "active_arr" );
if(left_container.classList.contains("off")){
    left_container.classList.remove("off");
    left_container.classList.add("active");
}
});

clc.addEventListener( "click", ()=>{
    arr.classList.remove("active_arr");
    if(left_container.classList.contains("active")){
    left_container.classList.remove("active");
    left_container.classList.add("off");
    }
});
    </script>
  
</html>



