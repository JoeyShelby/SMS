//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package dao;

import java.sql.Connection;
import java.util.List;
import pojo.Student;

public interface StudentDao {
    int addStudent(Connection var1, Student var2);
    int deleteStudent(Connection var1, Integer var2);
    int updateStudent(Connection var1, Student var2);
    Student queryStudentById(Connection var1, Integer var2);
    Student queryStudentsByName(Connection connection,String name);
    List<Student> queryStudents(Connection var1);
    long sumStudent(Connection var1);
}
