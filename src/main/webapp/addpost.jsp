<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jspcrud.dao.myStoreDAO"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.jspcrud.bean.myStoreVO" />
<jsp:setProperty property="*" name="u"/>

<%
	myStoreDAO myStoreDAO = new myStoreDAO();
	int i = myStoreDAO.insertMyStore(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>