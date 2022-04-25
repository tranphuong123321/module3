package controller;

import model.Customer;
import model.CustomerType;
import model.Facility;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.IFacilityService;
import service.impl.CustomerService;
import service.impl.CustomerTypeService;
import service.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {

    private Customer customer;
    private ICustomerService customerService = new CustomerService();
    private ICustomerTypeService customerTypeService = new CustomerTypeService();


    public void init() {
        customer = new Customer();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "search":
                searchByName(request, response);
                break;

            default:
                listCustomer(request, response);
                break;
        }
    }



//    private void searchByMail(HttpServletRequest request, HttpServletResponse response) {


//
//        List<Customer> customerList = customerService.searchByMail(mail);
//        request.setAttribute("customerList", customerList);
//        try {
//            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (ServletException e) {
//            e.printStackTrace();
//        }
//    }
//
//    private void searchByType(HttpServletRequest request, HttpServletResponse response) {
//        List<Customer> customerList = customerService.searchByType(type);
//        request.setAttribute("customerList", customerList);
//        try {
//            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (ServletException e) {
//            e.printStackTrace();
//        }
//    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        String mail = request.getParameter("searchMail");
        Integer type = Integer.parseInt(request.getParameter("searchType"));
        List<Customer> customerList = customerService.searchByName(name, mail, type);
        request.setAttribute("customerList", customerList);

        List<CustomerType> customerTypeList = customerTypeService.selectCustomerTypeList();
        request.setAttribute("customerTypeList", customerTypeList);

        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }


    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        customerService.deleteCustomer(id);
       request.setAttribute("message"," BAN DA XOA THANH CONG");
       this.listCustomer(request,response);
    }


    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Customer customer = null;
        try {
            customer = customerService.selectCustomerById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        List<CustomerType> customerTypeList = customerTypeService.selectCustomerTypeList();
        request.setAttribute("customerTypeList", customerTypeList);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.findAllCustomer();
        request.setAttribute("customerList", customerList);

        List<CustomerType> customerTypeList = customerTypeService.selectCustomerTypeList();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;


            default:

                break;
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        Integer gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idcard");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer customertypeid = Integer.parseInt(request.getParameter("customertypeid"));
        Customer customer = new Customer(id, name, birthday, gender, idCard, phoneNumber, email, address, customertypeid);
        try {
            customerService.updateCustomer(customer);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            response.sendRedirect("/customers");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        Integer gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idcard");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer customertypeid = Integer.parseInt(request.getParameter("customertypeid"));
        Customer customer = new Customer(id, name, birthday, gender, idCard, phoneNumber, email, address, customertypeid);
        customerService.insertCustomer(customer);
        try {
            response.sendRedirect("/customers");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

