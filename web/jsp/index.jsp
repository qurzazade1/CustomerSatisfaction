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



            #absolute_div{

                position: relative;
                left:2%;
                top:.5%;
                width: 96%;
                height: 6%;
                border: 1px solid black;
                background-color: azure;
                z-index: 1;
                border-radius: 10px;
                opacity: 0.5;
                color:white;
            }


            #absolute_div  p  {
                position: relative;
                top:-52%;
                padding-top: 0px;
               
                font-size: 20px;
                color:black;
                letter-spacing: 2px;
                font-style: italic;
            }
            table{
                position: relative;
                left:30%;
                margin-top:15%;
                width:500px;
                height:300px;
            }


            #content_inner_inner2{
                position: relative;
                width: 31.5%;
                height:33%;
                top: 2%;
                border-collapse: collapse;
                float:left;
                border:1px dotted activecaption;
                border-radius: 10px;
            }

            </style>
        </head>
        <body>
            <div id="outer">



                <div id="header">
                    <div id="images">
                          <img src='../html_and_css/images/cus_fac.jpeg' style="position: relative;top: 0px;left: 0px;width: 14%; height: 150%;"> 
                         <img src='../html_and_css/images/client.jpeg' style="position: absolute;top:0%; right:-0.5%;width: 86.5%; height: 100%;">
                         </div><!--images-->
                                  <div id="outline">
                    <ul>
                        <li> <a href="index.jsp">Main Page</a> </li>  &nbsp;
                 
                        <li>   <a href="about.jsp">About</a> </li> &nbsp;
                          <li> <a href="register.jsp">Register</a> </li> &nbsp;
                         
                         <%
                        String un = (String) session.getAttribute("user");

                        if (un != null) {
                    %>  
                      
                       <li style="position: relative; left: 60%;"> <a href="../logoutServlet"> <input  style="background-color: buttonface; width: 100px;"type="button" value="Log Out">   </a> </li>
                    
                       <%} else {
                    %>
                    
                    <li style="position: relative; left: 60%;"> <a href="register.jsp"> <input  style="background-color: buttonface; width: 100px;"type="button" value="Log In">   </a> </li>
                    


                    <%
                        }
                    %>

                    </ul>

                </div><!--outline-->
                    
                    
                    
                </div><!---header-->
                <%--

                <div id="menu" style="background-image: url(''); padding-top: 0px; height: 95.1%;width: 14%;">
                    <img src='../html_and_css/images/cus_fac.jpeg' style="position: relative;top: 0px;left: -15px;width: 106.8%; height: 18.8%;">
                    <a href="index.jsp">Main Page</a> <br>

                    <a href="about.jsp">About</a> <br> 

                    <%
                        String un = (String) session.getAttribute("user");

                        if (un != null) {
                    %>    
                    <form action="../logoutServlet" method="POST" >
                        <input type="submit" value="Log Out">
                    </form>

                    <%} else {
                    %>

                    <a href="register.jsp"> Customers</a> <br> 
                    <a href="register_company.jsp"> Companies</a> 


                    <%
                        }
                    %>


                    </ul>

                </div><!---menu-->

--%>

                <div id="content"  style="background-color: white;"> 







                    <div id="absolute_div" >
                        <p style="margin-left: 15px;font-size: 30px;letter-spacing: 2px;color:gray; font-family: sans-serif"> Partners of our corperation</p>
                        </div>



                        <div id="content_inner_inner2"  style="position: relative; top:2%;left: 2%;" >
                        <img src="../html_and_css/images/socar.jpeg" style=" border-bottom:  1px solid green;border-radius: 15px; position: relative;top: 1%;left: 1%; width: 92%;height: 78%;">
                        <p style="position: relative; top: -10%; text-align: center">Socar </p>

                        </div> <!-- content_inner_inner2-->

                        <div id="content_inner_inner2"  style="position: relative; top:2%;left: 2.5%;" >
                        <img src="../html_and_css/images/azercell.jpg" style=" border-bottom:  1px solid black;border-radius: 15px;position: relative;top: 1%;left: 1%; width: 92%;height: 78%;">
                        <p style="position: relative; top:-10%; text-align: center">Azercell </p>

                        </div> <!-- content_inner_inner2-->


                        <div id="content_inner_inner2"  style="position: relative; top:2%;left: 3%;" >
                        <img src="../html_and_css/images/nikoil.jpeg" style="position: relative;top: 1%;left: 1%; width: 92%;height: 78%;border-bottom:  1px solid blue;border-radius: 15px;">
                        <p style="position: relative; top:-10%; text-align: center">Nikoil </p>

                        </div> <!-- content_inner_inner2-->


                        <div id="content_inner_inner2"  style="position: relative; top:2.5%;left: 2%;" >
                        <img src="../html_and_css/images/palmali.jpg" style="position: relative;top: 1%;left: 1%; width: 92%;height: 78%;border-bottom:  1px solid green;border-radius: 15px;">
                        <p style="position: relative; top:-10%; text-align: center">Palmali </p>

                        </div> <!-- content_inner_inner2-->


                        <div id="content_inner_inner2"  style="position: relative; top:2.5%;left: 2.5%;" >
                        <img src="../html_and_css/images/bakcell.jpg" style="position: relative;top: 1%;left: 1%; width: 92%;height: 78%;border-bottom:  1px solid red;border-radius: 15px;">
                        <p style="position: relative; top:-10%; text-align: center">Bakcell </p>

                        </div> <!-- content_inner_inner2-->


                        <div id="content_inner_inner2"   style="position: relative; top:2.5%;left: 3%;">
                        <img src="../html_and_css/images/bankofbaku.jpg" style="position: relative;top: 1%;left: 1%; width: 92%;height: 78%;border-bottom:  1px solid blue;border-radius: 15px;">
                        <p style="position: relative; top:-10%; text-align: center">Bank of Baku </p>

                        </div> <!-- content_inner_inner2-->






                    </div> <!-- content -->   

                    <div id="footer" style="width: 100%">
                        &copy; 2015 Customer Satisfaction
                    </div><!---footer-->

                </div><!---outer-->
            </body>
        </html>




