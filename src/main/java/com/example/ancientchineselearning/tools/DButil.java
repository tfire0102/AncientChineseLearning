package com.example.ancientchineselearning.tools;

import java.sql.*;

public class DButil {

    static String url = "jdbc:mysql://localhost:3306/guwenzhai";
    static String username = "root";
    static String password = "7895123luyi";
//    static String password = "123456";

    /**
     * 加载类库
     */
    static {
        try {
//            Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 获取连接对象
     */
    public static Connection getConnection() {
        Connection cont = null;
        try {
            cont = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return cont;
    }

    /**
     * 关闭对象
     * @param cont 连接对象
     * @param pstmt
     * @param res 结果集对象
     */
    public static void closeJDBC(Connection cont, Statement pstmt, ResultSet res) {
        if(cont != null) {
            try {
                cont.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if(pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if(res != null) {
            try {
                res.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        System.out.println("关闭成功");
    }
}
