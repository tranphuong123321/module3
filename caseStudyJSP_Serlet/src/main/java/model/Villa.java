package model;

public class Villa extends  Facility{
    private String roomStandard;
    private String descriptionOtherConvenience;
    private Float poolArea;
    private Integer numberOfFloors;

    public Villa() {
    }

    public Villa(String roomStandard, String descriptionOtherConvenience, Float poolArea, Integer numberOfFloors) {
        this.roomStandard = roomStandard;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
    }

    public Villa(Integer id, String name, Integer area, Double cost, Integer maxPeople, Integer rentTypeId, Integer serviceTypeId, String roomStandard, String descriptionOtherConvenience, Float poolArea, Integer numberOfFloors) {
        super(id, name, area, cost, maxPeople, rentTypeId, serviceTypeId);
        this.roomStandard = roomStandard;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
    }

    public String getRoomStandard() {
        return roomStandard;
    }

    public void setRoomStandard(String roomStandard) {
        this.roomStandard = roomStandard;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public Float getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(Float poolArea) {
        this.poolArea = poolArea;
    }

    public Integer getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(Integer numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }
}
