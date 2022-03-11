//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package test;

import dao.impl.StudentDaoImpl;
import java.sql.Connection;
import java.text.ParseException;
import java.util.Iterator;
import java.util.List;
import org.junit.Test;
import pojo.Student;
import utils.JDBCUtils;

public class StudentDaoImplTest extends StudentDaoImpl {
    public StudentDaoImplTest() {
    }

    @Test
    public void testAddStudent() throws ParseException {
        Connection connection = JDBCUtils.getConnection();
        Student student = new Student("德巴", "男", "2000-02-28");
        System.out.println(this.addStudent(connection, student));
        JDBCUtils.closeResource(connection);
    }

    @Test
    public void testDeleteStudent() {
    }

    @Test
    public void testUpdateStudent() {
    }

    @Test
    public void testQueryStudentsByName() {
        Connection connection = JDBCUtils.getConnection();
        Student student = queryStudentsByName(connection, "Joey");
        System.out.println(student);
        JDBCUtils.closeResource(connection);
    }



    @Test
    public void testQueryStudents() {
        Connection connection = JDBCUtils.getConnection();
        List<Student> students = this.queryStudents(connection);
        Iterator var3 = students.iterator();

        while(var3.hasNext()) {
            Student student = (Student)var3.next();
            System.out.println(student);
        }

        JDBCUtils.closeResource(connection);
    }

    @Test
    public void testSumStudent() {
    }
}
