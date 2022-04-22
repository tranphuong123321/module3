package repository.impl;

import model.CustomerType;
import model.FacilityType;
import repository.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_FACILITY_TYPE = "select * from loai_dich_vu";

    @Override
    public List<FacilityType> selectFacilityTypeList() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY_TYPE)) {
            System.out.println(SELECT_ALL_FACILITY_TYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                Integer facilityTypeId = rs.getInt("ma_loai_dich_vu");
                String facilityTypeName = rs.getString("ten_loai_dich_vu");
                facilityTypeList.add(new FacilityType(facilityTypeId,facilityTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityTypeList;
    }
}

