package dao.impl;

import dao.BaseDao;
import dao.UserDao;
import pojo.StudentGrade;
import pojo.User;

import java.sql.Connection;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public User queryUserByUsername(Connection connection, String username) {
        String sql = "select * from user where username = ?";
        return this.queryForOne(connection, User.class, sql, username);
    }

    @Override
    public User queryUserByUsernameAndPassword(Connection connection,String username,String password) {
        String sql = "select * from user where username = ? and password = ?";
        return this.queryForOne(connection, User.class, sql, username,password);
    }

    @Override
    public int addUser(Connection connection,User user) {
        String sql = "insert into user values(?,?,?,?,?)";
        return this.update(connection, sql, user.getUsername(),user.getPassword(),user.getEmail(),user.getTel(),user.getName());
    }
}
