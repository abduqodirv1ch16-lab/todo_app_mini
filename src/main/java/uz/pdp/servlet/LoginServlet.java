package uz.pdp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import uz.pdp.entity.Profile;
import uz.pdp.service.ProfileService;

import java.io.IOException;

@WebServlet(name = "Login Page", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private final ProfileService profileService = ProfileService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Profile profile = profileService.login(username, password);

        System.out.println(profile);

        if (profile != null) {
            HttpSession session = req.getSession();
            session.setAttribute("profile", profile);

            Cookie cookie = new Cookie("username", profile.getUserName());
            cookie.setMaxAge(60 * 60);
            cookie.setPath("/");

            resp.addCookie(cookie);

            resp.sendRedirect(req.getContextPath() + "/");
        } else {
            resp.sendRedirect(req.getContextPath() + "/login");
        }

    }
}
