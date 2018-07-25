<%-- 
    Document   : updatecable
    Created on : 9 Jul, 2018, 1:46:32 PM
    Author     : gaurav
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
* {
    box-sizing: border-box;
}

input[type=text], select, textarea {
    width: 20%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

input[type=submit]:hover {
    background-color: #45a049;
}
button {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
   
}

button:hover {
    background-color: #45a049;
}
.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}

.col-25 {
    float: left;
    width: 25%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}


</style>
    </head>
    <body>
       <script>
     var x = 0;
   
function setlength(var y){
    x=y;
    alert(x);
    document.getElementById('pointlength').value=x ;
    alert(document.getElementById("pointlength").value);
}
</script>
       
<div class="container">
<h2>fill Segment values to update</h2>
<form action="updatecableaction.jsp" method="post">
 <% 
        
     String segment=request.getParameter("segment");
     
     String segment_id="";
     String bearers="";
     String cable_id="";
     String cable_name="";
     String color="";
     ArrayList ar1=new ArrayList();
     ArrayList ar2=new ArrayList();
        try{
            
        String driver = "com.mysql.jdbc.Driver";
	Class.forName(driver).newInstance();
	Connection conn;
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cable_path", "root","");
	Statement s = conn.createStatement ();
	s.executeQuery ("select sl,segment_id,bearers,cable_id,cable_name,color,lat,lng from segment_path where segment='"+segment+"' order by sl;");
	ResultSet rs = s.getResultSet ();
        
        while(rs.next())
        {
            
            segment_id = rs.getString ("segment_id");
            bearers = rs.getString ("bearers");
            cable_id = rs.getString ("cable_id");
            cable_name = rs.getString ("cable_name");
            color = rs.getString ("color");
            String a1=rs.getString("lat");
            ar1.add(a1);
            String a2=rs.getString("lng");
            ar2.add(a2);
        }
       %> 

<div class="row"><div class="col-25"> Segment ID:</div><div class="col-75"><input type="text" name="segmentid" value="<%=segment_id%>"></div></div>
<div class="row"><div class="col-25"> Segment:</div><div class="col-75"><input type="text" name="segment" value="<%=segment%>"></div></div>
<div class="row"><div class="col-25"> Bearers:</div><div class="col-75"><input type="text" name="bearers" value="<%=bearers%>"></div></div>
<div class="row"><div class="col-25"> Cable ID:</div><div class="col-75"><input type="text" name="cableid" value="<%=cable_id%>"></div></div>
<div class="row"><div class="col-25"> Cable Name:</div><div class="col-75"><input type="text" name="cablename" value="<%=cable_name%>"></div></div>
<div class="row"><div class="col-25"> Color:</div><div class="col-75"><input type="text" name="color" value="<%=color%>"></div></div><br>
<div class="input_fields_container">Start Point :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="startpoint" placeholder="Lat,Long" value="<%=ar1.get(0)%>,<%=ar2.get(0)%>"></div><br>
<% for(int x = 1; x < ar1.size()-1; x++){ %>
<div class="input_fields_container">Middle Point :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="middlepoint" placeholder="Lat,Long" value="<%=ar1.get(x)%>,<%=ar2.get(x)%>"></div><br>
<%}%>
<div class="input_fields_container">End Point :&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="endpoint" placeholder="Lat,Long" value="<%=ar1.get(ar1.size()-1)%>,<%=ar2.get(ar2.size()-1)%>"></div><br>
<input type="hidden" id="pointlength"  name="pointlength" value=""/>
<input type="submit" name="Update" onclick="setlength(<% ar1.size(); %>);"><br><br>
<%
      
        }
        catch (Exception e)
        {
          e.printStackTrace();
        }
        %>    
</form>
</div>
        
    </body>
</html>
