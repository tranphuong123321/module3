package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService implements IEmployeeService {
    private final IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> findAllEmployee() {
        return employeeRepository.findAllEmployee();
    }

    @Override
    public void insertEmployee(Employee employee) {
        employeeRepository.insertEmployee(employee);
    }

    @Override
    public void deleteEmployee(Integer id) {
        employeeRepository.deleteEmployee(id);
    }

    @Override
    public Employee selectEmployeeById(Integer id) {
        return employeeRepository.selectEmployeeById(id);
    }

    @Override
    public void updateEmployee(Employee employee) throws SQLException {
        employeeRepository.updateEmployee(employee);
    }

    @Override
    public List<Employee> searchByName(String name) {
        return employeeRepository.searchByName(name);
    }
}
