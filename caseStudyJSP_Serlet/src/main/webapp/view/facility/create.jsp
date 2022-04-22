<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 22-Apr-22
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Facility Managerment</title>
</head>
<body>
<center>
    <h1>Facility Management</h1>
    <h2>
        <a href="customers?action=customers">List All Facilitys</a>
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
                <h2>Add New Facility</h2>
            </caption>

            <input type="hidden" value="0" name="id" id="id" size="45"/>
<%--                private Integer id;--%>
<%--                private String serviceName;--%>
<%--                private Integer area;--%>
<%--                private Double cost;--%>
<%--                private Integer maxPeople;--%>
<%--                private  String roomStandard;--%>
<%--                private  String descriptionOtherConvenience;--%>
<%--                private  Integer poolArea;--%>
<%--                private Integer numberOfFloors;--%>
<%--                private Integer rentTypeId;--%>
<%--                private Integer serviceTypeId;--%>

            <tr>
                <th>ID</th>
                <td>
                    <input type="text" name="id" id="id1" size="45"/>
                </td>
            </tr>
                <tr>
                    <th>serviceName</th>
                    <td>
                        <select  >
                            <option value="0"></option>
                            <c:forEach items="${facilityList}" var="type">
                                <option value="${type.id}">${type.serviceName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>area</th>
                    <td>
                        <input type="text" name="area" id="area" size="45"/>
                    </td>
                </tr>
                <tr>
                    <th>cost</th>
                    <td>
                        <input type="text" name="cost" id="cost" size="45"/>
                    </td>
                </tr>
                <tr>
                    <th>maxPeople</th>
                    <td>
                        <input type="text" name="maxPeople" id="maxPeople" size="45"/>
                    </td>
                </tr>
                <tr>
                    <th>roomStandard</th>
                    <td>
                        <input type="text" name="roomStandard" id="roomStandard" size="45"/>
                    </td>
                </tr>
                <tr>
                    <th>descriptionOtherConvenience</th>
                    <td>
                        <input type="text" name="descriptionOtherConvenience" id="descriptionOtherConvenience" size="45"/>
                    </td>
                </tr>
                <tr>
                    <th>poolArea</th>
                    <td>
                        <input type="text" name="poolArea" id="poolArea" size="45"/>
                    </td>
                </tr>
                <tr>
                    <th>numberOfFloors</th>
                    <td>
                        <input type="text" name="numberOfFloors" id="numberOfFloors" size="45"/>
                    </td>
                </tr>
                <tr>
                    <th>rentTypeId</th>
                    <td>
                        <input type="text" name="rentTypeId" id="rentTypeId" size="45"/>
                    </td>
                </tr>
                <tr>
                    <th>serviceTypeId</th>
                    <td>
                        <select  >
                            <option value="0"></option>
                            <c:forEach items="${facilityTypeList}" var="facilitytype">
                                <option value="${facilitytype.facilityTypeId}">${facilitytype.facilityTypeName}</option>
                            </c:forEach>
                        </select>
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

