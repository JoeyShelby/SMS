package test;

import dao.impl.UserDaoImpl;
import org.junit.Test;
import pojo.User;
import utils.JDBCUtils;

import java.sql.Connection;

import static org.junit.Assert.*;

public class UserDaoImplTest extends UserDaoImpl {

    @Test
    public void testQueryUserByUsername() {
        Connection connection = JDBCUtils.getConnection();
        User root = queryUserByUsername(connection, "root");
        JDBCUtils.closeResource(connection);
        System.out.println(root);
    }

    @Test
    public void testQueryUserByUsernameAndPassword() {
        Connection connection = JDBCUtils.getConnection();
        User user = queryUserByUsernameAndPassword(connection, "root", "PassW0rd");
        JDBCUtils.closeResource(connection);
        System.out.println(user);
    }

    @Test
    public void testAddUser() {
        Connection connection = JDBCUtils.getConnection();
        User user = new User("Joey", "227685", "2276852293@qq.com", "1587221778", "向其翔");
        int i = addUser(connection,user);
        JDBCUtils.closeResource(connection);
        System.out.println(i);
    }
}