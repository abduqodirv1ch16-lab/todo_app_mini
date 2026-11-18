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

@WebServlet(name = "Todo Create", urlPatterns = "/create")
public class TodoCreateServlet extends HttpServlet {
    private final TodoService todoService = TodoService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String todo = req.getParameter("todo");

        HttpSession session = req.getSession(false);
        Profile profile = (Profile) session.getAttribute("profile");

        todoService.create(todo, profile);
        resp.sendRedirect("/");
    }
}
