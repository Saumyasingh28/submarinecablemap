<%-- 
    Document   : login
    Created on : 28 Jun, 2018, 11:49:27 AM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login System</title>
    </head>
 
    <body>
        <%
        String username=(String)session.getAttribute("username");
        
        //redirect user to home page if already logged in
        if(username!=null){
            response.sendRedirect("index.jsp");
        }
 
        String status=request.getParameter("status");
        
        if(status!=null){
            if(status.equals("false")){
                %> <script>window.alert("invalid details");</script> <%                       
            }
            else{
                out.print("Some error occurred!");
            }
        }
        %>
    <center>
        <form action="loginRequestHandler.jsp">
            <img src="download.jpg" alt="Tata Communications">
            <table cellpadding="5">
                <tr>
                    <td><b>Username:</b></td>
                    <td><input type="text" name="username" required/></td>
                </tr>
 
                <tr>
                    <td><b>Password:</b></td>
                    <td><input type="password" name="password" required/></td>
                </tr>
 
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Login"/></td>
                </tr>
 
            </table>
        </form>
    </center>
    </body>
</html>