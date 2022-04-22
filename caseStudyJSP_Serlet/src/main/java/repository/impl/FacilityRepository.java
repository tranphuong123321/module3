package repository.impl;

import model.Customer;
import model.Facility;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_FACILITY = "select * from dich_vu;";
    private static final String INSERT_NEW_FACILITY = "insert into dich_vu (ma_dich_vu ,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu) values (?,?,?,?,?,?,?,?,?,?,?);";


    @Override
    public void insertFacility(Facility facility) {

        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT_NEW_FACILITY);

            preparedStatement.setInt(1, facility.getId());
            preparedStatement.setString(2, facility.getServiceName());
            preparedStatement.setInt(3, facility.getArea());
            preparedStatement.setDouble(4, facility.getCost());
            preparedStatement.setInt(5, facility.getMaxPeople());
            preparedStatement.setString(6, facility.getRoomStandard());
            preparedStatement.setString(7, facility.getDescriptionOtherConvenience());
            preparedStatement.setInt(8, facility.getPoolArea());
            preparedStatement.setInt(9, facility.getNumberOfFloors());
            preparedStatement.setInt(10, facility.getRentTypeId());
            preparedStatement.setInt(11, facility.getServiceTypeId());



            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public List<Facility> findAllFacility() {
        List<Facility> facilityList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY)) {
            System.out.println(SELECT_ALL_FACILITY);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer id = rs.getInt("ma_dich_vu");
                String serviceName = rs.getString("ten_dich_vu");
                Integer area = rs.getInt("dien_tich");
                Double cost = rs.getDouble("chi_phi_thue");
                Integer maxPeople = rs.getInt("so_nguoi_toi_da");
                String roomStandard = rs.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = rs.getString("mo_ta_tien_nghi_khac");
                Integer poolArea = rs.getInt("dien_tich_ho_boi");
                Integer numberOfFloors = rs.getInt("so_tang");
                Integer rentTypeId = rs.getInt("ma_kieu_thue");
                Integer serviceTypeId = rs.getInt("ma_loai_dich_vu");
                facilityList.add(new Facility(id, serviceName, area, cost, maxPeople, roomStandard, descriptionOtherConvenience, poolArea, numberOfFloors, rentTypeId, serviceTypeId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;
    }
}
