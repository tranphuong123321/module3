<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 15-Apr-22
  Time: 8:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Create new product</h1>
// id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Id </td>
                <td><input type="number" name="id" id="id"></td>
            </tr>
            <tr>
                <td>Name </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Price </td>
                <td><input type="number" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Status </td>
                <td><input type="text" name="status" id="status"></td>
            </tr>
            <tr>
                <td>Producer </td>
                <td><input type="text" name="producer" id="producer"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create product"></td>
            </tr>

        </table>
    </fieldset>
</form>
</body>
</html>