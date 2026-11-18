package uz.pdp.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.entity.Profile;
import uz.pdp.service.TodoService;

import java.io.IOException;

@WebServlet(name = "Home Servlet", urlPatterns = "/")
public class HomeServlet extends HttpServlet {
    private final TodoService todoService = TodoService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session != null) {
            Profile profile = (Profile) session.getAttribute("profile");
            if (profile == null) {
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
            req.setAttribute("allTodo", todoService.getAll(profile));
            req.getRequestDispatcher("home.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
