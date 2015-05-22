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
            fieldset
            {   border-style: dashed;
                border-color: black;
                border-width: 0.2px;
            }
            #com_cus_info
            {
                position: relative;
                left: 3%;
                top:0%;
                height: 100%;
                width: 50%;
                float:left;
                overflow-x: auto;
                overflow-y: auto;
                padding: 0%;
                opacity: 0.7;
            }
            p{
                text-align:center; 
            }
            #first_table{
                position: relative;
                left:10%;
                top:1%;
                width:80%;
                height: 100px;
                text-height: auto;
                font-size: 20px;    
                font-family: sans-serif;
            }
            #second_table{
                position: relative;
                left:10%;
                top:1%;
                width:80%;
                height:250px;
                text-height: auto;
                font-size: 20px;
                font-family: sans-serif;
            }
        </style>
        <script>
            function log() {
                if (!document.forms["myform"]["igree"].checked)
                {
                    alert('You have to CHECK checkbox!');
                }
                else
                    return true;
            }
            function validateForm() {
                var x = document.forms["myForm"]["uname"].value;
                var y = document.forms["myForm"]["pwd"].value;
                if (x == null || x == "" || y == null || y == "")
                {
                    document.getElementById('id3').innerHTML = "All filelds sholud be correctly filled out";
                    return false;
                }
            }

        </script>     
    </head>
    <body>
        <%
            String success = response.getHeader("su");

        %>
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
                            <%                                        String un = (String) session.getAttribute("user");

                                if (un != null) {
                            %>  
                        <li style="position: relative; left: 70%;"> <a href="../logoutServlet"> <input  style="background-color: buttonface; width: 100px;"type="button" value="Log Out">   </a> </li>
                                <%}%>
                    </ul>
                    </ul>
                </div><!--outline-->
            </div><!---header-->
            <div id="content"   >
                <div id="com_cus_info">
                    <form style="width: 500px;" name="myForm" action="../login" method="POST"  >
                        <fieldset  >
                            <legend><p style="font-family: sans-serif;">Customer Login Information</p></legend>
                            <table id="first_table">
                                <tr><td style="width:170px;" align="left">Username</td> <td><input  width="300px"  type="text"  name="uname"value="" required></td> </tr>
                                <tr>  <td align="left">Password</td><td><input type="password"  name="pwd"value="" required></td>   </tr>
                                <tr><td align="left"> </td> <td align="center"><input type="submit" value="Log In" ></td> </tr>
                            </table>
                        </fieldset>
                    </form>
                    <form  style="width: 500px;" name="myform" action="../register"  method="POST" onsubmit="if (document.getElementById('agree').checked) {
                                return true;
                            } else {
                                alert('Please indicate that you have \n\
read and agree to the Terms and Conditions and Privacy Policy');
                                return false;
                            }" >
                        <fieldset >
                            <legend> <p style=" font-family: sans-serif;">Customer Register Information</p></legend>
                            <table id="second_table">
                                <tr><td style="width:140px;"align="left">Name</td> <td><input id="id1" width="300px"  type="text"  name="ad"value=""  required></td> </tr>  
                                <tr><td align="left">Surname</td><td><input id="id2" type="text"  name="soyad"value="" required> </td>    </tr>
                                <tr><td align="left">Father Name</td> <td><input id="id3" type="text"  name="ataad"value="" required></td> </tr>  
                                <tr><td align="left">Age</td><td><input style="height: 20px;width: 175px;" id="id4" type="number"  name="age"value="" required></td>   </tr>
                                <tr><td align="left">ID</td> <td><input  style="height: 20px;width: 175px;" id="id5" type="number"  name="id"value=""  value="" required</td> </tr>
                                <tr><td align="left">Password</td> <td><input id="id6" type="password"   name="psw"value="" required></td> </tr>  
                                 <tr align="left"><td> <input type="checkbox" name="checkbox" value="check" id="agree" >I'm Agree</td> <td align="center"> <input  type="submit"  value="SUBMIT"  ></td> </tr>  
                            </table>
                        </fieldset>
                    </form>
                </div > <!--com_cus_info-->
                <div id="com_cus_info">
                    <form style="width: 500px;" name="myForm" action="../login_company" method="POST"   >
                        <fieldset >
                            <legend><p style=" font-family: sans-serif;">Company Login Information </p> </legend>
                            <table id="first_table">
                                <tr><td style="width:170px;" align="left">Username</td> <td><input  width="300px"  type="text"  name="uname"value="" required></td> </tr>
                                <tr><td align="left">Password</td><td><input type="password"  name="pwd"value="" required></td></tr>
                                <tr><td align="left"> </td> <td align="center"><input   type="submit" value="Log In" ></td> </tr>
                            </table>
                        </fieldset>
                    </form>
                    <form style="width: 500px;" action="../register_company"  method="POST" > <!--onsubmit="if (document.getElementById('agree').checked) {
                                            return true;
                                        } else {
                                            alert('Please indicate that you have \n\
                read and agree to the Terms and Conditions and Privacy Policy');
                                            return false;
                                        }" --> 
                        <fieldset >
                            <legend><p style="font-family: sans-serif;">Company Register Information </p> </legend>
                            <table id="second_table">
                                <tr><td style="width: 200px"align="left">Company Name</td> <td><input id="id1" width="300px"  type="text"  name="co_ad"value=""  required></td> </tr>  
                                <tr><td>Company type</td> <td > <select style="height: 25px;width: 180px;" name="company_type">
                                                                               <option value="technology">technology</option>
                                                                               <option value="mediacal">medical</option>
                                                                               <option value="government">government</option>
                                                                               <option value="industrial">industrial</option>
                                                               </select></td> </tr>
                                <tr><td align="left">Established year</td><td><input id="id2" type="text"  name="year"value="" required></td>   </tr>
                                <tr><td align="left">Email</td><td><input id="id2" type="text"  name="co_mail"value="" required></td>   </tr>
                                <tr><td align="left">ID</td> <td><input style="height: 20px;width: 175px;" id="id5" type="number"  name="co_id"value="" required ></td> </tr>
                                <tr><td align="left">Password</td> <td><input id="id6" type="password"  name="co_psw"value="" required></td> </tr>  
                                <tr align="left"><td> <input type="checkbox" name="checkbox" value="check" id="agree" >I'm Agree</td> <td align="center"> <input  type="submit"  value="SUBMIT"   ></td> </tr>
                                    
                            </table>
                        </fieldset>
                    </form>
                </div>  <!--com_cus_info-->
            </div> <!--content-->
            <div id="footer">
                &copy; 2015 Customer Satisfaction
            </div><!---footer-->
        </div><!---outer-->
    </body>
</html>
