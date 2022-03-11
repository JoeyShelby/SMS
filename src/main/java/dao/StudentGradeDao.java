//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.List;
import pojo.StudentGrade;

public interface StudentGradeDao {
    int addStudentGrade(Connection var1, StudentGrade var2);

    int deleteStudentGrade(Connection var1, Integer var2);

    int updateStudentGrade(Connection var1, StudentGrade var2);

    StudentGrade queryStudentGradeById(Connection var1, Integer var2);
    //传入科目，查询该课目成绩总分
    BigDecimal querySumSingleGrade(Connection connection, String subject);

    List<StudentGrade> nameSoftQuery(Connection connection , char input,char input1);


    List<StudentGrade> queryStudentGrades(Connection var1);

    long sumStudentGrade(Connection var1);
}
