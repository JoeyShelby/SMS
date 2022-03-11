package service.impl;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import dao.StudentDao;
import dao.impl.GradeDaoImpl;
import dao.impl.StudentDaoImpl;
import dao.impl.StudentGradeDaoImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import pojo.Grade;
import pojo.Student;
import pojo.StudentGrade;
import service.StudentGradeService;
import utils.JDBCUtils;

public class StudentGradeServiceImpl implements StudentGradeService {
    StudentGradeDaoImpl studentGradeDaoImpl = new StudentGradeDaoImpl();
    StudentDaoImpl studentDao = new StudentDaoImpl();
    GradeDaoImpl gradeDaoImpl = new GradeDaoImpl();

    public int addStudentGrade(StudentGrade studentGrade) {
        Connection connection = JDBCUtils.getConnection();
        int i = this.studentGradeDaoImpl.addStudentGrade(connection, studentGrade);
        JDBCUtils.closeResource(connection);
        return i;
    }

    public StudentGrade queryStudentGrade(int num) {
        Connection connection = JDBCUtils.getConnection();
        StudentGrade studentGrade = this.studentGradeDaoImpl.queryStudentGradeById(connection, num);
        JDBCUtils.closeResource(connection);
        return studentGrade;
    }

    public List<StudentGrade> queryGrades(){
        Connection connection = JDBCUtils.getConnection();
        List<StudentGrade> StudentGrades = studentGradeDaoImpl.queryStudentGrades(connection);
        JDBCUtils.closeResource(connection);
        return StudentGrades;
    }

    public int deleteStudentGrade(int num){
        Connection connection = JDBCUtils.getConnection();
        int i = studentGradeDaoImpl.deleteStudentGrade(connection, num);
        JDBCUtils.closeResource(connection);
        return i;
    }

    public Grade queryGradeALL(){
        Connection connection = JDBCUtils.getConnection();
        Grade grade = gradeDaoImpl.queryGrade(connection);
        JDBCUtils.closeResource(connection);
        return grade;
    }

    public List<StudentGrade> nameSoftQuery(String input){
        Connection connection = JDBCUtils.getConnection();
        char input1 = input.charAt(0);
        char input2 = input.charAt(input.length()-1);

        List<StudentGrade> studentGrades = studentGradeDaoImpl.nameSoftQuery(connection, input1,input2);
        JDBCUtils.closeResource(connection);
        return studentGrades;
    }

    public int updateStudentGrade(StudentGrade studentGrade) {
        Connection connection = JDBCUtils.getConnection();
        int i = this.studentGradeDaoImpl.updateStudentGrade(connection, studentGrade);
        JDBCUtils.closeResource(connection);
        return i;
    }


    public void gradeStatement() {
        Connection connection = JDBCUtils.getConnection();
        /*更新Grade表中内容*/
        Double mathSum = studentGradeDaoImpl.querySumSingleGrade(connection,"math").doubleValue();
        Double JavaSum = studentGradeDaoImpl.querySumSingleGrade(connection,"Java").doubleValue();
        Double EnglishSum = studentGradeDaoImpl.querySumSingleGrade(connection,"English").doubleValue();
        Double PESum = studentGradeDaoImpl.querySumSingleGrade(connection,"PE").doubleValue();
        //学生总数，获取平均数用
        Long studentSum = studentGradeDaoImpl.sumStudentGrade(connection);
        Double math_average = mathSum / studentSum;
        Double Java_average = JavaSum / studentSum;
        Double English_average = EnglishSum / studentSum;
        Double PE_average = PESum / studentSum;
        Double gradeSum = mathSum + JavaSum + EnglishSum + PESum;
        Double gradeAverage = gradeSum / 4;
        gradeDaoImpl.updateGrade(connection,new Grade(mathSum,JavaSum,EnglishSum,PESum,math_average,Java_average,English_average,PE_average,gradeSum,gradeAverage));
        /*连接超时*/
        JDBCUtils.closeResource(connection);
        connection = JDBCUtils.getConnection();
        /*生成excel文件*/
        List<StudentGrade> studentGrades = studentGradeDaoImpl.queryStudentGrades(connection);
        ArrayList<Grade> grades = new ArrayList<>();
        Grade grade = gradeDaoImpl.queryGrade(connection);
        grades.add(grade);
        // 输出流
        OutputStream outputStream = null;
        try {
            outputStream = new FileOutputStream(new File("D:\\CODE\\Web\\SMS\\target\\SMS-1.0\\GradeReport.xlsx"));
        }catch (Exception e){
            e.printStackTrace();
        }

        ExcelWriter writer = EasyExcel.write(outputStream).build();
        WriteSheet sheet1 = EasyExcel.writerSheet(0, "学生个人成绩").head(StudentGrade.class).build();
        WriteSheet sheet2 = EasyExcel.writerSheet(1, "综合成绩").head(Grade.class).build();

        writer.write(studentGrades,sheet1).write(grades,sheet2);
        writer.finish();

        JDBCUtils.closeResource(connection);
    }
}
