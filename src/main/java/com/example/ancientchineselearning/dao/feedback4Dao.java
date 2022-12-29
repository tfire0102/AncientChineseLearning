package com.example.ancientchineselearning.dao;

import com.example.ancientchineselearning.domain.Feedback;
import com.example.ancientchineselearning.tools.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class feedback4Dao {

    public List<Feedback> getFeedback() {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;
        List<Feedback> feedbacks = new ArrayList<>();

        String sql = "SELECT fbk_rid, pty_ttl, acn_eml, fbk_cot " +
                "FROM poetry, account, (select * from feedback) AS f " +
                "WHERE fbk_pty=pty_rid AND fbk_acn=acn_rid " +
                "ORDER BY fbk_rid DESC";

        try {
            pstmt = cont.prepareStatement(sql);
            res = pstmt.executeQuery();
            while (res.next()) {
                Feedback feedback = new Feedback();
                feedback.setRid(res.getInt("fbk_rid"));
                feedback.setPoemName(res.getString("pty_ttl"));
                feedback.setAccount(res.getString("acn_eml"));
                feedback.setConnect(res.getString("fbk_cot"));

                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.closeJDBC(cont, pstmt, res);
        }

        return feedbacks;
    }
}
