<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 21-Apr-22
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Facility Management Application</title>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        input {
            font-size: small;
        }

    </style>
</head>
<body>
<center>
    <a href="/facilitys"><h1>Facility Management</h1></a>

    <tr>
        <h2>
            <a href="/facilitys?action=create">Add New Facility</a>
        </h2>
<%--        <form method="get">--%>
<%--            <input type="text" value="search" name="action" hidden>--%>
<%--            <input type="text" name="searchName" placeholder="Search by name">--%>
<%--            <input type="text" name="searchMail" placeholder="Search by email">--%>
<%--            <select name="searchType" >--%>
<%--                <option value="0"></option>--%>
<%--                <c:forEach items="${customerTypeList}" var="type">--%>
<%--                    <option value="${type.id}">${type.customerTypeName}</option>--%>
<%--                </c:forEach>--%>
<%--            </select>--%>
<%--            <input type="submit" value="Search">--%>
<%--        </form>--%>
    </tr>
    <tr>
</center>
<div align="center">
</div>
<table border="1" id="example" class="table table-striped table-bordered">
    <thead>
    <tr>
        <th>ma dich vu</th>
        <th>ten_dich_vu</th>
        <th>dien_tich</th>
        <th>chi_phi_thue</th>
        <th>so_nguoi_toi_da</th>
        <th>tieu_chuan_phong</th>
        <th>mo_ta_tien_nghi_khac</th>
        <th>dien_tich_ho_boi</th>
        <th>so_tang</th>
        <th>ma_kieu_thue</th>
        <th>ma_loai_dich_vu</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="facility" items="${facilityList}">
        <tr>
            <td><c:out value="${facility.id}"/></td>
            <td><c:out value="${facility.serviceName}"/></td>
            <td><c:out value="${facility.area}"/></td>
            <td><c:out value="${facility.cost}"/></td>
            <td><c:out value="${facility.maxPeople}"/></td>
            <td><c:out value="${facility.roomStandard}"/></td>
            <td><c:out value="${facility.descriptionOtherConvenience}"/></td>
            <td><c:out value="${facility.poolArea}"/></td>
            <td><c:out value="${facility.numberOfFloors}"/></td>
            <td><c:out value="${facility.rentTypeId}"/></td>
            <td>
                <c:forEach items="${facilityTypeList}" var="facilityType">
                    <c:if test="${facility.id == facilityType.facilityTypeId}">
                        ${facilityType.facilityTypeName}
                    </c:if>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
    $.extend(true, $.fn.dataTable.defaults, {
        "searching": false,
        "ordering": false
    });
    $(document).ready(function () {
        $('#example').DataTable({
            "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]]
        });
    });
</script>


<script>
    function getId(id) {
        document.getElementById("id-to-delete").value = id;
    }
</script>
</html>
