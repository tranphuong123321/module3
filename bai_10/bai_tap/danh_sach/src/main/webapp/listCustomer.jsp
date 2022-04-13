<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 13-Apr-22
  Time: 9:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width: 50%;margin: auto; text-align: center">
    <h2>Danh sách khách hàng</h2>

    <table style="width: 70%;margin: auto;border: 1px solid lightslategray;border-collapse: collapse; box-shadow: -4px -4px 10px cornflowerblue">
        <tr style="border:1px solid lightslategray ">
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach var="customer" items="${customersList}">
            <tr style="border:1px solid lightslategray ">
                <td>${customer.name}</td>
                <td>${customer.birthday}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.img}" alt="IMAGE" width="45" height="45"> </td>
            </tr>
        </c:forEach>
    </table>
</div>


</body>
</html>
