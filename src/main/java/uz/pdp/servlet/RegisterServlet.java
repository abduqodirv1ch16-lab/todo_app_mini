package uz.pdp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.service.ProfileService;

import java.io.IOException;

@WebServlet(name = "Register page", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    private final ProfileService profileService = ProfileService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        boolean register = profileService.register(fullName, username, password);
        if (register) resp.sendRedirect("/login");
        else resp.sendRedirect("/register");
    }
}
