//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package service;

import pojo.Student;

import java.util.List;

public interface StudentService {
    int addStudent(Student var1);

    int deleteStudent(int var1);

    List<Student> queryStudents();

    Student queryStudentByNum(int var1);

    Student queryStudentsByName(String name);

    int updateStudent(Student var1);
}
