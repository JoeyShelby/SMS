//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package service;

import pojo.Grade;
import pojo.Student;
import pojo.StudentGrade;

import java.util.List;

public interface StudentGradeService {
    int addStudentGrade(StudentGrade var1);
    StudentGrade queryStudentGrade(int var1);
    int updateStudentGrade(StudentGrade var1);
    List<StudentGrade> queryGrades();
    List<StudentGrade> nameSoftQuery(String input);
    int deleteStudentGrade(int num);
    Grade queryGradeALL();
    void gradeStatement();
}
