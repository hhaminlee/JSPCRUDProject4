<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jspcrud.dao.myStoreDAO, com.example.jspcrud.bean.myStoreVO"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){
		int id = Integer.parseInt(sid);
		myStoreVO u = new myStoreVO();
		u.setId(id);
		myStoreDAO myStoreDAO = new myStoreDAO();
		myStoreDAO.deleteMyStore(u);
	}
	response.sendRedirect("posts.jsp");
%>