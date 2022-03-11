//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package test;

import dao.impl.GradeDaoImpl;
import java.sql.Connection;
import org.junit.Test;
import pojo.Grade;
import utils.JDBCUtils;

public class GradeDaoImplTest extends GradeDaoImpl {
    public GradeDaoImplTest() {
    }

    @Test
    public void testAddGrade() {
        Connection connection = JDBCUtils.getConnection();
        int i = this.addGrade(connection, new Grade(8.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D));
        System.out.println(i);
        JDBCUtils.closeResource(connection);
    }

    @Test
    public void testDeleteGrade() {
        Connection connection = JDBCUtils.getConnection();
        this.deleteGrade(connection);
        JDBCUtils.closeResource(connection);
    }

    @Test
    public void testUpdateGrade() {
        Connection connection = JDBCUtils.getConnection();
        int i = this.updateGrade(connection, new Grade(9.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D, 8.9D));
        System.out.println(i);
        JDBCUtils.closeResource(connection);
    }

    @Test
    public void testQueryGrade() {
    }
}
