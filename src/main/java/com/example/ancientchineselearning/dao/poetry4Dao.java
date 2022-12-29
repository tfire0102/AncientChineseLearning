package com.example.ancientchineselearning.dao;

import com.example.ancientchineselearning.domain.Auther;
import com.example.ancientchineselearning.domain.Poetry;
import com.example.ancientchineselearning.tools.DButil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class poetry4Dao {

    public List<Poetry> getUnapprovedPoemList() {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;
        List<Poetry> poetrys = new ArrayList<>();

        String sql = "SELECT pty_rid, pty_ttl, atr_rid, atr_nam, dny_cot " +
                "FROM dynasty, ( select * " +
                "from auther, (SELECT * FROM poetry WHERE pty_smt = 0) as pty " +
                "where atr_rid = pty_atr) AS a " +
                "WHERE dny_rid = atr_dny";
        try {
            pstmt = cont.prepareStatement(sql);
            res = pstmt.executeQuery();
            while (res.next()) {
                Auther auther = new Auther();
                Poetry poetry = new Poetry();

                poetry.setRid(res.getInt("pty_rid"));
                poetry.setTitle(res.getString("pty_ttl"));
                auther.setRid(res.getInt("atr_rid"));
                auther.setName(res.getString("atr_nam"));
                auther.setDynasty(res.getString("dny_cot"));
                poetry.setAuther(auther);

                poetrys.add(poetry);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.closeJDBC(cont, pstmt, res);
        }

        return poetrys;
    }

    public Poetry getPoemByID(int rid) {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;
        Poetry poetry = new Poetry();

        String sql = "SELECT pty_ttl, atr_rid, atr_nam, dny_cot, pty_cot, pty_tst, pty_apt, pty_not, pty_fam " +
                "FROM dynasty, ( " +
                "SELECT * " +
                "from auther, poetry " +
                "where atr_rid = pty_atr) as a " +
                "where dny_rid = atr_dny and pty_rid = ?";
        try {
            pstmt = cont.prepareStatement(sql);
            pstmt.setInt(1, rid);
            res = pstmt.executeQuery();
            while (res.next()) {
                Auther auther = new Auther();

                poetry.setRid(rid);
                poetry.setTitle(res.getString("pty_ttl"));
                auther.setRid(res.getInt("atr_rid"));
                auther.setName(res.getString("atr_nam"));
                auther.setDynasty(res.getString("dny_cot"));
                poetry.setAuther(auther);
                poetry.setContent(res.getString("pty_cot"));
                poetry.setTranslate(res.getString("pty_tst"));
                poetry.setAppreciate(res.getString("pty_apt"));
                poetry.setNotes(res.getString("pty_not"));
                poetry.setFamSentence(res.getString("pty_fam"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.closeJDBC(cont, pstmt, res);
        }

        return poetry;
    }

    public List<Poetry> getFindPoem(String poemName, int autherID, int dynastyID) {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;
        List<Poetry> poetryList = new ArrayList<>();

        String sql = "SELECT pty_rid, pty_ttl, pty_rec, atr_rid, atr_nam, dny_cot " +
                "FROM dynasty, ( select * " +
                "from auther, (SELECT * FROM poetry WHERE pty_smt = 1) as pty " +
                "where atr_rid = pty_atr) AS a " +
                "WHERE dny_rid = atr_dny";

        if (poemName != null && !"".equals(poemName)) sql += " and pty_ttl='" + poemName + "'";
        if (autherID != -1) sql += " and atr_rid=" + autherID;
        if (dynastyID != -1) sql += " and dny_rid=" + dynastyID;

        System.out.println(sql);

        try {
            pstmt = cont.prepareStatement(sql);
            res = pstmt.executeQuery();
            while (res.next()) {
                Auther auther = new Auther();
                Poetry poetry = new Poetry();

                poetry.setRid(res.getInt("pty_rid"));
                poetry.setTitle(res.getString("pty_ttl"));
                poetry.setNumOfLike(res.getInt("pty_rec"));
                auther.setRid(res.getInt("atr_rid"));
                auther.setName(res.getString("atr_nam"));
                auther.setDynasty(res.getString("dny_cot"));
                poetry.setAuther(auther);

                poetryList.add(poetry);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DButil.closeJDBC(cont, pstmt, res);
        }
        return poetryList;
    }

    public void setPoemPass(int rid) {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;

        String sql = "update poetry set pty_smt = 1 where pty_rid = ?";
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

    public void updatePoem(Poetry poetry) {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;

        String sql = "update poetry " +
                "set pty_cot=?, pty_tst=?, pty_apt=?, pty_not=?, pty_fam=? " +
                "where pty_rid = ?";
        try {
            pstmt = cont.prepareStatement(sql);
            pstmt.setString(1, poetry.getContent());
            pstmt.setString(2, poetry.getTranslate());
            pstmt.setString(3, poetry.getAppreciate());
            pstmt.setString(4, poetry.getNotes());
            pstmt.setString(5, poetry.getFamSentence());
            pstmt.setInt(6, poetry.getRid());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("修改成功");
            DButil.closeJDBC(cont, pstmt, res);
        }
    }

    public void deletePoem(int rid) {
        Connection cont = DButil.getConnection();
        PreparedStatement pstmt = null;
        ResultSet res = null;

        String sql = "delete from poetry where pty_rid = ?";
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
