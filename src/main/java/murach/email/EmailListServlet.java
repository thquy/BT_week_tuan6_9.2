package murach.email;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import murach.business.User;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/index.jsp";
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";
        }

        if (action.equals("join")) {
            url = "/index.jsp";
        } else if (action.equals("add")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String heardFrom = request.getParameter("hear");
            String updates = request.getParameter("offers");
            String contact = request.getParameter("contact");

            if (firstName == null || firstName.isEmpty()
                    || lastName == null || lastName.isEmpty()
                    || email == null || email.isEmpty()) {
                String message = "All three fields (first name, last name, email) are required!";
                request.setAttribute("message", message);
                url = "/index.jsp";
            } else {
                User user = new User();
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                user.setDob(dob);
                user.setHeardFrom(heardFrom);
                user.setWantsUpdates(updates != null ? "Yes" : "No");
                user.setContactVia(contact);

                // Lưu user vào request
                request.setAttribute("user", user);

                // Lưu currentDate vào request
                request.setAttribute("currentDate", new Date());

                // Lưu danh sách users vào session
                HttpSession session = request.getSession();
                List<User> users = (List<User>) session.getAttribute("users");
                if (users == null) {
                    users = new ArrayList<>();
                }
                users.add(user);
                session.setAttribute("users", users);

                url = "/thanks.jsp";
            }
        }

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
