package repository;

import model.Customer;
import model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAllEmployee();

    void insertEmployee(Employee employee);

    void deleteEmployee(Integer id);

    Employee selectEmployeeById(Integer id);

    void updateEmployee(Employee employee);

    List<Employee> searchByName(String name);

}
