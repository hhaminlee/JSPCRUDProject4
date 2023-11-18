<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jspcrud.dao.myStoreDAO, com.example.jspcrud.bean.myStoreVO, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>재고왕 v3</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
a{
	text-decoration: none;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>재고관리 시스템 - 재고왕 v3</h1>
<%
	myStoreDAO dao = new myStoreDAO();
	List<myStoreVO> list = dao.getMyStoreList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
<tr>
	<th>#</th>
	<th>담당자</th>
	<th>층수</th>
	<th>상품명</th>
	<th>판매회사</th>
	<th>발주회사</th>
	<th>가격</th>
	<th>재고수</th>
	<th>발주일</th>
	<th>수정</th>
	<th>삭제</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getId()}</td>
		<td>${u.getManager()}</td>
		<td>${u.getFloor()}</td>
		<td>${u.getName()}</td>
		<td>${u.getSeller()}</td>
		<td>${u.getOrdering()}</td>
		<td>${u.getPrice()}</td>
		<td>${u.getRemain()}</td>
		<td>${u.getRegdate()}</td>
		<td><a href="editform.jsp?id=${u.getId()}">수정</a></td>
		<td><a href="javascript:delete_ok('${u.getId()}')">삭제</a></td>
	</tr>
</c:forEach>
</table>
<br/><a href="addpostform.jsp">새 상품 등록하기</a>
</body>
</html>