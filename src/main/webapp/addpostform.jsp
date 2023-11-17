<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>

<h1>새 상품 등록</h1>
<form action="addpost.jsp" method="post">
<table>
<tr><td>층수:</td><td><input type="text" name="floor"/></td></tr>
<tr><td>품명:</td><td><input type="text" name="name"/></td></tr>
<tr><td>판매회사:</td><td><input type="text" name="seller"/></td></tr>
<tr><td>발주회사:</td><td><input type="text" name="ordering"/></td></tr>
<tr><td><a href="posts.jsp">홈으로 가기</a></td><td align="right"><input type="submit" value="추가하기"/></td></tr>
</table>
</form>

</body>
</html>