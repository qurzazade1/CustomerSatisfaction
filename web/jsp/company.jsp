<%-- 
    Document   : index
    Created on : 15-Apr-2015, 20:29:33
    Author     : Sadig
--%>

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
#inner
{
 position: relative;
 height: auto;
 width:auto;
    
    
    
    
}
textArea{
   height: 120px; 
    
}

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
                         
                              
         <li style="position: relative; left: 77%;"> <a href="../logoutServlet"> <input  style="background-color: buttonface; width: 100px;"type="button" value="Log Out">   </a> </li>
                    
               

                        
                      
                       
                   
                    </ul>
</ul>

                
                </div><!--outline-->
                  </div><!---header-->

                  <div id="content">

   
<div id="customer_complain_request">
    <p style="color:red;"> User complaints  </p>             
                    <%
                        Statement s1 = null, s2 = null;
                        Connection con = null;
                        PreparedStatement p1, p2;
                        String com_user_id=(String)session.getAttribute("user_id");
                        
                        ResultSet resultset1 = null, resultset2 = null;
                        con = dbConnection.dbConnect();
                        String sql1 = "select * from customer_complain where company_name=(select company_name from company_info where c_id='"+com_user_id+"' )";
                        String sql2 = "select * from customer_request where company_name=(select company_name from company_info where c_id='"+com_user_id+"' ) ";
                        s1 = con.createStatement();
                
                        
                        try {

                            resultset1 = s1.executeQuery(sql1);
                       
                                while (resultset1.next()) {
                                    
                            %>
<div id="inner">
   
                               <table  cellpadding="4px" style="color: red; position: relative;left:1%;width: 400px;">       
                        
                        <tr>
                            <td style="width:  200px;">Compalin type </td>
                        
 
                            <td style="width:  200px;"> <%=resultset1.getString("complain_type")%> </td> 


                            

                    </table> 

                        </tr>      

                        <textarea  disabled style=" position: relative;width:400px;left:2%;">

<%=resultset1.getString("textarea")%>
                        </textarea>
                        
  </div> <!--inner-->                      
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


               
                
                
                
                
                
               
</div><!--customer-complain_request-->

<div id="customer_complain_request" style="border-right: none;">
    <p style="color:green;"> User requests  </p>             
                    <%
                        con = dbConnection.dbConnect();
                   
                        s2 = con.createStatement();
                        try {

                            resultset2 = s2.executeQuery(sql2);

                                while (resultset2.next()) {
                                    
                            %>
<div id="inner">
                               <table  cellpadding="4px" style="color: green; position: relative;left:1%;">       
                        
                        <tr>
                            <td style="width:  200px;">Request type </td>
                        
 
                            <td style="width:  200px;"> <%=resultset2.getString("request_type")%> </td> 

                            

                    </table> 

                        </tr>      

                        <textarea  disabled style=" position: relative;width:400px;left:2%;" >

<%=resultset2.getString("textarea")%>
                        </textarea>
                        
  </div> <!--inner-->                      
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


               
                
                
                
                
                
               
</div><!--customer-complain_request-->
            </div> <!--content-->  

            <div id="footer" style="width: 100%">
                &copy; 2015 Customer Satisfaction
            </div><!---footer-->

        </div><!---outer-->
    </body>
</html>




