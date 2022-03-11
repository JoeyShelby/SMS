//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package test;

import dao.impl.StudentGradeDaoImpl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.List;
import org.junit.Test;
import pojo.StudentGrade;
import utils.JDBCUtils;

public class StudentGradeDaoImplTest extends StudentGradeDaoImpl {
    public StudentGradeDaoImplTest() {
    }

    @Test
    public void testAddStudentGrade() {
        Connection connection = JDBCUtils.getConnection();
        this.addStudentGrade(connection, new StudentGrade(14, 99.5D, 98.5D, 99.5D, 98.5D, 98.5D, 98.5D));
        JDBCUtils.closeResource(connection);
    }

    @Test
    public void testDeleteStudentGrade() {
        Connection connection = JDBCUtils.getConnection();
        System.out.println(this.deleteStudentGrade(connection, 1));
        JDBCUtils.closeResource(connection);
    }

    @Test
    public void testUpdateStudentGrade() {
    }

    @Test
    public void testQueryStudentGradeById() {
    }

    @Test
    public void testQueryStudentGrades() {
        Connection connection = JDBCUtils.getConnection();
        List<StudentGrade> studentGrades = this.queryStudentGrades(connection);
        System.out.println(studentGrades);
        JDBCUtils.closeResource(connection);
    }

    @Test
    public void testQuerySumSingleGrade() {
        Connection connection = JDBCUtils.getConnection();
        BigDecimal math = querySumSingleGrade(connection, "math");
       System.out.println(math);
        JDBCUtils.closeResource(connection);
    }

    @Test
    public void testNameSoftQuery(){
        Connection connection = JDBCUtils.getConnection();
        List<StudentGrade> studentGrades = nameSoftQuery(connection, 'y','i');
        JDBCUtils.closeResource(connection);
        System.out.println(studentGrades);
    }


    @Test
    public void testSumStudentGrade() {
        Connection connection = JDBCUtils.getConnection();
        System.out.println(sumStudentGrade(connection));
        JDBCUtils.closeResource(connection);
    }
}
