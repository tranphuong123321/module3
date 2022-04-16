package service;

import model.User;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IUserService {
    void insertUser(User user) throws SQLException;

    User selectUserById(Integer id);

    List<User> selectAllUser();

    boolean deleteUser(Integer id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    List<User> searchUserByCountry(String country);

    List<User> sortByName();

    Map<String, String> check(User user);
}
