<%-- 
    Document   : logout
    Created on : 28 Jun, 2018, 11:54:34 AM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.invalidate();
response.sendRedirect("login.jsp");
%>