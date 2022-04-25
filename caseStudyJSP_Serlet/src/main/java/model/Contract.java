package model;

public class Contract {
   // Số hợp đồng (contract_id), Ngày bắt đầu (contract_start_date),
    // Ngày kết thúc (contract_end_date),
    // Số tiền cọc trước (contract_deposit),
    // Tổng số tiền thanh toán (contract_total_money).
    private int id;
    private String startDate;
    private String endDate;
    private int deposit;
    private int totalMoney;

    public Contract() {
    }

    public Contract(int id, String startDate, String endDate, int deposit, int totalMoney) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.deposit = deposit;
        this.totalMoney = totalMoney;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getDeposit() {
        return deposit;
    }

    public void setDeposit(int deposit) {
        this.deposit = deposit;
    }

    public int getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(int totalMoney) {
        this.totalMoney = totalMoney;
    }
}
