package service.impl;

import dao.impl.UserDaoImpl;
import pojo.User;
import service.UserService;
import utils.JDBCUtils;

import java.sql.Connection;

public class UserServiceImpl implements UserService {
    UserDaoImpl userDao = new UserDaoImpl();
    @Override
    public int addUser(User user) {
        Connection connection = JDBCUtils.getConnection();
        int i = userDao.addUser(connection,user);
        JDBCUtils.closeResource(connection);
        return i;
    }

    @Override
    public User queryUserByUsername(String username) {
        Connection connection = JDBCUtils.getConnection();
        User user = userDao.queryUserByUsername(connection, username);
        JDBCUtils.closeResource(connection);
        return user;
    }

    @Override
    public User queryUserByUsernameAndPassword(String username,String password) {
        Connection connection = JDBCUtils.getConnection();
        User user = userDao.queryUserByUsernameAndPassword(connection, username,password);
        JDBCUtils.closeResource(connection);
        return user;
    }
}
