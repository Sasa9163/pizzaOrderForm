<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.ResourceBundle" %>

<%
ResourceBundle rb=ResourceBundle.getBundle("dbset");
String servername = rb.getString("server");
String databasename = rb.getString("db");
String user = rb.getString("user");;
String password = rb.getString("password");

String url = "jdbc:mysql://" + servername + "/" + databasename;

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connect = DriverManager.getConnection(url, user, password);

%>