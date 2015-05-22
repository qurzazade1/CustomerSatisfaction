



<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%-- 
    Document   : index
    Created on : 15-Apr-2015, 20:29:33
    Author     : Sadig
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.customer.dbconnection.dbConnection"%>

<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="../html_and_css/CSS/general.css">

        <style>

            #com_cus_info
            {
                position: relative;
                left: 1%;
                top:1%;
              
                height: 98%;
                width: 48.4%;
                border-top: 1px black dashed;
                border-right: 1px black dashed;
                border-left: 1px black dashed;
                float:left;
                overflow-x: auto;
                overflow-y: auto;
                 font-size: 20px;
            }

            table{
                position: relative;
                width: 99%;
              
                //border: 1px solid black; 
                // border-collapse: collapse;





            }


        </style>

    </head>
    <body>
        <div id="outer">
            <div id="header" style="position: relative;left: 0%;background-size: 100% 99%;">
                    <div id="images">
                            <img src='../html_and_css/images/cus_fac.jpeg' style="position: relative;top: 0px;left: 0px;width: 14%; height: 150%;"> 
                         <img src='../html_and_css/images/client.jpeg' style="position: absolute;top:0%; right:12%;width: 74%; height: 100%;">
                         <img src='../html_and_css/images/Rzazada_Sadig.jpg' style="position: absolute;top:0%; right:0%;width: 12%; height: 130%;">
                         </div><!--images-->
                <div id="outline">
                    <ul>
                       <li> <a href="index.jsp">Main Page</a> </li> 
                       <li style="position: absolute;left: 38%;background-color: burlywood;letter-spacing: 10px;color:black;"> Rzazada Sadig  </li>
                       <li style="position: absolute; left: 90%;"> <a href="../logoutServlet"> <input  style="background-color: buttonface; width: 100px;"type="button" value="Log Out">   </a> </li>
                    </ul>
</ul>

                </div><!--outline-->
            </div><!---header-->
            <%--
            <div id="menu">


                <a href="index.jsp">Main Page</a> </br>

                <form action="../logoutServlet" method="POST">
                    <input type="submit" value="Log Out" >
                </form>




            </div><!---menu-->
            --%>            
<div id="content" style="font-size:30px;color:black; width: 100%;">
                <%
                    String un = (String) session.getAttribute("user");
                %>    


                <div id="com_cus_info">
                    <%! int company=0; %>
                    <h4>Company Information-<font style="color:greenyellow"> Total companies: &nbsp;<%=company%> </font></h4>
                    <hr>
                    <%
                        Statement s1 = null, s2 = null;
                        Connection con = null;
                        PreparedStatement p1, p2;
                        ResultSet resultset1 = null, resultset2 = null;
                        con = dbConnection.dbConnect();
                        String sql1 = "select * from company_info order by company_name";
                        String sql2 = "select * from customer_info order by c_id";
                        s1 = con.createStatement();
                        try {

                            resultset1 = s1.executeQuery(sql1);


                    %>

                    <table  cellpadding="4px">   
                        
                        <tr><th>Counter </th><th>Name </th><th>Type </th><th> Email</th> </tr>  
                        
                        <tr>
                            <%                            int k = 0;
                                while (resultset1.next()) {
                                    k++;
 company=k;
                            %>

                        <tr >   

                            <td style="width: 55px;"> <%=k%> </td>     
                            <td style="width: 120px;"> <%=resultset1.getString("company_name")%> </td> 
                            <td style="width:  100px;"> <%=resultset1.getString("company_type")%> </td> 

                            <td style="width: 100px;"> <%=resultset1.getString("mail")%> </td> 



                        </tr>      

                        <%
                                }
                            } finally {
                                if (resultset1 != null) {
                                    resultset1.close();
                                }
                                resultset1 = null;
                                if (s1 != null) {
                                    s1.close();
                                }
                                s1 = null;

                            }
                        %>

                    </table> 
                </div><!--cus_com_info-->

                <div id="com_cus_info" style="position: relative;left: 2%;">   
                    <%! int customer =0;%>
                    <h4>Customer Information-<font style="color:greenyellow">Total customers: &nbsp; <%=customer%></font> </h4>
                    <hr>
                    <table   cellpadding="4px">       
                         <tr><th>Counter </th> <th> ID</th><th>Name </th><th>Surname </th> </tr>
                        <%
                            try {
                                s2 = con.createStatement();
                                resultset2 = s2.executeQuery(sql2);
                                int k = 0;
                                while (resultset2.next()) {
                                    k++;
                                    customer =k;
                        %>


                        <tr >    

                            <td style="width: 55px;"> <%=k%> </td>
                            <td style="width: 100px;"> <%=resultset2.getString("c_id")%> </td> 
                            <td style="width: 100px;"> <%=resultset2.getString("first_name")%> </td> 
                            <td style="width: 100px;"> <%=resultset2.getString("last_name")%> </td> 



                        </tr>      

                        <%

                                }

                            } finally {
                                if (resultset2 != null) {
                                    resultset2.close();
                                }
                                s2 = null;
                                if (s2 != null) {
                                    s2.close();
                                }
                                s2 = null;

                            }


                        %>
                    </table> 
                </div><!--cus-com_info-->
            </div><!--content-->
            <div id="footer">
                &copy; 2015 Customer Satisfaction
            </div><!---footer-->

        </div><!---outer-->
    </body>
</html>
