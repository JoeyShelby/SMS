//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package dao.impl;

import dao.BaseDao;
import dao.GradeDao;
import java.sql.Connection;

import pojo.Grade;

public class GradeDaoImpl extends BaseDao implements GradeDao {
    StudentGradeDaoImpl studentGrade = new StudentGradeDaoImpl();

    public GradeDaoImpl() {
    }

    public int addGrade(Connection connection, Grade grade) {
        String sql = "insert into grade ( math_total, Java_total, english_total, PE_total, math_average, Java_average, english_average, PE_average, total, total_average) value(?,?,?,?,?,?,?,?,?,?)";
        return this.update(connection, sql, new Object[]{grade.getMath_total(), grade.getJava_total(), grade.getEnglish_total(), grade.getPE_total(), grade.getMath_average(), grade.getJava_average(), grade.getEnglish_average(), grade.getPE_average(), grade.getTotal(), grade.getTotal_average()});
    }

    public int deleteGrade(Connection connection) {
        String sql = "delete from grade";
        return this.update(connection, sql, new Object[0]);
    }

    public int updateGrade(Connection connection, Grade grade) {
        String sql = "update grade set math_total = ? , Java_total = ? , english_total = ? , PE_total = ? , math_average = ? , Java_average = ? , english_average = ? , PE_average = ? , total = ? , total_average = ?";
        return this.update(connection, sql, new Object[]{grade.getMath_total(), grade.getJava_total(), grade.getEnglish_total(), grade.getPE_total(), grade.getMath_average(), grade.getJava_average(), grade.getEnglish_average(), grade.getPE_average(), grade.getTotal(), grade.getTotal_average()});
    }

    public Grade queryGrade(Connection connection) {
        String sql = "select * from grade";
        return (Grade)this.queryForOne(connection, Grade.class, sql, new Object[0]);
    }
}
