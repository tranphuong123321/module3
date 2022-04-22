package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    IUserRepository iUserRepository = new UserRepository();
    @Override
    public List<User> selectAllUsers() {
        return iUserRepository.selectAllUsers();
    }
}
