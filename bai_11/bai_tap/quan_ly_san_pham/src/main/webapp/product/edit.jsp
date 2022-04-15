<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 15-Apr-22
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    // id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Id </td>
                <td><input type="number" name="id" id="id" value="${requestScope["products"].getId()}"></td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" id="name" value="${requestScope["products"].getName()}"></td>
            </tr>
            <tr>
                <td>Price </td>
                <td><input type="number" name="price" id="price" value="${requestScope["products"].getPrice()}"></td>
            </tr>
            <tr>
                <td>Status</td>
                <td><input type="text" name="status" id="status" value="${requestScope["products"].getStatus()}"></td>
            </tr>
            <tr>
                <td>Producer</td>
                <td><input type="text" name="producer" id="producer" value="${requestScope["products"].getProducer()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
