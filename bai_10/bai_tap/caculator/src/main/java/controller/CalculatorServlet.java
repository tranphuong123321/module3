package controller;

import model.Caculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Caculator caculator = new Caculator();
        float firstOperand=0;
        float secondOperand=0;
        float result =0.0f;
        String message= null;
        try{
            firstOperand = Integer.parseInt(request.getParameter("first-operand"));
            secondOperand = Integer.parseInt(request.getParameter("second-operand"));
        }catch (NumberFormatException numberFormatException){
            message= numberFormatException.getMessage();
        }

        char operator = request.getParameter("operator").charAt(0);
        try{
            result = Caculator.calculate(firstOperand, secondOperand, operator);
        }catch (RuntimeException runtimeException){
            message=runtimeException.getMessage();
        }

        request.setAttribute("kq", result);
        request.setAttribute("first", firstOperand);
        request.setAttribute("second", secondOperand);
        request.setAttribute("operator", operator);
        request.setAttribute("message", message);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }


}
