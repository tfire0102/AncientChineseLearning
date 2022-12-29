package com.example.ancientchineselearning.dao;

import com.example.ancientchineselearning.tools.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class auther4Dao {

    public int getIDByName(String autherName) {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;
        int rid = -1;

        String sql = "SELECT atr_rid FROM auther WHERE atr_nam = ?";
        try {
            pstmt = cont.prepareStatement(sql);
            pstmt.setString(1, autherName);
            res = pstmt.executeQuery();
            while (res.next()) {
                rid = res.getInt("atr_rid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.closeJDBC(cont, pstmt, res);
        }

        return rid;
    }
}
