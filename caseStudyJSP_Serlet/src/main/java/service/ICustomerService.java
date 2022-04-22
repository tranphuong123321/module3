package service;

import model.Customer;
import model.CustomerType;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> findAllCustomer();

    Customer selectCustomerById(Integer id) throws SQLException;

    void insertCustomer(Customer customer);

    void deleteCustomer(Integer id);

    void updateCustomer(Customer customer) throws SQLException;

    List<Customer> searchByName(String name,String email,Integer type);

    List<CustomerType> findAllCustomerType();

    Map<String, String> check(Customer customer);

    Customer selectCustomerByCode(String code);
}
