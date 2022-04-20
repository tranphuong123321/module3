<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 20-Apr-22
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer Managerment</title>
</head>
<body>
<center>
    <h1>Customer Management</h1>
    <h2>
        <a href="customers?action=customers">List All Customers</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <%--            Integer id = rs.getInt("ma_khach_hang");--%>
            <%--            String name = rs.getString("ho_ten");--%>
            <%--            String birthday = rs.getString("ngay_sinh");--%>
            <%--            Integer gender = rs.getInt("gioi_tinh");--%>
            <%--            String idCard = rs.getString("so_cmnd");--%>
            <%--            String phoneNumber = rs.getString("so_dien_thoai");--%>
            <%--            String email = rs.getString("email");--%>
            <%--            String address = rs.getString("dia_chi");--%>
            <%--            Integer customerTypeId = rs.getInt("ma_loai_khach");--%>
            <caption>
                <h2>Add New Customer</h2>
            </caption>

                    <input type="hidden" value="0" name="id" id="id" size="45"/>

            <tr>
                <th>CustomerTypeId</th>
                <td>
                    <select name="customertypeid">
                        <option value="1" >Diamond</option>
                        <option value="2" >Platium</option>
                        <option value="3" >Gold</option>
                        <option value="4" >Silver</option>
                        <option value="5" >Member</option>
                    </select>

                </td>
            </tr>
            <tr>
                <th>Name</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Birthday</th>
                <td>
                    <input type="text" name="birthday" id="birthday" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Gender</th>
                <td>
                    <select name="gender">
                        <option value="0" >Nu</option>
                        <option value="1" >Nam</option>
                    </select>

                </td>
            </tr>
            <tr>
                <th>Id Card</th>
                <td>
                    <input type="text" name="idcard" id="idcard" size="45"/>
                </td>
            </tr>

            <tr>
                <th>Phone Number</th>
                <td>
                    <input type="text" name="phonenumber" id="phonenumber" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Email</th>
                <td>
                    <input type="text" name="email" id="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Address</th>
                <td>
                    <input type="text" name="address" id="address" size="45"/>
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
