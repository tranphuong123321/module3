package model;

public class CustomerType {
    private Integer id;
    private String customerTypeName;

    public CustomerType() {
    }

    public CustomerType(Integer id, String customerTypeName) {
        this.id = id;
        this.customerTypeName = customerTypeName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustomerTypeName() {
        return customerTypeName;
    }

    public void setCustomerTypeName(String customerTypeName) {
        this.customerTypeName = customerTypeName;
    }
}
