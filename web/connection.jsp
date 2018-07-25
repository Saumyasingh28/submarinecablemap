<%-- 
    Document   : connection
    Created on : 28 Jun, 2018, 2:46:53 PM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>  <%@ page import="java.io.*" %>
   <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
   <%@ page import="java.lang.*" %>

        <%
        String driver = "com.mysql.jdbc.Driver";
	Class.forName(driver).newInstance();
	Connection conn;
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cable_path", "root","");

%>