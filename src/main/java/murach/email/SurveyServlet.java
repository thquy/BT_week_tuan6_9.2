package murach.email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import murach.business.User;

public class SurveyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String heardFrom = request.getParameter("hear");
        String wantsUpdates = request.getParameter("offers");
        String contact = request.getParameter("contact");

        String url = "/survey.jsp";

        if (firstName == null || firstName.isEmpty()
                || lastName == null || lastName.isEmpty()
                || email == null || email.isEmpty()) {
            request.setAttribute("message", "All fields (First Name, Last Name, Email) are required!");
            url = "/index.jsp";
        } else {
            User user = new User();
            user.setEmail(email);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setDob(dob);
            user.setHeardFrom(heardFrom);
            user.setWantsUpdates(wantsUpdates != null ? "Yes" : "No");
            user.setContactVia(contact);

            request.setAttribute("user", user);
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
