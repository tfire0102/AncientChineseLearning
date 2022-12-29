package com.example.ancientchineselearning.dao;

import com.example.ancientchineselearning.domain.Press;
import com.example.ancientchineselearning.tools.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class press4Dao {
    public List<Press> getUnapprovedPressList() {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;
        List<Press> pressList = new ArrayList<>();

        String sql = "SELECT prs_rid, acn_eml, pty_ttl, prs_cot " +
                "FROM account, poetry, " +
                "(select * from press where prs_smt=0) as p " +
                "WHERE acn_rid = prs_acn AND pty_rid = prs_pty";

        try {
            pstmt = cont.prepareStatement(sql);
            res = pstmt.executeQuery();
            while (res.next()) {
                Press press = new Press();

                press.setRid(res.getInt("prs_rid"));
                press.setAccount(res.getString("acn_eml"));
                press.setPoem(res.getString("pty_ttl"));
                press.setContent(res.getString("prs_cot"));

                pressList.add(press);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.closeJDBC(cont, pstmt, res);
        }

        return pressList;
    }

    public void setPressPass(int rid) {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;

        String sql = "update press set prs_smt=1 where prs_rid = ?";

        try {
            pstmt = cont.prepareStatement(sql);
            pstmt.setInt(1, rid);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("修改成功");
            DButil.closeJDBC(cont, pstmt, res);
        }
    }

    public void deletePress(int rid) {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;

        String sql = "delete from press where prs_rid = ?";
        try {
            pstmt = cont.prepareStatement(sql);
            pstmt.setInt(1, rid);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("删除成功");
            DButil.closeJDBC(cont, pstmt, res);
        }
    }

}
