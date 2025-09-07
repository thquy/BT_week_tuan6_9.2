package murach.cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import murach.business.Product;

import java.io.*;
import java.util.*;

@WebServlet("/loadProducts")
public class ProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Tạo danh sách sản phẩm mẫu (có thể đọc từ file products.txt nếu muốn)
        List<Product> products = new ArrayList<>();
        products.add(new Product("jsp", "Murach's Java Servlets and JSP", 59.50));
        products.add(new Product("java", "Murach's Java Programming", 57.50));
        products.add(new Product("sql", "Murach's SQL for SQL Server", 54.50));

        // Lưu danh sách vào session
        HttpSession session = request.getSession();
        session.setAttribute("products", products);

        // Forward sang index.jsp
        String url = "/index.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
