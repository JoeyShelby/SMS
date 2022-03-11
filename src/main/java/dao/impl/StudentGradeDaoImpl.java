//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package dao.impl;

import dao.BaseDao;
import dao.StudentGradeDao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.List;
import pojo.StudentGrade;

public class StudentGradeDaoImpl extends BaseDao implements StudentGradeDao {
    public StudentGradeDaoImpl() {
    }

    public int addStudentGrade(Connection connection, StudentGrade studentGrade) {
        String sql = "insert into student_grade (num, name, math, Java, English, PE, total, average) value(?,?,?,?,?,?,?,?)";
        String name = (new StudentDaoImpl()).queryStudentById(connection, studentGrade.getNum()).getName();
        return this.update(connection, sql, new Object[]{studentGrade.getNum(), name, studentGrade.getMath(), studentGrade.getJava(), studentGrade.getEnglish(), studentGrade.getPE(), studentGrade.getTotal(), studentGrade.getAverage()});
    }

    public int deleteStudentGrade(Connection connection, Integer num) {
        String sql = "delete from student_grade where num = ?";
        return this.update(connection, sql, new Object[]{num});
    }

    public int updateStudentGrade(Connection connection, StudentGrade studentGrade) {
        String sql = "update student_grade set name = ? , math = ? , Java = ? , English = ? , PE = ? , total = ? , average = ? where num = ?";
        return this.update(connection, sql, new Object[]{studentGrade.getName(), studentGrade.getMath(), studentGrade.getJava(), studentGrade.getEnglish(), studentGrade.getPE(), studentGrade.getTotal(), studentGrade.getAverage(), studentGrade.getNum()});
    }

    public StudentGrade queryStudentGradeById(Connection connection, Integer num) {
        String sql = "select * from student_grade where num = ?";
        return (StudentGrade)this.queryForOne(connection, StudentGrade.class, sql, new Object[]{num});
    }

    public List<StudentGrade> queryStudentGrades(Connection connection) {
        String sql = "select * from student_grade";
        return this.queryForList(connection, StudentGrade.class, sql, new Object[0]);
    }

    public  List<StudentGrade> nameSoftQuery(Connection connection,char input,char input1){
        String sql = "select * from student_grade where name like ? or name like ?";
        return this.queryForList(connection,StudentGrade.class,sql,"%"+input+"%","%"+input1+"%");
    }


    public BigDecimal querySumSingleGrade(Connection connection,String subject){
        String sql = "select sum("+subject+") from student_grade";
        return (BigDecimal) this.queryForSingleValue(connection,sql,null);
    }

    public long sumStudentGrade(Connection connection) {
        String sql = "select count(*) from student_grade";
        return (Long)this.queryForSingleValue(connection, sql, new Object[0]);
    }
}
