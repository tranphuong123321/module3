package controller;

import model.Customer;
import model.Employee;
import service.IEmployeeService;
import service.impl.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employees")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();

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
                listEmployee(request, response);
                break;
        }
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("searchName");
        List<Employee> employeeList = employeeService.searchByName(name);
        request.setAttribute("employeeList", employeeList);
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }


    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Employee employee = null;
        try {
            employee = employeeService.selectEmployeeById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("employee", employee);
        try {
            request.getRequestDispatcher("view/employee/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        employeeService.deleteEmployee(id);
        try {
            response.sendRedirect("/employees");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/employee/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.findAllEmployee();
        request.setAttribute("employeeList", employeeList);

        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
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
                insertEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            case "delete":

                break;
            case "search":

                break;

            default:
                listEmployee(request, response);
                break;
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        int salary = Integer.parseInt(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int levelId = Integer.parseInt(request.getParameter("levelId"));
        int partId = Integer.parseInt(request.getParameter("partId"));
        Employee employee = new Employee(id, name, birthday, idCard, salary, phoneNumber, email, address, positionId, levelId, partId);
        try {
            employeeService.updateEmployee(employee);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            response.sendRedirect("/employees");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) {

        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idcard");
        Integer salary = Integer.parseInt(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer positionId = Integer.parseInt(request.getParameter("positionId"));
        Integer levelId = Integer.parseInt(request.getParameter("levelId"));
        Integer partId = Integer.parseInt(request.getParameter("partId"));
        Employee employee = new Employee(id, name, birthday, idCard, salary, phoneNumber, email, address, positionId, levelId, partId);
        employeeService.insertEmployee(employee);
        try {
            response.sendRedirect("/employees");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
