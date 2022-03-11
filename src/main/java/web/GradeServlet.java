//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package web;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.util.IOUtils;
import org.junit.Test;
import pojo.Grade;
import pojo.Student;
import pojo.StudentGrade;
import service.impl.StudentGradeServiceImpl;
import service.impl.StudentServiceImpl;

public class GradeServlet extends BaseServlet {
    StudentGradeServiceImpl studentGradeService = new StudentGradeServiceImpl();
    StudentServiceImpl studentService = new StudentServiceImpl();

    protected void queryStudentByNum(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num = req.getParameter("num");
        Student student = this.studentService.queryStudentByNum(Integer.parseInt(num));
        StudentGrade studentGrade = this.studentGradeService.queryStudentGrade(Integer.parseInt(num));
        Boolean exist = false;
        if (studentGrade != null) {
            exist = false;
        } else {
            exist = true;
        }

        Gson gson = new Gson();
        HashMap<String, Object> data = new HashMap();
        data.put("student", student);
        data.put("exist", exist);
        String s = gson.toJson(data);
        resp.getWriter().write(s);
    }

    protected void addGrade(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer num = Integer.parseInt(req.getParameter("num"));
        String name = null;
        Student student = this.studentService.queryStudentByNum(num);
        int state = 0;
        if (student != null) {
            name = student.getName();
            double math = req.getParameter("math").length() == 0 ? 0.0D : Double.parseDouble(req.getParameter("math"));
            double Java = req.getParameter("java").length() == 0 ? 0.0D : Double.parseDouble(req.getParameter("java"));
            double English = req.getParameter("english").length() == 0 ? 0.0D : Double.parseDouble(req.getParameter("english"));
            double PE = req.getParameter("PE").length() == 0 ? 0.0D : Double.parseDouble(req.getParameter("PE"));
            double total = math + Java + English + PE;
            double average = (math + Java + English + PE) / 4.0D;
            StudentGrade studentGrade = new StudentGrade(num, name, math, Java, English, PE, total, average);
            state = this.studentGradeService.addStudentGrade(studentGrade);
        }

        if (state != 1) {
            if (state == 0) {
                System.out.println("查无此人" + state);
            } else {
                System.out.println("该学生的成绩已经存在" + state);
            }
        } else {
            System.out.println("学生成绩保存成功" + state);
        }

        resp.sendRedirect(req.getContextPath()+"/pages/grade/Finished.html");
    }

    protected void queryGrade(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String flag = req.getParameter("flag");
        Integer num = null;
        String name = null;
        Student student = null;
        StudentGrade studentGrade = null;

        if("num".equals(flag)){
            num = Integer.parseInt(req.getParameter("num"));
            student = this.studentService.queryStudentByNum(num);
            studentGrade = studentGradeService.queryStudentGrade(num);
        }else{
            name = req.getParameter("name");
            student = studentService.queryStudentsByName(name);
            studentGrade = studentGradeService.queryStudentGrade(student.getNum());
        }
            HashMap<String, Object> data = new HashMap();
            data.put("student", student);
            data.put("studentGrade", studentGrade);
            Gson gson = new Gson();
            String s = gson.toJson(data);
            resp.getWriter().write(s);
    }

    protected void updateGrade(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num = req.getParameter("num");
        String name = null;
        Student student = this.studentService.queryStudentByNum(Integer.parseInt(num));
        StudentGrade grade = this.studentGradeService.queryStudentGrade(Integer.parseInt(num));
        if (grade != null) {
            name = student.getName();
            double math = req.getParameter("math").length() == 0 ? 0.0D : Double.parseDouble(req.getParameter("math"));
            double Java = req.getParameter("java").length() == 0 ? 0.0D : Double.parseDouble(req.getParameter("java"));
            double English = req.getParameter("english").length() == 0 ? 0.0D : Double.parseDouble(req.getParameter("english"));
            double PE = req.getParameter("PE").length() == 0 ? 0.0D : Double.parseDouble(req.getParameter("PE"));
            double total = math + Java + English + PE;
            double average = (math + Java + English + PE) / 4.0D;
            StudentGrade studentGrade = new StudentGrade(Integer.parseInt(num), name, math, Java, English, PE, total, average);
            int i = this.studentGradeService.updateStudentGrade(studentGrade);
            System.out.println("修改学生成绩" + i);
        }

        resp.sendRedirect(req.getContextPath()+"/pages/grade/Finished.html");
    }

    protected void gradeStatement(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        studentGradeService.gradeStatement();
        /*获取要下载的文件名*/
        String fileName = "GradeReport.xlsx";

        /*读取要下载的文件内容*/
        ServletContext servletContext = getServletContext();
        String mimeType = servletContext.getMimeType("/" + fileName);
        resp.setHeader("Content-Disposition","attachment; filename="+fileName);

        InputStream resourceAsStream = servletContext.getResourceAsStream("/" + fileName);
        ServletOutputStream outputStream = resp.getOutputStream();
        IOUtils.copy(resourceAsStream,outputStream);
    }

    protected void deleteStudentGrade(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num = req.getParameter("num");
        int i = studentGradeService.deleteStudentGrade(Integer.parseInt(num));
        System.out.println("删除学生成绩"+i);
        resp.sendRedirect(req.getContextPath()+"/pages/grade/UpdateGrade.jsp");
    }

    protected void queryStudentGradeByNumForUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num = req.getParameter("num");
        StudentGrade studentGrade = studentGradeService.queryStudentGrade(Integer.parseInt(num));
        req.setAttribute("studentGrade",studentGrade);
        req.getRequestDispatcher("/pages/grade/UpdateGradeForm.jsp").forward(req,resp);
    }

    protected void nameSoftQuery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String input = req.getParameter("input");
        List<StudentGrade> studentGrades = studentGradeService.nameSoftQuery(input);
        HashMap<String, Object> data = new HashMap<>();
        data.put("data",studentGrades);

        //消息数据标准化
        if(studentGrades!=null){
            data.put("code",0);
            data.put("cout",studentGrades.size());
            data.put("msg","");
        }
        else{
            data.put("code",500);
            data.put("cout",0);
            data.put("msg","null");
        }

        Gson gson = new Gson();
        String s = gson.toJson(data);
        resp.getWriter().write(s);
    }

    protected void queryGradeALL(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Grade grade = studentGradeService.queryGradeALL();

        HashMap<String, Object> data = new HashMap<>();
        data.put("grade",grade);

        Gson gson = new Gson();
        String s = gson.toJson(data);
        resp.getWriter().write(s);
    }

    protected void queryStudentGradesAsJson(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<StudentGrade> studentGrades = studentGradeService.queryGrades();
        HashMap<String, Object> data = new HashMap<>();
        data.put("data",studentGrades);

        //消息数据标准化
        if(studentGrades!=null){
            data.put("code",0);
            data.put("cout",studentGrades.size());
            data.put("msg","");
        }
        else{
            data.put("code",500);
            data.put("cout",0);
            data.put("msg","null");
        }

        Gson gson = new Gson();
        String s = gson.toJson(data);
        resp.getWriter().write(s);
    }

    protected void queryStudentByNumForAddGrade(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num = req.getParameter("num");

        req.setAttribute("num",num);

        req.getRequestDispatcher("/pages/grade/AddGradeForm.jsp").forward(req,resp);

    }
}
