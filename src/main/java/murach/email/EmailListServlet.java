package murach.email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import murach.business.User;
import murach.data.UserDB;
import java.time.Year;   // để lấy năm hiện tại

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/index.jsp";   // mặc định quay lại form
        String action = request.getParameter("action");
        if (action == null) {
            action = "join"; // mặc định
        }

        // ✅ set currentYear cho mọi request (bài 6-1)
        int currentYear = Year.now().getValue();
        request.setAttribute("currentYear", currentYear);

        // Debug log
        System.out.println("DEBUG: action=" + action);
        getServletContext().log("Servlet log: action=" + action);

        if (action.equals("join")) {
            url = "/index.jsp";
        } else if (action.equals("add")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            // Kiểm tra dữ liệu
            if (firstName == null || firstName.isEmpty()
                    || lastName == null || lastName.isEmpty()
                    || email == null || email.isEmpty()) {

                String message = "All three fields are required!";
                request.setAttribute("message", message);
                url = "/index.jsp";

                System.out.println("DEBUG: Validation failed");
                getServletContext().log("Validation failed - missing values");

            } else {
                User user = new User(firstName, lastName, email);
                UserDB.insert(user);

                request.setAttribute("user", user);
                url = "/thanks.jsp";

                System.out.println("DEBUG: user=" + firstName + " " + lastName + ", email=" + email);
                getServletContext().log("New user added: " + email);
            }
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // gọi doPost để test GET như yêu cầu bài 5-1 và 6-1
        doPost(request, response);
    }
}
