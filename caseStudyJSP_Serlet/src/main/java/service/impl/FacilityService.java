package service.impl;

import model.Facility;
import repository.ICustomerRepository;
import repository.IFacilityRepository;
import repository.impl.CustomerRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private final IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAllFacility() {
        return facilityRepository.findAllFacility();
    }

    @Override
    public void insertFacility(Facility facility) {
        facilityRepository.insertFacility(facility);
    }
}
