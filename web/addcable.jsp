<%-- 
    Document   : addcable
    Created on : 28 Jun, 2018, 12:40:23 PM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Cable</title>
        
    </head>
    <body>
        <script>
           <%@ include file = "connection.jsp" %>
       
</script>
 
<%
String segmentid = request.getParameter("segmentid");
String segment = request.getParameter("segment");
String bearers = request.getParameter("bearers");
String cableid = request.getParameter("cableid");
String cablename = request.getParameter("cablename");
String color = request.getParameter("color");
String startpoint = request.getParameter("startpoint");
String [] sarr = startpoint.split(",", 2);
String spointid = request.getParameter("spointid");
String spointname = request.getParameter("spointname");
String stype = request.getParameter("stype");
String endpoint = request.getParameter("endpoint");
String [] earr = endpoint.split(",", 2);
String epointid = request.getParameter("epointid");
String epointname = request.getParameter("epointname");
String etype = request.getParameter("etype");
String pointlength = request.getParameter("pointlength");

System.out.println(segmentid);
System.out.println(segment);
System.out.println(bearers);
System.out.println(cableid);
System.out.println(cablename);
System.out.println(color);
System.out.println(startpoint);
System.out.println(spointid);
System.out.println(spointname);
System.out.println(stype);
System.out.println(endpoint);
System.out.println(epointid);
System.out.println(epointname);
System.out.println(etype);

try{   
        PreparedStatement stmt=conn.prepareStatement("insert into segment_path (segment_id, segment, bearers, lat, lng, cable_id, landing_pt_id, point_name, typ, color, cable_name) values(?,?,?,?,?,?,?,?,?,?,?)");
        stmt.setString(1,segmentid);
        stmt.setString(2,segment);
        stmt.setString(3,bearers);
        stmt.setString(4,sarr[0]);
        stmt.setString(5,sarr[1]);
        stmt.setString(6,cableid);
        stmt.setString(7,spointid);
        stmt.setString(8,spointname);
        stmt.setString(9,stype);
        stmt.setString(10,color);
        stmt.setString(11,cablename);
        
        stmt.executeUpdate();
        System.out.println(stmt);
        
        for(int i=1;i<=Integer.parseInt(pointlength);i++){
            String point = request.getParameter("point"+i);
            String [] parr = point.split(",", 2);
            String pointid = request.getParameter("pointid"+i);
            String pointname = request.getParameter("pointname"+i);
            String type = request.getParameter("type"+i);
            System.out.println(parr[0]);
            System.out.println(parr[1]);
            stmt=conn.prepareStatement("insert into segment_path (segment_id, segment, bearers, lat, lng, cable_id, landing_pt_id, point_name, typ, color, cable_name) values(?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setString(1,segmentid);
            stmt.setString(2,segment);
            stmt.setString(3,bearers);
            stmt.setString(4,parr[0]);
            stmt.setString(5,parr[1]);
            stmt.setString(6,cableid);
            stmt.setString(7,pointid);
            stmt.setString(8,pointname);
            stmt.setString(9,type);
            stmt.setString(10,color);
            stmt.setString(11,cablename);

             stmt.executeUpdate();
            System.out.println(stmt);
            
            }
        stmt=conn.prepareStatement("insert into segment_path (segment_id, segment, bearers, lat, lng, cable_id, landing_pt_id, point_name, typ, color, cable_name) values(?,?,?,?,?,?,?,?,?,?,?)");
       	stmt.setString(1,segmentid);
        stmt.setString(2,segment);
        stmt.setString(3,bearers);
        stmt.setString(4,earr[0]);
        stmt.setString(5,earr[1]);
        stmt.setString(6,cableid);
        stmt.setString(7,epointid);
        stmt.setString(8,epointname);
        stmt.setString(9,etype);
        stmt.setString(10,color);
        stmt.setString(11,cablename);

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
response.sendRedirect("index1.jsp");
}
%>

</body>
</html>

