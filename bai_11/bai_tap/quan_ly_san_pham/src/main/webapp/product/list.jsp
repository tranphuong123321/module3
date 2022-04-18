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
<h1 style="text-align: center">Products</h1>
<p>
 <button> <a href="/products?action=create">Create new product</a></button>
</p>

<form action="get">
  <input type="hidden" name="action" value="search">
  <input type="text" name="search" >
  <input type="submit" value="tìm kiếm">
</form>

<table class="table">

  <tr>
    <th> Id</th>
    <th>Tên sản phẩm</th>
    <th>Giá sản phẩm</th>
    <th>Mô tả của sản phẩm</th>
    <th>Nhà sản xuất</th>
    <th>Cập nhật</th>
    <th>Xóa</th>
  </tr>
  <c:forEach items='${requestScope["products"]}'  var= "product">
    <tr>
      <td>${product.getId()}</td>
      <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
      <td>${product.getPrice()}</td>
      <td>${product.getStatus()}</td>
      <td>${product.getProducer()}</td>
      <td><a class="btn" href="/products?action=edit&id=${product.getId()}">edit</a></td>
      <td><button type="button" class="btn" data-toggle="modal" data-target="#exampleModal" onclick="getId(${product.getId()})">
        Xóa
      </button></td>
<%--      <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>--%>
    </tr>
  </c:forEach>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cảnh báo!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form >
        <div class="modal-body">
          Bạn có thật sự muốn xóa sản phẩm này?
          <input type="hidden" name="action" value="delete">
          <input type="text" name="id" id="idDelete" hidden>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
          <button type="submit" class="btn btn-primary">Xóa</button>
        </div>
      </form>

    </div>
  </div>
</div>

<script>
  function getId(id){
    document.getElementById("idDelete").value = id
  }
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
