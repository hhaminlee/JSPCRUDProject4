<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jspcrud.dao.myStoreDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.jspcrud.bean.myStoreVO" />
<jsp:setProperty property="*" name="u"/>

<%
	myStoreDAO myStoreDAO = new myStoreDAO();
	int i =myStoreDAO.updateMyStore(u);
	response.sendRedirect("posts.jsp");
%>