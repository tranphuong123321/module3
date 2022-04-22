package service.impl;

import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private final ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAllCustomer() {
        return customerRepository.findAllCustomer();
    }

    @Override
    public Customer selectCustomerById(Integer id) throws SQLException {
        return customerRepository.selectCustomerById(id);
    }

    @Override
    public void insertCustomer(Customer customer) {
        customerRepository.insertCustomer(customer);
    }

    @Override
    public void deleteCustomer(Integer id){
        customerRepository.deleteCustomer(id);
    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
        customerRepository.updateCustomer(customer);
    }

    @Override
    public List<Customer> searchByName(String name,String email,Integer type) {
        return customerRepository.searchByName(name,email,type);
    }



    @Override
    public List<CustomerType> findAllCustomerType() {
        return null;
    }

    @Override
    public Map<String, String> check(Customer customer) {
        return null;
    }

    @Override
    public Customer selectCustomerByCode(String code) {
        return null;
    }
}
