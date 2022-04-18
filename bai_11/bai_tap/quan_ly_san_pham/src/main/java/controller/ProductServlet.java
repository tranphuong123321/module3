package controller;

import model.Product;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/products", "/"})
public class ProductServlet extends HttpServlet {

    ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                DeleteForm(request,response);

                break;
            case "view":
                viewProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = this.productService.findAll();
        request.setAttribute("products", products);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        List<Product> products;
        List<Product> result = new ArrayList<>();
        products = this.productService.findAll();
        for(Product product:products){
            if(product.getName().contains(name)){
                result.add(product);
            }
        }


        request.setAttribute("products",result);
        request.setAttribute("name",name);
        request.setAttribute("size",products.size());
        try {
            request.getRequestDispatcher("product/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




    private void viewProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if(product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("product/view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                CreateForm(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;

//            case "search":
//                search(request,response);
//                break;
            default:
                break;
        }
    }

    private void CreateForm(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Integer price = Integer.parseInt(request.getParameter("price"));
        String status = request.getParameter("status");
        String producer = request.getParameter("producer");


        Product product = new Product(id, name, price, status, producer);
        this.productService.save(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        request.setAttribute("message", "New product was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Integer price = Integer.parseInt(request.getParameter("price"));
        String status = request.getParameter("status");
        String producer = request.getParameter("producer");

        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            product.setId(id);
            product.setName(name);
            product.setPrice(price);
            product.setStatus(status);
            product.setProducer(producer);
            this.productService.update(id, product);
            request.setAttribute("product", product);
            request.setAttribute("message", "Product information was updated");
            dispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void DeleteForm(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.productService.remove(id);
            try {
                response.sendRedirect("/products");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
//    private void search(HttpServletRequest request,HttpServletResponse response){
//        String name = request.getParameter("search");
//        List<Product> products = new ArrayList<>();
//        for(Product product:productList){
//            if(product.getName().equals(name)){
//                products.add(product);
//            }
//        }
//        request.setAttribute("listProduct",products);
//        request.setAttribute("name",name);
//        request.setAttribute("size",products.size());
//        try {
//            request.getRequestDispatcher("searching.jsp").forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
}
