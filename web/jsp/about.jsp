<%-- 
    Document   : index
    Created on : 15-Apr-2015, 20:29:33
    Author     : Sadig
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../html_and_css/CSS/general.css">

        <style>

        </style>
    </head>
    <body >
        <div id="outer">
        

              <div id="header">
                
                           
                    <div id="images">
                            <img src='../html_and_css/images/cus_fac.jpeg' style="position: relative;top: 0px;left: 0px;width: 14%; height: 150%;"> 
                         <img src='../html_and_css/images/client.jpeg' style="position: absolute;top:0%; right:-0.5%;width: 86.5%; height: 100%;">
                         </div><!--images-->
                <div id="outline">
                    <ul>
                        <li> <a href="index.jsp">Main Page</a> </li>  &nbsp;
                         
                        <li> <a href="about.jsp">About</a> </li> &nbsp;
                            <li> <a href="register.jsp">Register</a> </li> &nbsp;
                         
                        
                   
                       <%
                                String un = (String) session.getAttribute("user");

                        if (un != null) {
                    %>  
                      
                       <li style="position: relative; left: 60%;"> <a href="../logoutServlet"> <input  style="background-color: buttonface; width: 100px;"type="button" value="Log Out">   </a> </li>
                    
                       <%} 
                       
                       else
                        {
                                  %>
                        
                      <li style="position: relative; left: 60%;"> <a href="register.jsp"> <input  style="background-color: buttonface; width: 100px;"type="button" value="Log In">   </a> </li>
                           
                 
                       
                       
                       
                       <%}%>
                    </ul>
</ul>

                
                </div><!--outline-->
                  </div><!---header-->

                  <div id="content">


                <article style="margin-left: 15px; font-family: sans-serif; font-size: 20px;">
                    <h2>About Customer Guaranteed Satisfaction</h2>
                    <h3>What is CGS? </h3> <br> 

                    Customer Guaranteed Satisfaction (CGS) is the sole company in the world which provide real Satisfaction between companies and its clients. 
                    CGS is founded in  January 2015,  by three university students
                 <ul>
                     <li>  Ulduz Baghirova</li> 
                     <li> Polad Gulmammadli</li>  
                     <li>Sadig Rzazada</li>
</ul>
                    <h3> Our purpose </h3>
                    We take account all complaint, offer, satisfaction from clients that can be seen by related companies. After collecting, analyzing informations companies can be rated. 

                    <h3> We care for </h3>
                    Our customers by providing solution that are adapted to their needs
                    Each other by being supportive, respectful and honest

                </article>

            </div>   

            <div id="footer" style="width: 100%">
                &copy; 2015 Customer Satisfaction
            </div><!---footer-->

        </div><!---outer-->
    </body>
</html>




