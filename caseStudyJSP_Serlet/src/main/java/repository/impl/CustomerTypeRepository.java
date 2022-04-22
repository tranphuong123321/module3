package repository.impl;

import model.Customer;
import model.CustomerType;
import repository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private static final String SELECT_ALL_CUSTOMER_TYPE = "select * from loai_khach";
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<CustomerType> selectCustomerTypeList() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE)) {
            System.out.println(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer id = rs.getInt("ma_loai_khach");
                String customerTypeName = rs.getString("ten_loai_khach");
                customerTypeList.add(new CustomerType(id, customerTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}