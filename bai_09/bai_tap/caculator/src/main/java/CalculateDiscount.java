import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculateDiscount", value = "/CalculateDiscount")
public class CalculateDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Float price = Float.parseFloat(request.getParameter("price"));
        Float discountPercent = Float.parseFloat(request.getParameter("discount"));
        double discountAmount = price*discountPercent*0.01;
        PrintWriter printWriter = response.getWriter();
        printWriter.println("<html>");
        printWriter.println("Discount Amount: "+ discountAmount +"<br>");
        printWriter.println("Discount Price: "+(price+discountAmount));
        printWriter.println("</html>");
    }
}
