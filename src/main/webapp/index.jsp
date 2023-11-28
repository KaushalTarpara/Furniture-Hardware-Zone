<%@page import="java.sql.*" %>
  <%@ page import="java.io.*,java.util.*" %>
    <%@page import="frm.DBConnection" %>
      <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

        <% DBConnection cn=new DBConnection( application.getInitParameter("MySQL_ConnString").toString(),
          application.getInitParameter("MySQL_User").toString(), application.getInitParameter("MySQL_Pass").toString(),
          application.getInitParameter("MySQL_Driver").toString() ); cn.openConn(); int totcp=0; String userId=(String)
          session.getAttribute("userKey"); String qryU="select * from tbl_user where user_id=" +userId; // String
          qryU="select * from tbl_user where user_id=" +session.getId(); ResultSet rsU=cn.getResultSet(qryU); %>
          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" type="text/css" href="css/index.css">
            <link rel="stylesheet" type="text/css" href="css/Footer.css">
            <link rel="shortcut icon" type="image/png" href="images/cromat.png">

            <title>Anjali Enterprice</title>

          </head>

          <body>

            <jsp:include page="UserNav.jsp" flush="true" />
            <main>
              <div class="container">

                <div class="slideshow-container">

                  <!-- Full-width images with number and caption text -->
                  <div class="mySlides fade">
                    <div class="numbertext">1 / 3</div>
                    <img src="images/b1.jpg" style="width:100%">
                    <div class="text">Best Brass Product</div>
                  </div>

                  <div class="mySlides fade">
                    <div class="numbertext">2 / 3</div>
                    <img src="images/b5.jpg" style="width:100%">
                    <div class="text">All Type of Finish</div>
                  </div>

                  <div class="mySlides fade">
                    <div class="numbertext">3 / 3</div>
                    <img src="images/b3.jpg" style="width:100%">
                    <div class="text">Wide Ranges of Products</div>
                  </div>

                  <!-- Next and previous buttons -->
                  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                  <a class="next" onclick="plusSlides(1)">&#10095;</a>
                </div>
                <br>

                <!-- The dots/circles -->
                <div style="text-align:center">
                  <span class="dot" onclick="currentSlide(1)"></span>
                  <span class="dot" onclick="currentSlide(2)"></span>
                  <span class="dot" onclick="currentSlide(3)"></span>
                </div>




                <div class="card">
                  <h2 class="my-2">Wide Ranges of Hinges</h2>
                  <div class="cards">
                    <% if(cn.openConn()) { ResultSet rs=cn.getResultSet("select * from tbl_product where category_id=1
                      LIMIT 5"); while(rs.next()) { %>
                      <div class="card-item">
                        <img src=<%out.print(rs.getString("image"));%> alt="Products_images" width="200px">
                        <div class="lines">
                          <p class="text-center my-1">
                            <% out.print(rs.getString("name"));%>
                          </p>
                          <p class="text-center my-1">
                            <%out.print(rs.getString("price"));%>
                          </p>
                          <a style="
									    color: #483740cf;
									    height: 50%;
									    padding: 6px 20px;
									    margin: 20%;
									    border-radius: 20px;
									    text-decoration: none;
									    background-color: #ae6fc6c9;" href="Product.jsp?pid=<%out.print(rs.getString(" product_id"));%>">Grub
                            now</a>

                        </div>
                      </div>
                      <% } } %>
                  </div>
                </div>



                <div class="card">
                  <h2 class="my-2 ">Wide Ranges of Towerbolt</h2>
                  <div class="cards tower">
                    <% if(cn.openConn()) { ResultSet rs=cn.getResultSet("select * from tbl_product where category_id=2
                      LIMIT 5"); while(rs.next()) { %>
                      <div class="card-item">
                        <img src=<%out.print(rs.getString("image"));%> alt="Products_images" width="200px">
                        <div class="lines">
                          <p class="text-center my-1">
                            <% out.print(rs.getString("name"));%>
                          </p>
                          <p class="text-center my-1">
                            <%out.print(rs.getString("price"));%>
                          </p>
                          <a style="
									    color: white;
									    height: 50%;
									    padding: 6px 20px;
									    margin: 20%;
									    border-radius: 20px;
									    text-decoration: none;
									    background-color: blue;" href="Product.jsp?pid=<%out.print(rs.getString(" product_id"));%>">Grub now</a>

                        </div>
                      </div>
                      <% } } %>
                  </div>
                </div>




                <div class="card" style="margin-bottom: 130px;">
                  <h2 class="my-2">Wide Ranges of Hooks</h2>
                  <div class="cards">
                    <% if(cn.openConn()) { ResultSet rs=cn.getResultSet("select * from tbl_product where category_id=3
                      LIMIT 5"); while(rs.next()) { %>
                      <div class="card-item">
                        <img src=<%out.print(rs.getString("image"));%> alt="Products_images" width="200px">
                        <div class="lines">
                          <p class="text-center my-1">
                            <% out.print(rs.getString("name"));%>
                          </p>
                          <p class="text-center my-1">
                            <%out.print(rs.getString("price"));%>
                          </p>
                          <a style="
									    color: #483740cf;
									    height: 50%;
									    padding: 6px 20px;
									    margin: 20%;
									    border-radius: 20px;
									    text-decoration: none;
									    background-color: #ae6fc6c9;" href="Product.jsp?pid=<%out.print(rs.getString(" product_id"));%>">Grub
                            now</a>
                        </div>
                      </div>
                      <% } } %>
                  </div>
                </div>



              </div>
            </main>



            <footer>

              <div class="waves">
                <div class="wave" id="wave1"></div>
                <div class="wave" id="wave2"></div>
                <div class="wave" id="wave3"></div>
                <div class="wave" id="wave4"></div>
              </div>

              <ul class="social_icon">

                <li><a href="#"><ion-icon name="logo-facebook"></ion-icon></a></li>
                <li><a href="#"><ion-icon name="logo-twitter"></ion-icon></a></li>
                <li><a href="#"><ion-icon name="logo-linkedin"></ion-icon></a></li>
                <li><a href="#"><ion-icon name="logo-instagram"></ion-icon></a></li>

              </ul>
              <ul class="menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="AboutUs.jsp">About</a></li>

                <li><a href="ContectUs.jsp">Contact</a></li>
              </ul>
              <p>@2022 KdCoder | All Rights Reserved</p>
              <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
              <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
            </footer>

          </body>

          <script type="text/javascript">
            var slideIndex = 0;
            showSlides(slideIndex);

            function plusSlides(n) {
              showSlides(slideIndex += n);
            }

            // Thumbnail image controls
            function currentSlide(n) {
              showSlides(slideIndex = n);
            }

            function showSlides() {
              var i;
              var slides = document.getElementsByClassName("mySlides");
              for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
              }
              slideIndex++;
              if (slideIndex > slides.length) { slideIndex = 1 }
              slides[slideIndex - 1].style.display = "block";
              setTimeout(showSlides, 10000); // Change image every 10 seconds
            }
          </script>

          </html>