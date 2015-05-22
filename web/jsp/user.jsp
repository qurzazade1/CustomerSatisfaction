<%-- 
    Document   : index
    Created on : 15-Apr-2015, 20:29:33
    Author     : Sadig
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.customer.dbconnection.dbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../html_and_css/CSS/general.css">

        <style>



            #customer_complain_request  {
                position: relative;
                left: 1%;
                top:1%;

                height: 97%;
                width: 48.4%;
             
                border-right: 1px black dotted;
              
                float:left;
                overflow-x: auto;
                overflow-y: auto;
                font-size: 20px;
            }
            textArea
            {position: absolute;
             left:11%;
             width: 60%;
             height: 50%;


            }
            table{
                position: absolute;
                width: 70%;
                position: relative;
                left:10%;
                //border: 1px solid black; 
                // border-collapse: collapse;





            }
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


                        <li style="position: relative; left:77%;"> <a href="../logoutServlet"> <input  style="background-color: buttonface; width: 100px;"type="button" value="Log Out">   </a> </li>







                    </ul>
                    </ul>


                </div><!--outline-->
            </div><!---header-->

            <div id="content">


                <%
                    String un = (String) session.getAttribute("user");

                %>    
                <div id="customer_complain_request">

                    <p>Welcome  <%=un%></p> 
                    <form action="../complain_insert" method="POST">
                        <table >
                            <tr > <td>User ID </td> <td> <input type="text" name="userid"> </td> </tr>

                            <tr> <td>Complain type </td> 
                                <td>   <select name="complaintype" style="width:81%;">      
                                        <option value="Construction">Construction  </option> 
                                        <option value="Disputed Bill"> Disputed Bill  </option> 
                                        <option value="Deposit"> Deposit </option> 
                                        <option value="Disconnect"> Disconnect </option> 
                                        <option value="Customer Service"> Customer Service </option> 
                                        <option value="Delayed Service">Delayed Service  </option> 
                                        <option value="Quality of Service">Quality of Service  </option>  
                                        <option value="Network Congestion"> Network Congestion </option>   
                                        <option value="Prepaid"> Prepaid </option> 
                                        <option value="Refusal of Service"> Refusal of Service</option> 
                                        <option value="Slamming">Slamming </option> 

                                    </select>  </td>
                            </tr>
                            <tr>  <td> Company name  </td>  
                                <td>  <select name="companyname" style="width:81%;"> 

                                        <%
                                            ArrayList<String> companyname = new ArrayList<>();
                                            ArrayList<String> customername = new ArrayList<>();
                                            Statement s1 = null;
                                            Connection con = null;
                                            PreparedStatement p1, p2;
                                            ResultSet resultset1 = null;
                                            con = dbConnection.dbConnect();
                                            String sql1 = "select * from company_info order by company_name";

                                            s1 = con.createStatement();
                                            try {

                                                resultset1 = s1.executeQuery(sql1);

                                                while (resultset1.next()) {

                                        %>




                                        <option value="<%=resultset1.getString("company_name")%>">  <%=resultset1.getString("company_name")%> </option> 






                                        <%
                                                    companyname.add(resultset1.getString("company_name"));

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





                                </td> 
                                </select>

                                </td>

                            </tr>

                        </table>


                        <textarea  name="textarea">    

                        </textarea>

                        <br>
                        <input type="submit" value="Submit" style="position: absolute;top:73%; left: 56%;">

                    </form>    



                </div> <!--customer_complain_div-->


                <div id="customer_complain_request" style="position: relative;left: 2%; border-right: none;">

                    <p>Thanks for your feedback</p> 
                    <form action="../request_insert" method="POST">
                        <table >
                            <tr > <td>User ID </td> <td> <input type="text" name="userid"> </td> </tr>

                            <tr> <td>Request type </td> 
                                <td>   <select name="requesttype" style="width:81%;">      
                                        <option value="Construction">Construction  </option> 
                                        <option value="Disputed Bill"> Disputed Bill  </option> 
                                        <option value="Deposit"> Deposit </option> 
                                        <option value="Disconnect"> Disconnect </option> 
                                        <option value="Customer Service"> Customer Service </option> 
                                        <option value="Delayed Service">Delayed Service  </option> 
                                        <option value="Quality of Service">Quality of Service  </option>  
                                        <option value="Network Congestion"> Network Congestion </option>   
                                        <option value="Prepaid"> Prepaid </option> 
                                        <option value="Refusal of Service"> Refusal of Service</option> 
                                        <option value="Slamming">Slamming </option> 

                                    </select>  </td>
                            </tr>
                            <tr>  <td> Company name  </td>  
                                <td>  <select name="companyname" style="width:81%;"> 

                                        <%
                                            for (int i = 0; i < companyname.size(); i++) {
                                        %>

                                        <option value="<%=companyname.get(i)%>"><%=companyname.get(i)%> </option>>
                                        <%

                                            }


                                        %>






                                </td> 
                                </select>

                                </td>

                            </tr>

                        </table>


                        <textarea  name="textarea">    
  




                        </textarea>

                        <br>
                        <input type="submit" value="Submit" style="position: absolute;top:73%; left: 56%;">

                    </form>    



                </div> <!--customer_complain_div-->





            </div><!--content-->   

            <div id="footer" style="width: 100%">
                &copy; 2015 Customer Satisfaction
            </div><!---footer-->

        </div><!---outer-->
    </body>
</html>




