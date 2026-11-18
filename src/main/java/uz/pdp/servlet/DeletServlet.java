package uz.pdp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.service.TodoService;

import java.io.IOException;

@WebServlet(name = "Delete Servlet", urlPatterns = "/delete")
public class DeletServlet extends HttpServlet {
    private final TodoService todoService = TodoService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Integer id = Integer.valueOf(req.getParameter("id"));
        todoService.delete(id);
        resp.sendRedirect("/");

    }

}
