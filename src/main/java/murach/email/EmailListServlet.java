package murach.email;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import murach.business.User;
import murach.data.UserDB;

public class EmailListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/index.html";

        // lấy action từ request
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // mặc định
        }

        // xử lý action
        if (action.equals("join")) {
            url = "/index.html";  // quay lại form nhập
        } else if (action.equals("add")) {
            // lấy dữ liệu từ form
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            // tạo đối tượng User
            User user = new User(firstName, lastName, email);

            // lưu user vào “database” giả lập
            UserDB.insert(user);

            // gửi user sang thanks.jsp
            request.setAttribute("user", user);
            url = "/thanks.jsp";
        }

        // forward sang trang đích
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
