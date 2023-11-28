
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

String userId= (String) session.getAttribute("userKey");
String pid=request.getParameter("pid");
String qryP="select * from tbl_product p,tbl_category c,tbl_subcategory s where"; 
		qryP+="	p.category_id=c.category_id and ";
		qryP+="	p.subcat_id=s.subcategory_id and ";
		qryP+="	product_id="+pid;

ResultSet rsP=cn.getResultSet(qryP);

String qryU="select * from tbl_user where user_id="+userId;
//String qryU="select * from tbl_user where user_id="+session.getId(); 
ResultSet rsU=cn.getResultSet(qryU);

rsP.next();
        

%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="ISO-8859-1">
<title><%out.print(rsP.getString("name"));%></title>

   <link rel="stylesheet" type="text/css" href="css/index.css">
 
	<link href="css/Product.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	
.fa-cart-plus{
  background:#0652DD;
}

.addtocart{
  display:block;
  padding:0.5em 1em 0.5em 1em;
  border-radius:100px;
  margin-left:30px;
  border:none;
  font-size:1.5em;
  position:relative;
  background:#0652DD;
  cursor:pointer;
  height:2em;
  width:8em;
  overflow:hidden;
  transition:transform 0.1s;
  z-index:1;
}
.addtocart:hover{
  transform:scale(1.1);
}
.pretext{
  color:#fff;
  background:#0652DD;
  position:absolute;
  top:0;
  left:0;
  height:100%;
  width:100%;
  display:flex;
  justify-content:center;
  align-items:center;
  font-family: 'Quicksand', sans-serif;
}
i{
  margin-right:10px;
}
.done{
  background:#be2edd;
  position:absolute;
  width:100%;
  top:0;
  left:0;
  transition:transform 0.3s ease;

  transform:translate(-110%) skew(-40deg);
}
.posttext{
  background:#be2edd;
}
.fa-check{
  background:#be2edd;
}
	</style>
</head>

<body>
  <%
RequestDispatcher rd = request.getRequestDispatcher("UserNav.jsp");
rd.include(request, response);


%>

<form method="get">
 <div class="wrapper">
    <div class="product-img">
      <img src=<%out.print(rsP.getString("image")); %> height="420" width="427">
    </div>
    <div class="product-info">
      <div class="product-text">
        
        <h1><%out.print(rsP.getString("name")); %></h1><br>
        <h2>Size : <%out.print(rsP.getString("size")); %></h2>
         <h2>Category : <%out.print(rsP.getString("category_name")); %></h2>
         <h2>Sub Category : <%out.print(rsP.getString("subcat_name")); %></h2>
        <p> <%out.print(rsP.getString("description")); %></p>
        <h2 style="font-size: 40px; margin-top: 20px;"><span>Rs.<%out.print(rsP.getString("price")); %> </span></h2>
      
        <input type="hidden" name="pid" value="<%out.print(request.getParameter("pid"));%>">
  		
  		<button type="submit" name="addtocart" class="addtocart">
		  <div class="pretext">
		    <i class="fas fa-cart-plus"></i> ADD TO CART
		  </div>
		  
		  <div class="pretext done">
		    <div class="posttext"><i class="fas fa-check"></i> ADDED</div>
		  </div>
		  
		</button>		
 			
         
            <%  if(request.getParameter("addtocart")!=null)
{
  					rsU.next();
	String uid=rsU.getString("user_id");
	String prid=rsP.getString("product_id");
	String pname=rsP.getString("name");
	String ppri=rsP.getString("price");
	String pimage=rsP.getString("image");	
	String pqun="1";
	String psize=rsP.getString("size");
	int tot=Integer.parseInt(ppri) * Integer.parseInt(pqun);
	 java.sql.Date Cdate = new java.sql.Date(System.currentTimeMillis());       
			
	String qryAtc="INSERT INTO `tbl_addtocart`(`user_id`, `pro_id`, `pro_name`, `pro_price`, `image`, `quantity`, `size`, `totle`, `date`) VALUES "; 
			qryAtc+="('"+uid+"','"+prid+"','"+pname+"',";
			qryAtc+="'"+ppri+"','"+pimage+"','"+pqun+"',";
			qryAtc+="'"+psize+"','"+tot+"','"+Cdate+"')";
			
	if(cn.exeUpdate(qryAtc))
	{
		%><p style="margin-top: 10px; color:red; font-size: 20px;">Your item is add in cart</p><%
	}else
	{
		 %><p  style="margin-top: 10px; color:red; font-size:20px;">Your item is not add in cart</p><%
	}
			
}
  %>         
       
      </div>
    </div>
  </div></form>
</body>
<script type="text/javascript">
const button = document.querySelector(".addtocart");
const done = document.querySelector(".done");
console.log(button);
let added = false;
button.addEventListener('click',()=>{
  if(added){
    done.style.transform = "translate(-110%) skew(-40deg)";
    added = false;
  }
  else{
    done.style.transform = "translate(0px)";
    added = true;
  }
    
});
</script>

</html>



