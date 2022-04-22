package service.impl;

import model.CustomerType;
import repository.ICustomerRepository;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerRepository;
import repository.impl.CustomerTypeRepository;
import service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    private final ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> selectCustomerTypeList() {
        return customerTypeRepository.selectCustomerTypeList();
    }
}
