<%@page import="frm.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DBConnection cn = new DBConnection(
		application.getInitParameter("MySQL_ConnString").toString(),
		application.getInitParameter("MySQL_User").toString(),
		application.getInitParameter("MySQL_Pass").toString(),
		application.getInitParameter("MySQL_Driver").toString());

cn.openConn();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<link rel="stylesheet" type="text/css" href="css/ContactUs.css">
</head>
<body>


<jsp:include page="UserNav.jsp" flush="true" /> 
<div class="contain">

  <div class="wrapper">

    <div class="form">
      <h4>GET IN TOUCH</h4>
      <h2 class="form-headline">Send us a message</h2>
      <form id="submit-form" action="" method="POST">
        <p>
          <input id="name" class="form-input" type="text" name="name" placeholder="Your Name*">
          <small class="name-error"></small>
        </p>
        <p>
          <input id="email" class="form-input" type="email" name="email" placeholder="Your Email*">
          <small class="name-error"></small>
        </p>
        <p class="full-width">
          <input id="contact_us" class="form-input" type="text" name="contectno"placeholder="Contact No*" required>
          <small></small>
        </p>
        <p class="full-width">
          <textarea  minlength="20" id ="message" name="detail" cols="30" rows="7" placeholder="Your Message*" required></textarea>
          <small></small>
        </p>
        
        <p class="full-width">
          <input type="submit" name="submit" class="submit-btn" value="Submit" onclick="checkValidations()">
          
	
          <button class="reset-btn" onclick="reset()">Reset</button>
          	<%		          
	            if(request.getParameter("submit")!=null)
				{
				String  name=request.getParameter("name");
				String  email=request.getParameter("email");
				String  cno=request.getParameter("contectno");
				String  detail=request.getParameter("detail");
				
				 String qryI="insert into tbl_contactus (`name`, `email`, `contact_no`,`detail`) values";
				 		qryI+="('"+name+"','"+email+"',"+cno+",'"+detail+"')";
				 		
				 	if(cn.exeUpdate(qryI))
				 	{
				 		%>
				 		<h3 style="margin:20px;">Your message is Send</h3>
				 		<%
				 	}
				 		
				}
		%>
        </p>
      </form>
    </div>

    <div class="contacts contact-wrapper">

      <ul>
      
        <span class="hightlight-contact-info">
          <li class="email-info"><i class="fa fa-envelope" aria-hidden="true"></i> anjalienterprice01@gmail.com</li>
          <li><i class="fa fa-phone" aria-hidden="true"></i> <span class="highlight-text">
           <a href="tel:+9924385642">Call As</a></span></li>
        </span>
      </ul>
    </div>
  </div>
</div>
</body>
<script>
const nameEl = document.querySelector("#name");
const emailEl = document.querySelector("#email");
const companyNameEl = document.querySelector("#contact_us");
const messageEl = document.querySelector("#message");

const form = document.querySelector("#submit-form");

function checkValidations() {
  let letters = /^[a-zA-Z\s]*$/;
  const name = nameEl.value.trim();
  const email = emailEl.value.trim();
  const companyName = companyNameEl.value.trim();
  const message = messageEl.value.trim();
  if (name === "") {
     document.querySelector(".name-error").classList.add("error");
      document.querySelector(".name-error").innerText =
        "Please fill out this field!";
  } else {
    if (!letters.test(name)) {
      document.querySelector(".name-error").classList.add("error");
      document.querySelector(".name-error").innerText =
        "Please enter only characters!";
    } else {
      
    }
  }
  if (email === "") {
     document.querySelector(".name-error").classList.add("error");
      document.querySelector(".name-error").innerText =
        "Please fill out this field!";
  } else {
    if (!letters.test(name)) {
      document.querySelector(".name-error").classList.add("error");
      document.querySelector(".name-error").innerText =
        "Please enter only characters!";
    } else {
      
    }
  }
}

function reset() {
  nameEl = "";
  emailEl = "";
  companyNameEl = "";
  messageEl = "";
  document.querySelector(".name-error").innerText = "";
}

</script>
</html>