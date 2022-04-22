package repository;

import model.Customer;
import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    void insertFacility(Facility facility) ;

    List<Facility> findAllFacility();
}
