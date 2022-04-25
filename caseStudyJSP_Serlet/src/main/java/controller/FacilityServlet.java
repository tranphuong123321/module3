package controller;

import model.Customer;
import model.CustomerType;
import model.Facility;
import model.FacilityType;
import service.ICustomerTypeService;
import service.IFacilityService;
import service.IFacilityTypeService;
import service.impl.CustomerTypeService;
import service.impl.FacilityService;
import service.impl.FacilityTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", value = "/facilitys")
public class FacilityServlet extends HttpServlet {
    private IFacilityService facilityService = new FacilityService();
    private IFacilityTypeService facilityTypeService = new FacilityTypeService();

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

                break;
            case "delete":

                break;
            case "search":

                break;

            default:
                listFacility(request, response);
                break;
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        List<FacilityType> facilityTypeList = facilityTypeService.selectFacilityTypeList();
        request.setAttribute("facilityTypeList", facilityTypeList);

        List<Facility> facilityList = facilityService.findAllFacility();
        request.setAttribute("facilityList", facilityList);

        try {
            request.getRequestDispatcher("view/facility/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listFacility(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.findAllFacility();
        request.setAttribute("facilityList", facilityList);

        List<FacilityType> facilityTypeList = facilityTypeService.selectFacilityTypeList();
        request.setAttribute("facilityTypeList", facilityTypeList);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request, response);
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
                insertFacility(request, response);
                break;
            case "edit":

                break;
        }
    }

    private void insertFacility(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));

        String serviceName = request.getParameter("serviceName");
        Integer area = Integer.parseInt(request.getParameter("area"));
        Double cost = Double.parseDouble(request.getParameter("cost"));
        Integer maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String roomStandard = request.getParameter("roomStandard");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        Integer poolArea = Integer.parseInt(request.getParameter("poolArea"));
        Integer numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        Integer rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        Integer serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        Facility facility = new Facility(id, serviceName, area, cost, maxPeople, roomStandard, descriptionOtherConvenience, poolArea, numberOfFloors, rentTypeId, serviceTypeId);
        facilityService.insertFacility(facility);
        try {
            response.sendRedirect("/facilitys");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


