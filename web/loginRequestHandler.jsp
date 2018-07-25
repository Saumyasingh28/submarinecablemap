<%-- 
    Document   : loginrequesthandler
    Created on : 28 Jun, 2018, 11:50:48 AM
    Author     : gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.LoginDOA"%>
<jsp:useBean id="loginBean" class="com.LoginBean" scope="session"/>
<jsp:setProperty name="loginBean" property="*"/>
 
<%
String result=LoginDOA.loginCheck(loginBean);
 
if(result.equals("true")){
    session.setAttribute("username",loginBean.getUsername());
    response.sendRedirect("index.jsp");
}
 
if(result.equals("false")){
    response.sendRedirect("login.jsp?status=false");
}
 
if(result.equals("error")){
    response.sendRedirect("login.jsp?status=error");
}
 
%>