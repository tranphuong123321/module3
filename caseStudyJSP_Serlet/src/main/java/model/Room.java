package model;

public class Room extends Facility{
    private String freeServiceIncluded;

    public Room() {
    }

    public Room(String freeServiceIncluded) {
        this.freeServiceIncluded = freeServiceIncluded;
    }

    public Room(Integer id, String name, Integer area, Double cost, Integer maxPeople, Integer rentTypeId, Integer serviceTypeId, String freeServiceIncluded) {
        super(id, name, area, cost, maxPeople, rentTypeId, serviceTypeId);
        this.freeServiceIncluded = freeServiceIncluded;
    }

    public String getFreeServiceIncluded() {
        return freeServiceIncluded;
    }

    public void setFreeServiceIncluded(String freeServiceIncluded) {
        this.freeServiceIncluded = freeServiceIncluded;
    }
}
