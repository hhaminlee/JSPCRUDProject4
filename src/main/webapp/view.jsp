<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.example.jspcrud.bean.myStoreVO"%>
<%@ page import="com.example.jspcrud.dao.myStoreDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>상세페이지 - 재고왕 v3</title>
</head>
<body>
<h1>상세페이지</h1>
<%
    myStoreDAO myStoreDAO = new myStoreDAO();
    String id = request.getParameter("id");
    myStoreVO u = myStoreDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>
<table>
    <tr>
        <td><strong>상품 ID:</strong></td>
        <td>${vo.getId()}</td>
    </tr>
    <tr>
        <td><strong>담당자:</strong></td>
        <td>${vo.getManager()}</td>
    </tr>
    <tr>
        <td><strong>층수:</strong></td>
        <td>${vo.getFloor()}</td>
    </tr>
    <tr>
        <td><strong>상품명:</strong></td>
        <td>${vo.getName()}</td>
    </tr>
    <tr>
        <td><strong>판매회사:</strong></td>
        <td>${vo.getSeller()}</td>
    </tr>
    <tr>
        <td><strong>발주회사:</strong></td>
        <td>${vo.getOrdering()}</td>
    </tr>
    <tr>
        <td><strong>가격:</strong></td>
        <td>${vo.getPrice()}</td>
    </tr>
    <tr>
        <td><strong>재고수:</strong></td>
        <td>${vo.getRemain()}</td>
    </tr>
    <tr>
        <td><strong>발주일:</strong></td>
        <td>${vo.getRegdate()}</td>
    </tr>
    <tr>
        <td><strong>발주가능 여부:</strong></td>
        <td>Y</td>
    </tr>

</table>

<br/>
<a href="posts.jsp">목록보기</a>
</body>
</html>
