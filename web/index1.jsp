<%-- 
    Document   : index1
    Created on : 28 Jun, 2018, 2:53:33 PM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding Segment to database </title>
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
    $(document).ready(function() {
    var max_fields_limit= 100; //set limit for maximum input fields
     //initialize counter for text box
    $('.add_more_button').click(function(e){ //click event on add more fields button having class add_more_button
        e.preventDefault();
        if(x < max_fields_limit){ //check conditions
            x++; //counter increment
            $('.input_fields_container').append('<div> Point '+x+'<br><br><input type="text" name="point'+x+'" placeholder="Lat,Long">&nbsp;<input type="text" name="pointid'+x+'" placeholder="Point ID">&nbsp;<input type="text" name="pointname'+x+'" placeholder="Point Name">&nbsp;<select id="type'+x+'" name="type'+x+'"><option value="NA">NA</option><option value="LP">LP</option><option value="BU">BU</option></select><a href="#" class="remove_field" style="margin-left:10px;">Remove</a><br><br></div>'); //add input field
   
}
 
    });

    $('.input_fields_container').on("click",".remove_field", function(e){ //user click on remove text links
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});
function setlength(){
    alert(x);
   document.getElementById('pointlength').value=x ;
    alert(document.getElementById("pointlength").value);
}
</script>

<div class="container">
<h2>fill Segment values to insert into database</h2>
<form action="addcable.jsp" method="post">
<div class="row"><div class="col-25"> Segment ID:</div><div class="col-75"><input type="text" name="segmentid"></div></div>
<div class="row"><div class="col-25"> Segment:</div><div class="col-75"><input type="text" name="segment"></div></div>
<div class="row"><div class="col-25"> Bearers:</div><div class="col-75"><input type="text" name="bearers"></div></div>
<div class="row"><div class="col-25"> Cable ID:</div><div class="col-75"><input type="text" name="cableid"></div></div>
<div class="row"><div class="col-25"> Cable Name:</div><div class="col-75"><input type="text" name="cablename"></div></div>
<div class="row"><div class="col-25"> Color:</div><div class="col-75"><input type="text" name="color"></div></div>
<div class="input_fields_container">Start Point :<br>  <div><input type="text" name="startpoint" placeholder="Lat,Long">&nbsp;<input type="text" name="spointid" placeholder="Point ID">&nbsp;<input type="text" name="spointname" placeholder="Point Name">&nbsp;<select id="stype" name="stype"><option value="NA">NA</option><option value="LP">LP</option><option value="BU">BU</option></select>&nbsp;<button class="btn btn-sm btn-primary add_more_button">Add More Points</button><br><br></div> </div>
End Point :<br><input type="text" name="endpoint" placeholder="Lat,Long">&nbsp;<input type="text" name="epointid" placeholder="Point ID">&nbsp;<input type="text" name="epointname" placeholder="Point Name">&nbsp;<select id="etype" name="etype"><option value="NA">NA</option><option value="LP">LP</option><option value="BU">BU</option></select><br><br>
<input type="hidden" id="pointlength"  name="pointlength" value=""/>
<input type="submit" name="Insert" onclick="setlength();"><br><br>
</form>
</div>
</body>
</html>

