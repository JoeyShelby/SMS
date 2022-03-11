package web;

import com.google.gson.Gson;
import lombok.extern.java.Log;
import pojo.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

public class UserServlet extends BaseServlet {
    UserServiceImpl userService = new UserServiceImpl();

    protected void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String truename = req.getParameter("truename");
        User user = new User(username, password, email, phone, truename);

        int i = userService.addUser(user);
        System.out.println("注册用户"+i);

        HttpSession session = req.getSession();
        session.setAttribute("user",user);

        req.getRequestDispatcher("/pages/account/signUpSuccess.jsp").forward(req,resp);

    }
    protected void queryUserByUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        //false代表当前输入的用户名不存在
        boolean exist = false;
        if (username!=null){
            User user = userService.queryUserByUsername(username);
            System.out.println(user);
            if(user!=null){
                //根据用户名查询到的用户不为空，用户名重复
                exist = true;
            }
        }
        HashMap<String, Object> data = new HashMap<>();
        data.put("exist",exist);
        Gson gson = new Gson();

        String s = gson.toJson(data);
        resp.getWriter().write(s);
    }
    protected void queryUserByUsernameAndPassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userService.queryUserByUsernameAndPassword(username, password);

        System.out.println(user);
        HashMap<String, Object> data = new HashMap<>();
        data.put("user", user);
        Gson gson = new Gson();
        String s = gson.toJson(data);
        resp.getWriter().write(s);
    }

    protected void loginSuccess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        User user = userService.queryUserByUsername(username);
        HttpSession session = req.getSession();
        session.setAttribute("user",user);
        req.setAttribute("username",username);
        req.getRequestDispatcher("/pages/account/loginSuccess.jsp").forward(req,resp);

        System.out.println(req.getContextPath());
    }

    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object user = session.getAttribute("user");
        if(user!=null){
            session.invalidate();
        }

        resp.sendRedirect("http://localhost:8080/SMS/");
    }
}
