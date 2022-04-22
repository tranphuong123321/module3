<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 22-Apr-22
  Time: 8:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Management Application</title>
</head>
<body>
<center>
    <h1>Employee Management</h1>
    <h2>
        <a href="employees">List All Employees</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Employee
                </h2>
            </caption>
            <c:if test="${employee != null}">
                <input type="hidden" name="id" value="<c:out value='${employee.id}' />"/>
            </c:if>

            <tr>
                <th>Name</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="${employee.name}"
                    />
                </td>
            </tr>
            <tr>
                <th>Birthday</th>
                <td>
                    <input type="text" name="birthday" size="45"
                           value="${employee.birthday}"
                    />
                </td>
            </tr>
            <tr>
                <th>IdCard</th>
                <td>
                    <input type="text" name="idCard" size="45"
                           value="${employee.idCard}"
                    />
                </td>
            </tr>
            <tr>
                <th>Salary</th>
                <td>
                    <input type="text" name="salary" size="45"
                           value="${employee.salary}"
                    />
                </td>
            </tr>
            <tr>
                <th>PhoneNumber</th>
                <td>
                    <input type="text" name="phoneNumber" size="45"
                           value="${employee.phoneNumber}"
                    />
                </td>
            </tr>
            <tr>
                <th>Email</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="${employee.email}"
                    />
                </td>
            </tr>
            <tr>
                <th>Address</th>
                <td>
                    <input type="text" name="address" size="45"
                           value="${employee.address}"
                    />
                </td>
            </tr>
            <tr>
                <th>PositionId</th>
                <td>
                    <input type="text" name="positionId" size="45"
                           value="${employee.positionId}"
                    />
                </td>
            </tr>
            <tr>
                <th>LevelId</th>
                <td>
                    <input type="text" name="levelId" size="45"
                           value="${employee.levelId}"
                    />
                </td>
            </tr>
            <tr>
                <th>PartId</th>
                <td>
                    <input type="text" name="partId" size="45"
                           value="${employee.partId}"
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

