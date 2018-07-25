<%-- 
    Document   : updatecableaction
    Created on : 10 Jul, 2018, 3:24:55 PM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update Page</title>
    </head>
    <body>
         <script>
           <%@ include file = "connection.jsp" %>
         </script>
         <%
        
             String segmentid = request.getParameter("segmentid");
             String segmenti = request.getParameter("segment");
             String bearers = request.getParameter("bearers");
             String cableid = request.getParameter("cableid");
             String cablename = request.getParameter("cablename");
             String color = request.getParameter("color");
             String startpoint = request.getParameter("startpoint");
             String [] sarr = startpoint.split(",", 2);
             String endpoint = request.getParameter("endpoint");
             String [] earr = endpoint.split(",", 2);
             String pointlength = request.getParameter("pointlength");

             System.out.println(segmentid);
             System.out.println(segmenti);
             System.out.println(bearers);
             System.out.println(cableid);
             System.out.println(cablename);
             System.out.println(color);
             System.out.println(startpoint);
             System.out.println(endpoint);
             System.out.println(pointlength);
try{   
        PreparedStatement stmt=conn.prepareStatement("update segment_path set segment_id=?,bearers=?,cable_id=?,color=?,cable_name=? where segment='"+segmenti+"' ");
        stmt.setString(1,segmentid);
        stmt.setString(2,bearers);
        stmt.setString(3,cableid);
        stmt.setString(4,color);
        stmt.setString(5,cablename);
        stmt.executeUpdate();
        System.out.println(stmt);
       
        stmt.close ();
}
catch (Exception e)
{
e.printStackTrace();
System.out.println(e);
}
finally{
    conn.close();
    response.sendRedirect("index.jsp");
}
%>
    </body>
</html>
