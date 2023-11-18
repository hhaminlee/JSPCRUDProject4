<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.jspcrud.dao.myStoreDAO, com.example.jspcrud.bean.myStoreVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보 수정</title>
</head>
<body>

<%
	myStoreDAO myStoreDAO = new myStoreDAO();
	String id=request.getParameter("id");
	myStoreVO u=myStoreDAO.getMyStore(Integer.parseInt(id));
%>

<h1>상품 정보 수정</h1>
<form action="editpost.jsp" method="post">
<input type="hidden" name="id" value="<%=u.getId() %>"/>
<table>
<tr><td>담당자:</td><td><input type="text" name="manager" value="<%= u.getManager()%>" /></td></tr>
<tr><td>층수:</td><td><input type="text" name="floor" value="<%= u.getFloor()%>"/></td></tr>
<tr><td>상품명:</td><td><input type="text" name="name" value="<%= u.getName()%>" /></td></tr>
<tr><td>판매회사:</td><td><input type="text" name="seller" value="<%= u.getSeller()%>" /></td></tr>
<tr><td>발주회사:</td><td><input type="text" name="ordering" value="<%= u.getOrdering()%>" /></td></tr>
<tr><td>가격:</td><td><input type="text" name="price" value="<%= u.getPrice()%>" /></td></tr>
<tr><td>재고수:</td><td><input type="text" name="remain" value="<%= u.getRemain()%>" /></td></tr>
<tr><td colspan="2"><input type="submit" value="수정하기"/>
<input type="button" value="취소" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>