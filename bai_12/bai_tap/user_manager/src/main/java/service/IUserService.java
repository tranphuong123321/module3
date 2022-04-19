package service;

import model.User;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IUserService {
    public void insertUser(User user);

    public void updateUser(User user);

    public void deleteUser(int id);

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public List<User> searchByName(String name);

    public List<User> searchById(Integer id);

}
