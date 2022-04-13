package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CustomersServlet", value = "/CustomersServlet")
public class CustomersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        ArrayList<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","1.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","2.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hoà","1983-08-22","Nam Định","3.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-17","Hà Tây","4.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","5.jpg"));
        request.setAttribute("customersList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("listCustomer.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
