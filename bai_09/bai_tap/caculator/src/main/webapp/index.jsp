<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12-Apr-22
  Time: 4:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" >
  <div style="text-align: center">
    <h2>Product Discount Calculator</h2>
  </div>

  <div class="row">
    <div style="width: 50%; margin: auto">
      <form action="/CalculateDiscount" method="post">
        <div class="form-group">
          <label for="description">Product description:</label>
          <textarea class="form-control" id="description" placeholder="Enter description" name="description"></textarea>
        </div>
        <div class="form-group">
          <label for="price">List price:</label>
          <input type="text" class="form-control" id="price" placeholder="Enter price" name="price">
        </div>
        <div class="form-group">
          <label for="discountPercent">Discount percent:</label>
          <input type="text" class="form-control" id="discountPercent" placeholder="Enter discount percent" name="discount">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
    </div>
  </div>

</div>
</body>
</html>