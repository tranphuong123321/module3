package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository{
    private String jdbcUrl = "jdbc:mysql://localhost:3306/demo12";
    private String username = "root";
    private String password = "123456789";

    private Connection conn;

    public BaseRepository() {
    }

    public Connection getConn() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl,username,password);
            return conn;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return null;
    }


}