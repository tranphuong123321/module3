package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.*;

public class UserService implements IUserService {

    IUserRepository iUserRepository = new UserRepository();

    @Override
    public void insertUser(User user) {
        iUserRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return iUserRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserRepository.selectAllUsers();
    }

    @Override
    public void deleteUser(int id) {
        iUserRepository.deleteUser(id);
    }

    @Override
    public void updateUser(User user) {
        iUserRepository.updateUser(user);
    }

    @Override
    public List<User> searchByName(String name) {
        return iUserRepository.searchByName(name);
    }

    @Override
    public List<User> searchById(Integer id) {
        return iUserRepository.searchById(id);
    }


}