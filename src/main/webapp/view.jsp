<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.example.jspcrud.bean.myStoreVO"%>
<%@ page import="com.example.jspcrud.dao.myStoreDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>상세페이지 - 재고왕 v3</title>
    <style>
        /* Add your styling for the detail page here */
    </style>
</head>
<body>
<h1>상세페이지</h1>
<%
    String id = request.getParameter("id");

    if (id != null && id.matches("\\d+")) {
        myStoreDAO dao = new myStoreDAO();
        List<myStoreVO> list = dao.getMyStoreList();
        request.setAttribute("list", list);

        if (list != null) {
            for (myStoreVO u : list) {
                if (u.getId() == Integer.parseInt(id)) {
%>
<table>
    <tr>
        <td><strong>상품 ID:</strong></td>
        <td><%=u.getId()%></td>
    </tr>
    <tr>
        <td><strong>담당자:</strong></td>
        <td><%=u.getManager()%></td>
    </tr>
    <tr>
        <td><strong>층수:</strong></td>
        <td><%=u.getFloor()%></td>
    </tr>
    <tr>
        <td><strong>상품명:</strong></td>
        <td><%=u.getName()%></td>
    </tr>
    <tr>
        <td><strong>판매회사:</strong></td>
        <td><%=u.getSeller()%></td>
    </tr>
    <tr>
        <td><strong>발주회사:</strong></td>
        <td><%=u.getOrdering()%></td>
    </tr>
    <tr>
        <td><strong>가격:</strong></td>
        <td><%=u.getPrice()%></td>
    </tr>
    <tr>
        <td><strong>재고수:</strong></td>
        <td><%=u.getRemain()%></td>
    </tr>
    <tr>
        <td><strong>발주일:</strong></td>
        <td><%=u.getRegdate()%></td>
    </tr>
    <tr>
        <td><strong>발주가능 여부:</strong></td>
        <td>Y</td>
    </tr>

</table>
<%
                    break;
                }
            }
        }
    } else {
        System.out.println("Invalid ID or ID is null");
    }
%>

<br/>
<a href="posts.jsp">목록보기</a>
</body>
</html>
