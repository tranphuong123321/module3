package repository.impl;

import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_CUSTOMER = "select * from khach_hang;";
    private static final String INSERT_NEW_CUSTOMER = "insert into khach_hang (ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi) values (?,?,?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "select * from khach_hang where ma_khach_hang = ?";
    private static final String UPDATE_CUSTOMER_BY_ID = "update khach_hang set ma_loai_khach=?,ho_ten=?,ngay_sinh=?,gioi_tinh=?,so_cmnd=?,so_dien_thoai=?,email=?,dia_chi=?  where ma_khach_hang = ?;";
    private static final String DELETE_CUSTOMER_BY_ID = "delete from khach_hang where ma_khach_hang = ?;";
    private static final String SEARCH_CUSTOMER_BY_NAME = "select * from khach_hang where  (ho_ten like ? and ma_loai_khach = ? and email like ?)";
    private static final String SEARCH_CUSTOMER = "select * from khach_hang where  (ho_ten like ?  and email like ?)";
    private static final String SEARCH_CUSTOMER_BY_MAIL = "select * from khach_hang where email like ?";
    private static final String SEARCH_CUSTOMER_BY_TYPE = "select * from khach_hang where ma_loai_khach = ?";
    private static final String SELECT_CUSTOMER_BY_CODE = "select * from customer where customer_code = ?;";

    @Override
    public List<Customer> findAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER)) {
            System.out.println(SELECT_ALL_CUSTOMER);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer id = rs.getInt("ma_khach_hang");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                Integer gender = rs.getInt("gioi_tinh");
                String idCard = rs.getString("so_cmnd");
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                Integer customerTypeId = rs.getInt("ma_loai_khach");
                customerList.add(new Customer(id, name, birthday, gender, idCard, phoneNumber, email, address, customerTypeId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer selectCustomerById(Integer id) {
        Customer customer = null;
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Integer id1 = rs.getInt("ma_khach_hang");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                Integer gender = rs.getInt("gioi_tinh");
                String idCard = rs.getString("so_cmnd");
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                Integer customerTypeId = rs.getInt("ma_loai_khach");
               customer = new Customer(id1,name, birthday,gender,idCard,phoneNumber,email,address,customerTypeId);
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
        return customer;
    }


    @Override
    public void insertCustomer(Customer customer) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT_NEW_CUSTOMER);

            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthday());
            preparedStatement.setInt(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());

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
    public void deleteCustomer(Integer id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
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
    public void updateCustomer(Customer customer) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthday());
            preparedStatement.setInt(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9,customer.getId());
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
    public List<Customer> searchByName(String name,String email,Integer type) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();

        try {
            if (type > 0){


            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER_BY_NAME);
            preparedStatement.setString(1, "%" + name + "%");
            preparedStatement.setInt(2, type);
            preparedStatement.setString(3, "%" + email + "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer id = rs.getInt("ma_khach_hang");
                String name1 = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                Integer gender = rs.getInt("gioi_tinh");
                String idCard = rs.getString("so_cmnd");
                String phoneNumber = rs.getString("so_dien_thoai");
                String emailResult = rs.getString("email");
                String address = rs.getString("dia_chi");
                Integer customerTypeId = rs.getInt("ma_loai_khach");
                Customer customer = new Customer(id, name1, birthday, gender, idCard, phoneNumber, emailResult, address, customerTypeId);
                customerList.add(customer);
            }
            }else {
                PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER);
                preparedStatement.setString(1, "%" + name + "%");
                preparedStatement.setString(2, "%" + email + "%");
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    Integer id = rs.getInt("ma_khach_hang");
                    String name1 = rs.getString("ho_ten");
                    String birthday = rs.getString("ngay_sinh");
                    Integer gender = rs.getInt("gioi_tinh");
                    String idCard = rs.getString("so_cmnd");
                    String phoneNumber = rs.getString("so_dien_thoai");
                    String emailResult = rs.getString("email");
                    String address = rs.getString("dia_chi");
                    Integer customerTypeId = rs.getInt("ma_loai_khach");
                    Customer customer = new Customer(id, name1,birthday,gender,idCard,phoneNumber,emailResult,address,customerTypeId);
                    customerList.add(customer);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }


//    @Override
//    public List<Customer> searchByType(Integer type) {
//        List<Customer> customerList = new ArrayList<>();
//        Connection connection = baseRepository.getConnection();
//
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER_BY_TYPE);
//            preparedStatement.setInt(1,  type );
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                Integer id = rs.getInt("ma_khach_hang");
//                String name1 = rs.getString("ho_ten");
//                String birthday = rs.getString("ngay_sinh");
//                Integer gender = rs.getInt("gioi_tinh");
//                String idCard = rs.getString("so_cmnd");
//                String phoneNumber = rs.getString("so_dien_thoai");
//                String email = rs.getString("email");
//                String address = rs.getString("dia_chi");
//                Integer customerTypeId = rs.getInt("ma_loai_khach");
//                Customer customer = new Customer(id, name1,birthday,gender,idCard,phoneNumber,email,address,customerTypeId);
//                customerList.add(customer);
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return customerList;
//    }
//
//    @Override
//    public List<Customer> searchByMail(String mail) {
//        List<Customer> customerList = new ArrayList<>();
//        Connection connection = baseRepository.getConnection();
//
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER_BY_MAIL);
//            preparedStatement.setString(1, "%" + mail + "%");
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                Integer id = rs.getInt("ma_khach_hang");
//                String name1 = rs.getString("ho_ten");
//                String birthday = rs.getString("ngay_sinh");
//                Integer gender = rs.getInt("gioi_tinh");
//                String idCard = rs.getString("so_cmnd");
//                String phoneNumber = rs.getString("so_dien_thoai");
//                String email = rs.getString("email");
//                String address = rs.getString("dia_chi");
//                Integer customerTypeId = rs.getInt("ma_loai_khach");
//                Customer customer = new Customer(id, name1,birthday,gender,idCard,phoneNumber,email,address,customerTypeId);
//                customerList.add(customer);
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return customerList;
//    }



    @Override
    public List<CustomerType> findAllCustomerType() {
        return null;
    }

    @Override
    public Customer selectCustomerByCode(String code) {
        return null;
    }
}
