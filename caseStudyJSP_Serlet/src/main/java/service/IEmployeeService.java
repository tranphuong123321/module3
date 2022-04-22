package service;

import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    List<Employee> findAllEmployee();

    void insertEmployee(Employee employee);

    void deleteEmployee(Integer id);

    Employee selectEmployeeById(Integer id) throws SQLException;

    void updateEmployee(Employee employee) throws SQLException;

    List<Employee> searchByName(String name);
}
