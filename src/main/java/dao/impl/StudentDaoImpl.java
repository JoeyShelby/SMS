//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package dao.impl;

import dao.BaseDao;
import dao.StudentDao;
import java.sql.Connection;
import java.util.List;
import pojo.Student;

public class StudentDaoImpl extends BaseDao implements StudentDao {
    public StudentDaoImpl() {
    }

    public int addStudent(Connection connection, Student student) {
        String sql = "insert into student (name, sex, birth) value(?,?,?)";
        return this.update(connection, sql, new Object[]{student.getName(), student.getSex(), student.getBirth()});
    }

    public int deleteStudent(Connection connection, Integer num) {
        String sql = "delete from student where num = ?";
        return this.update(connection, sql, new Object[]{num});
    }

    public int updateStudent(Connection connection, Student student) {
        String sql = "update student set name=?, sex=?, birth=? where num = ?";
        return this.update(connection, sql, new Object[]{student.getName(), student.getSex(), student.getBirth(), student.getNum()});
    }

    public Student queryStudentById(Connection connection, Integer num) {
        String sql = "select * from student where num = ?";
        return (Student)this.queryForOne(connection, Student.class, sql, new Object[]{num});
    }

    public Student queryStudentsByName(Connection connection, String name) {
        String sql = "select * from student where name = ?";
        return this.queryForOne(connection, Student.class, sql, name);
    }

    public List<Student> queryStudents(Connection connection) {
        String sql = "select * from student";
        return this.queryForList(connection, Student.class, sql, new Object[0]);
    }

    public long sumStudent(Connection connection) {
        String sql = "select count(*) from Student";
        return (Long)this.queryForSingleValue(connection, sql, new Object[0]);
    }
}
