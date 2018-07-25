<%-- 
    Document   : removecable
    Created on : 25 Jul, 2018, 12:28:33 PM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Cable</title>
    </head>
    <body>
        <script>
           <%@ include file = "connection.jsp" %>
         </script>
         <% 
             String cable=request.getParameter("cable");
               try{
            
        String driver1 = "com.mysql.jdbc.Driver";
	Class.forName(driver1).newInstance();
	Connection conn1;
	conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cable_path", "root","");
	Statement s = conn1.createStatement ();
	s.executeUpdate("DELETE FROM `segment_path` WHERE cable_name='"+cable+"';");
                  }
        catch (Exception e)
        {
          e.printStackTrace();
        }
        finally{
                response.sendRedirect("index.jsp");
               }
         %>
    </body>
</html>
