package murach.email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import murach.business.User;

public class SurveyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy dữ liệu từ form
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String heardFrom = request.getParameter("hear");
        String wantsUpdates = request.getParameter("offers");
        String contact = request.getParameter("contact");

        // Tạo user object
        User user = new User();
        user.setEmail(email);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setDob(dob);
        user.setHeardFrom(heardFrom);
        user.setWantsUpdates(wantsUpdates != null ? "Yes" : "No");
        user.setContactVia(contact);

        // Gửi sang JSP
        request.setAttribute("user", user);

        String url = "/survey.jsp";
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
