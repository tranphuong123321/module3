<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 21-Apr-22
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Management Application</title>
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
    <a href="/employees"><h1>Employee Management</h1></a>

    <tr>
        <h2>
            <a href="/employees?action=create">Add New Employee</a>
        </h2>
        <form method="get">
            <input type="text" value="search" name="action" hidden>
            <input type="text" name="searchName" placeholder="Search by name">
            <input type="submit" value="Search">
        </form>
    </tr>
    <tr>
</center>
<div align="center">
</div>
<table border="1" id="example" class="table table-striped table-bordered">
    <thead>
    <tr>
        <th>ma_nhan_vien</th>
        <th>ho ten</th>
        <th>ngay sinh</th>
        <th>so cmnd</th>
        <th>luong</th>
        <th>so dien thoai</th>
        <th>email</th>
        <th>dia chi</th>
        <th>ma_vi_tri</th>
        <th>ma_trinh_do</th>
        <th>ma_bo_phan</th>
        <th>chuc nang</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="employee" items="${employeeList}">

        <tr>
            <td><c:out value="${employee.id}"/></td>
            <td><c:out value="${employee.name}"/></td>
            <td><c:out value="${employee.birthday}"/></td>
            <td><c:out value="${employee.idCard}"/></td>
            <td><c:out value="${employee.salary}"/></td>
            <td><c:out value="${employee.phoneNumber}"/></td>
            <td><c:out value="${employee.email}"/></td>
            <td><c:out value="${employee.address}"/></td>
            <td><c:out value="${employee.positionId}"/></td>
            <td><c:out value="${employee.levelId}"/></td>
            <td><c:out value="${employee.partId}"/></td>

            <td>
                <a href="/employees?action=edit&id=${employee.id}">Edit</a>

                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                        onclick="getId(${employee.id})">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="get">
                <div class="modal-body">
                    <input type="hidden" name="action" value="delete">
                    <input readonly type="text" id="id-to-delete" name="id">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
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

