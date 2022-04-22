package repository.impl;

import model.Customer;
import model.Employee;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_EMPLOYEE = "select * from nhan_vien;";
    private static final String INSERT_NEW_EMPLOYEE = "insert into nhan_vien (ma_nhan_vien,ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values (?,?,?,?,?,?,?,?,?,?,?);";
    private static final String DELETE_EMPLOYEE_BY_ID = "delete from nhan_vien where ma_nhan_vien = ?;";
    private static final String SELECT_EMPLOYEE_BY_ID = "select * from nhan_vien where ma_nhan_vien = ?";
    private static final String UPDATE_EMPLOYEE_BY_ID = "update nhan_vien set ho_ten=?, ngay_sinh=?,so_cmnd=?, luong=?,so_dien_thoai=?,email=?, dia_chi=?,ma_vi_tri=?,ma_trinh_do=?,ma_bo_phan=?    where ma_nhan_vien = ?;";
    private static final String SEARCH_EMPLOYEE_BY_NAME = "select * from nhan_vien where ho_ten like ? ";


    @Override
    public List<Employee> findAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE)) {
            System.out.println(SELECT_ALL_EMPLOYEE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer id = rs.getInt("ma_nhan_vien");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                String idCard = rs.getString("so_cmnd");
                int salary = rs.getInt("luong");
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                int positionId = rs.getInt("ma_vi_tri");
                int levelId = rs.getInt("ma_trinh_do");
                int partId = rs.getInt("ma_bo_phan");
                employeeList.add(new Employee(id,name,birthday,idCard,salary,phoneNumber,email,address,positionId,levelId,partId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void insertEmployee(Employee employee) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT_NEW_EMPLOYEE);
            preparedStatement.setInt(1, employee.getId());
            preparedStatement.setString(2, employee.getName());
            preparedStatement.setString(3, employee.getBirthday());
            preparedStatement.setString(4, employee.getIdCard());
            preparedStatement.setInt(5, employee.getSalary());
            preparedStatement.setString(6, employee.getPhoneNumber());
            preparedStatement.setString(7, employee.getEmail());
            preparedStatement.setString(8, employee.getAddress());
            preparedStatement.setInt(9, employee.getPositionId());
            preparedStatement.setInt(10, employee.getLevelId());
            preparedStatement.setInt(11, employee.getPartId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteEmployee(Integer id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Employee selectEmployeeById(Integer id) {
        Employee employee = null;
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Integer id1 = rs.getInt("ma_nhan_vien");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                String idCard = rs.getString("so_cmnd");
                int salary = rs.getInt("luong");
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                int positionId = rs.getInt("ma_vi_tri");
                int levelId = rs.getInt("ma_trinh_do");
                int partId = rs.getInt("ma_bo_phan");
                employee = new Employee(id1,name,birthday,idCard,salary,phoneNumber,email,address,positionId,levelId,partId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return employee;
    }

    @Override
    public void updateEmployee(Employee employee) {

        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_BY_ID);

            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setInt(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getLevelId());
            preparedStatement.setInt(10, employee.getPartId());
            preparedStatement.setInt(11, employee.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Employee> searchByName(String name) {

        List<Employee> employeeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE_BY_NAME);
            preparedStatement.setString(1, '%' + name + '%');
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer id1 = rs.getInt("ma_nhan_vien");
                String name1 = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                String idCard = rs.getString("so_cmnd");
                int salary = rs.getInt("luong");
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                int positionId = rs.getInt("ma_vi_tri");
                int levelId = rs.getInt("ma_trinh_do");
                int partId = rs.getInt("ma_bo_phan");
                Employee employee = new Employee(id1,name1,birthday,idCard,salary,phoneNumber,email,address,positionId,levelId,partId);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return employeeList;
    }
        }

