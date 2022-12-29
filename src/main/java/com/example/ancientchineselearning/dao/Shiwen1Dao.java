package com.example.ancientchineselearning.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.ancientchineselearning.domain.Auther;
import com.example.ancientchineselearning.domain.Poetry;
import com.example.ancientchineselearning.tools.*;

/**
 * 查询诗文信息
 * @author 86027
 *
 */
public class Shiwen1Dao {
	public List<Poetry> getCompanyList() {
		Connection cont = DButil.getConnection();
		Statement pstmt = null;
		ResultSet res = null;
		List<Poetry> list = new ArrayList<>();
		
		String sql = "SELECT pty_ttl, atr_rid, atr_nam, atr_btd, atr_inf, dny_cot, pty_rid, pty_cot, pty_tst, pty_apt, pty_not, pty_fam, pty_rec " + 
                "FROM dynasty, ( " +
                "SELECT * " +
                "from auther, (SELECT * from poetry where pty_smt = 1) as pty " +
                "where atr_rid = pty_atr) as a " +
                "where dny_rid = atr_dny ";

		try {
			pstmt = cont.createStatement();
			res = pstmt.executeQuery(sql);
			
			while(res.next()) {
				Poetry poetry = new Poetry();
				Auther auther = new Auther();
				auther.setRid(res.getInt("atr_rid"));
				auther.setName(res.getString("atr_nam"));
				auther.setDynasty(res.getString("dny_cot"));
				auther.setBtd(res.getString("atr_btd"));
				auther.setInfo(res.getString("atr_inf"));	
				
				poetry.setAuther(auther);
				poetry.setRid(res.getInt("pty_rid"));
				poetry.setTitle(res.getString("pty_ttl"));
				poetry.setContent(res.getString("pty_cot"));
				poetry.setTranslate(res.getString("pty_tst"));
				poetry.setAppreciate(res.getString("pty_apt"));
				poetry.setNotes(res.getString("pty_not"));
				poetry.setFamSentence(res.getString("pty_fam"));
				poetry.setNumOfLike(res.getInt("pty_rec"));
				list.add(poetry);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		//System.out.println(list);
		return list;
	}
	
	public List<Poetry> getZhuyeList() {
		Connection cont = DButil.getConnection();
		Statement pstmt = null;
		ResultSet res = null;
		List<Poetry> list = new ArrayList<>();
		
		String sql = "SELECT pty_ttl, atr_rid, atr_nam, atr_btd, atr_inf, dny_cot, pty_rid, pty_cot, pty_tst, pty_apt, pty_not, pty_fam, pty_rec " + 
                "FROM dynasty, ( " +
                "SELECT * " +
                "from auther, (SELECT * from poetry where pty_smt = 1) as pty " +
                "where atr_rid = pty_atr) as a " +
                "where dny_rid = atr_dny " +
                "order by pty_rec desc " +
                "limit 5 ";

		try {
			pstmt = cont.createStatement();
			res = pstmt.executeQuery(sql);
			
			while(res.next()) {
				Poetry poetry = new Poetry();
				Auther auther = new Auther();
				auther.setRid(res.getInt("atr_rid"));
				auther.setName(res.getString("atr_nam"));
				auther.setDynasty(res.getString("dny_cot"));
				auther.setBtd(res.getString("atr_btd"));
				auther.setInfo(res.getString("atr_inf"));	
				
				poetry.setAuther(auther);
				poetry.setRid(res.getInt("pty_rid"));
				poetry.setTitle(res.getString("pty_ttl"));
				poetry.setContent(res.getString("pty_cot"));
				poetry.setTranslate(res.getString("pty_tst"));
				poetry.setAppreciate(res.getString("pty_apt"));
				poetry.setNotes(res.getString("pty_not"));
				poetry.setFamSentence(res.getString("pty_fam"));
				poetry.setNumOfLike(res.getInt("pty_rec"));
				list.add(poetry);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		//System.out.println(list);
		return list;
	}
	
	public List<Poetry> getShirenList() {
		Connection cont = DButil.getConnection();
		Statement pstmt = null;
		ResultSet res = null;
		List<Poetry> list = new ArrayList<>();
		
		String sql = "SELECT pty_ttl, atr_rid, atr_nam, atr_btd, atr_inf, dny_cot, pty_rid, pty_cot, pty_tst, pty_apt, pty_not, pty_fam, pty_rec " + 
                "FROM dynasty, ( " +
                "SELECT * " +
                "from auther, (SELECT * from poetry where pty_smt = 1) as pty " +
                "where atr_rid = pty_atr) as a " +
                "where dny_rid = atr_dny ";

		try {
			pstmt = cont.createStatement();
			res = pstmt.executeQuery(sql);
			
			while(res.next()) {
				Poetry poetry = new Poetry();
				Auther auther = new Auther();
				auther.setRid(res.getInt("atr_rid"));
				auther.setName(res.getString("atr_nam"));
				auther.setDynasty(res.getString("dny_cot"));
				auther.setBtd(res.getString("atr_btd"));
				auther.setInfo(res.getString("atr_inf"));	
				
				poetry.setAuther(auther);
				poetry.setRid(res.getInt("pty_rid"));
				poetry.setTitle(res.getString("pty_ttl"));
				poetry.setContent(res.getString("pty_cot"));
				poetry.setTranslate(res.getString("pty_tst"));
				poetry.setAppreciate(res.getString("pty_apt"));
				poetry.setNotes(res.getString("pty_not"));
				poetry.setFamSentence(res.getString("pty_fam"));
				poetry.setNumOfLike(res.getInt("pty_rec"));
				list.add(poetry);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		//System.out.println(list);
		return list;
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
}
