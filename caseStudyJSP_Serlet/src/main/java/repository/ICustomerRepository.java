package repository;

import model.Customer;
import model.CustomerType;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAllCustomer();

    Customer selectCustomerById(Integer id) ;

    void insertCustomer(Customer customer) ;

    void deleteCustomer(Integer id) ;

    void updateCustomer(Customer customer) ;

    List<Customer> searchByName(String name);

    List<CustomerType> findAllCustomerType();

    Customer selectCustomerByCode(String code);

}
