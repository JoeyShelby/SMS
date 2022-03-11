package service;

import pojo.User;

import java.sql.Connection;

public interface UserService {
    int addUser(User user);
    User queryUserByUsername(String username);
    User queryUserByUsernameAndPassword(String username,String password);
}
