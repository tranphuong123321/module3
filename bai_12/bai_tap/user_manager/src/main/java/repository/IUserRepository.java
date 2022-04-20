package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public void insertUser(User user);

    public void updateUser(User user);

    public void deleteUser(int id);

    public User selectUser(int id);

    public List<User> selectAllUsers();


    public List<User> searchByName(String name);

    public List<User> searchByCountry(String country);

    public List<User> orderByName();
}
