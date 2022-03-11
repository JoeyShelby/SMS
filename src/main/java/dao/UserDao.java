package dao;

import pojo.User;

import java.sql.Connection;

public interface UserDao {
    User queryUserByUsername(Connection connection, String username);
    User queryUserByUsernameAndPassword(Connection connection, String username,String password);
    int  addUser(Connection connection, User user);
}
