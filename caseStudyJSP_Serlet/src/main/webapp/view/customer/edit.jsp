<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 20-Apr-22
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Management Application</title>
</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2>
        <a href="customers">List All Customers</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Customer
                </h2>
            </caption>
            <c:if test="${customer != null}">
                <input type="hidden" name="id" value="<c:out value='${customer.id}' />"/>
            </c:if>
            <tr>
                <th>CustomerTypeId</th>
<%--                <td>--%>
<%--                    <input type="text" name="customertypeid" size="45"--%>
<%--                           value="${customer.customerTypeId}"--%>
<%--                    />--%>
<%--                </td>--%>
                <td>
                    <select name="customertypeid" >
                        <option value="0"></option>
                        <c:forEach items="${customerTypeList}" var="type">
                            <option value="${type.id}">${type.customerTypeName}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Name</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="${customer.name}"
                    />
                </td>
            </tr>
            <tr>
                <th>Birthday</th>
                <td>
                    <input type="text" name="birthday" size="45"
                           value="${customer.birthday}"
                    />
                </td>
            </tr>
            <tr>
                <th>Gender</th>
                <td>
                    <input type="text" name="gender" size="45"
                           value="${customer.gender}"
                    />
                </td>
            </tr>

            <tr>
                <th>IdCard</th>
                <td>
                    <input type="text" name="idcard" size="45"
                           value="${customer.idCard}"
                    />
                </td>
            </tr>

            <tr>
                <th>NumberPhone</th>
                <td>
                    <input type="text" name="phonenumber" size="45"
                           value="${customer.phoneNumber}"
                    />
                </td>
            </tr>

            <tr>
                <th>Email</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="${customer.email}"
                    />
                </td>
            </tr>

            <tr>
                <th>Address</th>
                <td>
                    <input type="text" name="address" size="45"
                           value="${customer.address}"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
