package uz.pdp.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.service.TodoService;

import java.io.IOException;

@WebServlet(name = "Update Servlet", urlPatterns = "/update/*")
public class UpdateServlet extends HttpServlet {
    private final TodoService todoService = TodoService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean completed = Boolean.parseBoolean(req.getParameter("completed"));
        String substring = req.getPathInfo().substring(1);
        Integer id = Integer.parseInt(substring);

        todoService.update(completed, id);
        resp.sendRedirect("/");

    }


}
