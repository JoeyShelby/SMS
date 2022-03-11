//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package service.impl;

import dao.impl.StudentDaoImpl;
import java.sql.Connection;
import java.util.List;

import pojo.Student;
import service.StudentService;
import utils.JDBCUtils;

public class StudentServiceImpl implements StudentService {
    StudentDaoImpl studentDao = new StudentDaoImpl();

    public StudentServiceImpl() {
    }

    public int addStudent(Student student) {
        Connection connection = JDBCUtils.getConnection();
        int num = this.studentDao.addStudent(connection, student);
        JDBCUtils.closeResource(connection);
        return num;
    }

    public Student queryStudentByNum(int num) {
        Connection connection = JDBCUtils.getConnection();
        Student student = this.studentDao.queryStudentById(connection, num);
        JDBCUtils.closeResource(connection);
        return student;
    }

    public Student queryStudentsByName(String name) {
        Connection connection = JDBCUtils.getConnection();
        Student student = this.studentDao.queryStudentsByName(connection, name);
        JDBCUtils.closeResource(connection);
        return student;
    }

    public int deleteStudent(int num) {
        Connection connection = JDBCUtils.getConnection();
        int i = this.studentDao.deleteStudent(connection, num);
        JDBCUtils.closeResource(connection);
        return i;
    }

    public List<Student> queryStudents(){
        Connection connection = JDBCUtils.getConnection();
        List<Student> students = studentDao.queryStudents(connection);
        JDBCUtils.closeResource(connection);
        return students;
    }

    public int updateStudent(Student student) {
        Connection connection = JDBCUtils.getConnection();
        int i = this.studentDao.updateStudent(connection, student);
        JDBCUtils.closeResource(connection);
        return i;
    }
}
