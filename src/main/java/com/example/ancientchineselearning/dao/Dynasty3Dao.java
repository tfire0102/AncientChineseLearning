package com.example.ancientchineselearning.dao;

import com.example.ancientchineselearning.domain.Dynasty;
import com.example.ancientchineselearning.tools.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Dynasty3Dao {

    public List<Dynasty> getDynastyList() {
        List<Dynasty> dynastyList = new ArrayList<>();
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;

        String sql = "SELECT * FROM dynasty";
        try {
            pstmt = cont.prepareStatement(sql);
            res = pstmt.executeQuery();
            while (res.next()) {
                Dynasty dynasty = new Dynasty();
                dynasty.setRid(res.getInt("dny_rid"));
                dynasty.setContent(res.getString("dny_cot"));
                dynastyList.add(dynasty);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.closeJDBC(cont, pstmt, res);
        }

        return dynastyList;
    }
}
