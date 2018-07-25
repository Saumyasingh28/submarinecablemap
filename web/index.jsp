<%-- 
    Document   : index
    Created on : 24 Apr, 2018, 2:57:55 PM
    Author     : gaurav
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>  <%@ page import="java.io.*" %>
   <%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDF4xc24ce0hMfmjiTdtDhDhuH0b9fvs5c&sensor=false"></script>

        <title>Cable Path</title>
        <style>
            #abc{
                text-align: right;
                color: blue;
            } 
            #abc1{
                text-align: right;
                color: blue;
            } 
            table {
              border-collapse: collapse;
            }

            table, th, td {
               border: 1px solid black;
            }
            tr:hover {background-color: #f5f5f5;}
        </style>
    </head>
    <body>
         <%
        String username=(String)session.getAttribute("username");
        
        //redirect user to login page if not logged in
        if(username==null){
            response.sendRedirect("login.jsp");
        }
        %>    
       
        <form action="index.jsp" method="post" id="abc">
           <select name="cablename">
               <option value="">Select Option</option>
               <option value="All">ALL CABLES</option>
               <option value="IMEWE">IMEWE</option>
               <option value="APCN-2">APCN-2</option>
               <option value="BBG">BBG</option>
               <option value="FASTER">FASTER</option>
               <option value="TGN-Atlantic">TGN-Atlantic</option>
           </select>
           <input type="submit" value="DISPLAY" />
        </form>   
        
        <table cellpadding="10"><tr>
                <td bgcolor="lightgrey"><a href="logout.jsp" style="text-align: right" >Logout</a></td>
                <td bgcolor="lightgreen"><a href="index1.jsp" style="text-align: left" >Add Cable</a></td>
        </tr>
        </table>
        
         <form action="updatecable.jsp" method="post" id="abc1">
           <select name="segment">
               <option value="">Select Option</option>
               <option value="S4 C">S4 C</option>
               <option value="S8 A">S8 A</option>
               <option value="S8 B">S8 B</option>
               <option value="S8 C">S8 C</option>
               <option value="S3">S3</option>
               <option value="S7">S7</option>
               <option value="S5">S5</option>
           </select>
           <input type="submit" value="Update Cable" />
        </form> 
        <form action="removecable.jsp" method="post" id="r">
           <select name="cable">
               <option value="">Select Option</option>
               <option value="IMEWE">IMEWE</option>
               <option value="APCN-2">APCN-2</option>
               <option value="BBG">BBG</option>
               <option value="ABC">ABC</option>
               
           </select>
           <input type="submit" value="Remove Cable" />
        </form> 
        <div id="googleMap" style="width:1320px;height:610px;"></div>
  <script type="text/javascript">

var mapProp = {
        center: new google.maps.LatLng(28.360012, 77.031527),
        zoom: 2,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
 

function start(arr,arr1,arr2,color,arr3,arr4){


var flightPlanCoordinates=new Array();
var z=color;
var contentString ='<font color="purpal"><b>Segment : </b></font>' +arr1[0]+ '<br /> '+
                   '<font color="purpal"><b>Bearers : </b></font>' +arr2[0] + '<br /> '+
                   '<font color="purpal"><b>Start Point Name : </b></font>' +arr4[0] + '<br /> '+
                   '<font color="purpal"><b>End Point Name : </b></font>' +arr4[arr4.length-1] + '<br /> '+
                   '<font color="purpal"><b>Type : </b></font>' +arr3[0] + '<br /> ';

var contentStringa='<font color="purpal"><b>Segment : </b></font>' +arr1[0]+ '<br /> '+
                   '<font color="purpal"><b>Bearers : </b></font>' +arr2[0] + '<br /> '+
                   '<font color="purpal"><b>Start Point Name : </b></font>' +arr4[0] + '<br /> '+
                   '<font color="purpal"><b>End Point Name : </b></font>' +arr4[arr4.length-1] + '<br /> '+
                   '<font color="purpal"><b>Type : </b></font>' +arr3[0] + '<br /> ';
var contentStringb ='<font color="purpal"><b>Segment : </b></font>' +arr1[0]+ '<br /> '+
                   '<font color="purpal"><b>Bearers : </b></font>' +arr2[0] + '<br /> ';

for (var x = 0; x < arr.length; x++){
var y=arr3[x];

if(y=='LP'){
    var image = {url: 'http://maps.google.com/mapfiles/kml/paddle/grn-blank-lv.png',
                    // This marker is 20 pixels wide by 32 pixels high.
                    size: new google.maps.Size(16, 16),
                    // The origin for this image is (0, 0).
                    origin: new google.maps.Point(0, 0),
                    // The anchor for this image is the base of the flagpole at (0, 32).
                    anchor: new google.maps.Point(8, 8)
            };
                var marker = new google.maps.Marker({
                position:arr[x],
                icon:image,
                map: map
                });
                var infowindow = new google.maps.InfoWindow({
                    content: contentString
                        });

              google.maps.event.addListener(marker, 'click', function() {
                   infowindow.open(map,marker);
                        });
           }
else if(y=='BU')
         {
             var image = {url: 'http://maps.google.com/mapfiles/dir_0.png',
                    // This marker is 20 pixels wide by 32 pixels high.
                    size: new google.maps.Size(24, 24),
                    // The origin for this image is (0, 0).
                    origin: new google.maps.Point(0, 0),
                    // The anchor for this image is the base of the flagpole at (0, 32).
                    anchor: new google.maps.Point(12, 12)
            };

            var marker = new google.maps.Marker({
            position:arr[x],
            icon:image,
            map: map
                });
                var infowindow = new google.maps.InfoWindow({
                    content: contentStringa
                        });

              google.maps.event.addListener(marker, 'click', function() {
                   infowindow.open(map,marker);
                        });
                
       }
 else {
            var marker = new google.maps.Marker({
                position:arr[x],
                map: map
                });
                marker.setVisible(false);
      }


flightPlanCoordinates.push(marker.getPosition());

var flightPath=new google.maps.Polyline({
        path:flightPlanCoordinates,
       txt:contentString,
        strokeColor:z,
        strokeOpacity:0.8,
        strokeWeight:3
    });
    flightPath.setMap(map);

     var infowindow1 = new google.maps.InfoWindow({
        content: ""
    });

   google.maps.event.addListener(flightPath, "click", function (e) {
   infowindow1.setPosition(e.latLng);
   infowindow1.setContent(contentStringb); //you accidently reuse the last txt here
   infowindow1.open(map);
   setTimeout(function () { infowindow1.close(); }, 5000);
});
}
}

<%
String cn=request.getParameter("cablename");
if("All".equals(cn)){
try{
        String driver = "com.mysql.jdbc.Driver";
	Class.forName(driver).newInstance();
	Connection conn;
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cable_path", "root","");
	Statement s = conn.createStatement ();
	s.executeQuery ("select distinct segment_id,color from segment_path order by sl");
	ResultSet rs = s.getResultSet ();
        while(rs.next())
        {
            String segment_id = rs.getString ("segment_id");
            String color = rs.getString ("color");
            try{
                    Statement s1 = conn.createStatement ();
                    s1.executeQuery ("select lat,lng,segment,bearers,typ,point_name from segment_path where segment_ID="+segment_id+" order by sl;");
                    ResultSet rs1 = s1.getResultSet ();
                    out.print("var arr=new Array();");
                    out.print("var arr1=new Array();");
                    out.print("var arr2=new Array();");
                    out.print("var arr3=new Array();");
                    out.print("var arr4=new Array();");
                    
            while(rs1.next())
                {
                    String lat = rs1.getString ("lat");
                    String lng = rs1.getString ("lng");
                    String bearers = rs1.getString ("bearers");
                    String segment=rs1.getString ("segment");
                    String typ=rs1.getString ("typ");
                    String point_name=rs1.getString ("point_name");
                    

                    out.print("var point = new google.maps.LatLng("+lat+","+lng+");\n");
                    out.print("var segment='"+segment+"';");
                    out.print("var bearers='"+bearers+"';");
                    out.print("var typ='"+typ+"';");
                    out.print("var point_name='"+point_name+"';");
                    out.print("arr.push(point);");
                    out.print("arr1.push(segment);");
                    out.print("arr2.push(bearers);");
                    out.print("arr3.push(typ);");
                    out.print("arr4.push(point_name);");

                }

rs1.close ();
s1.close ();
}
catch (Exception e)
{
e.printStackTrace();
}
out.print("var color='"+color+"';");
out.print("start(arr,arr1,arr2,color,arr3,arr4);");
}
rs.close ();
s.close ();
}
catch (Exception e)
{
  e.printStackTrace();
}
}

else if(cn==null){
    
}
else{
    try{
        String driver = "com.mysql.jdbc.Driver";
	Class.forName(driver).newInstance();
	Connection conn;
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cable_path", "root","");
	Statement s = conn.createStatement ();
	s.executeQuery ("select distinct segment_id,color from segment_path where cable_name='"+cn+"' order by sl");
	ResultSet rs = s.getResultSet ();
        while(rs.next())
        {
            String segment_id = rs.getString ("segment_id");
            String color = rs.getString ("color");
            try{
                    Statement s1 = conn.createStatement ();

                    s1.executeQuery ("select lat,lng,segment,bearers,typ,point_name from segment_path where segment_ID="+segment_id+" and cable_name='"+cn+"' order by sl;");
                    ResultSet rs1 = s1.getResultSet ();
                    out.print("var arr=new Array();");
                    out.print("var arr1=new Array();");
                    out.print("var arr2=new Array();");
                    out.print("var arr3=new Array();");
                    out.print("var arr4=new Array();");
                    
            while(rs1.next())
                {
                    String lat = rs1.getString ("lat");
                    String lng = rs1.getString ("lng");
                    String bearers = rs1.getString ("bearers");
                    String segment=rs1.getString ("segment");
                    String typ=rs1.getString ("typ");
                    String point_name=rs1.getString ("point_name");

                    out.print("var point = new google.maps.LatLng("+lat+","+lng+");\n");
                    out.print("var segment='"+segment+"';");
                    out.print("var bearers='"+bearers+"';");
                    out.print("var typ='"+typ+"';");
                    out.print("var point_name='"+point_name+"';");
                    out.print("arr.push(point);");
                    out.print("arr1.push(segment);");
                    out.print("arr2.push(bearers);");
                    out.print("arr3.push(typ);");
                    out.print("arr4.push(point_name);");


                }

rs1.close ();
s1.close ();
}
catch (Exception e)
{
e.printStackTrace();
}
out.print("var color='"+color+"';");
out.print("start(arr,arr1,arr2,color,arr3,arr4);");
}
rs.close ();
s.close ();
}
catch (Exception e)
{
e.printStackTrace();
}
}
%>
    
</script>

    </body>
</html>
