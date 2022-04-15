<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 14-Apr-22
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product List</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<h1>Products</h1>
<p>
  <a href="/products?action=create">Create new product</a>
</p>
<p>
  <a href="/products?action=search">Search</a>
</p>

<table class="table">

  <tr>
    <td> id</td>
    <td>tên sản phẩm</td>
    <td>giá sản phẩm</td>
    <td>mô tả của sản phẩm</td>
    <td>nhà sản xuất</td>
    <td>cap nhat</td>
    <td>xoa</td>
  </tr>
  <c:forEach items='${requestScope["products"]}'  var= "product">
    <tr>
      <td>${product.getId()}</td>
      <td>${product.getName()}</td>
      <td>${product.getPrice()}</td>
      <td>${product.getStatus()}</td>
      <td>${product.getProducer()}</td>
      <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
      <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
    </tr>
  </c:forEach>
</table>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
