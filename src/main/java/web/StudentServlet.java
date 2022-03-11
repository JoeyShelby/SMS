//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package web;

import com.google.gson.Gson;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Student;
import service.impl.StudentServiceImpl;

public class StudentServlet extends BaseServlet {
    StudentServiceImpl service = new StudentServiceImpl();

    protected  void queryStudentsAsJson(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> students = service.queryStudents();

        HashMap<String, Object> data = new HashMap<>();
        data.put("data",students);
        if(students!=null){
            data.put("msg","");
            data.put("cout",students.size());
            data.put("code",0);
        }
        else{
            data.put("msg","无法获取到学生成绩");
            data.put("cout",0);
            data.put("code",1);
        }



        Gson gson = new Gson();
        String s = gson.toJson(data);
        resp.getWriter().write(s);
    }

    protected void addStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String sex = req.getParameter("sex");
        String birth = req.getParameter("birth");
        Student student = new Student(name, sex, birth);
        System.out.println(this.service.addStudent(student));
//        resp.sendRedirect("http://localhost:8080/SMS/pages/student/AddStudent.jsp");
        resp.sendRedirect(req.getContextPath()+"/pages/student/AddStudent.jsp");
    }

        protected void queryStudentByNum(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num = req.getParameter("num");
        Student student = this.service.queryStudentByNum(Integer.parseInt(num));
        Gson gson = new Gson();
        HashMap<String, Student> stringStudentMap = new HashMap();
        stringStudentMap.put("student", student);
        String s = gson.toJson(stringStudentMap);
        resp.getWriter().write(s);
    }

    protected void queryStudentByNumForUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num = req.getParameter("num");
        Student student = this.service.queryStudentByNum(Integer.parseInt(num));
        req.setAttribute("student",student);
        req.getRequestDispatcher("/pages/student/UpdateStudent.jsp").forward(req,resp);
    }

    protected void updateStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num = req.getParameter("num");
        String name = null;
        String sex = null;
        String birth = null;
        Student studentOld = this.service.queryStudentByNum(Integer.parseInt(num));
        if (req.getParameter("name").length() != 0) {
            name = req.getParameter("name");
        } else {
            name = studentOld.getName();
        }

        if (req.getParameter("sex").length() != 0) {
            sex = req.getParameter("sex");
        } else {
            sex = studentOld.getSex();
        }

        if (req.getParameter("birth").length() != 0) {
            birth = req.getParameter("birth");
        } else {
            birth = studentOld.getBirth();
        }

        Student student = new Student(Integer.parseInt(num), name, sex, birth);
        this.service.updateStudent(student);

        resp.sendRedirect(req.getContextPath()+"pages/student/updateFinished.html");
    }

    protected void deleteStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num = req.getParameter("num");
        System.out.println(this.service.deleteStudent(Integer.parseInt(num)));
        resp.sendRedirect(req.getContextPath()+"/pages/student/EditStudent.jsp");
    }
}
