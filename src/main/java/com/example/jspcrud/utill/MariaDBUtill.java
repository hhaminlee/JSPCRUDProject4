package com.example.jspcrud.utill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MariaDBUtill {
    //maria DB 접속
    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/p232_22000594",
                    "p232_22000594","Eugai7");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("드라이버오류");
        }
        return conn;
    }
    public static void main(String arg[]){
        Connection con = MariaDBUtill.getConnection();
        if(con!=null)
            System.out.println("연결됨");
        else
            System.out.println("연결안됨");
    }
}
