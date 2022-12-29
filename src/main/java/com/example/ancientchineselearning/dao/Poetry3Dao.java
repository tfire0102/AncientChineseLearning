package com.example.ancientchineselearning.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import com.example.ancientchineselearning.domain.Auther;
import com.example.ancientchineselearning.domain.Poetry;
import com.example.ancientchineselearning.tools.*;



public class Poetry3Dao {
	public List<Poetry> getPoetryList() {
		Connection cont = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		List<Poetry> poetryadd = new ArrayList<Poetry>();
		
		String sql = "select pty_rid, pty_ttl, pty_cot, pty_tst, pty_apt, pty_not, pty_fam,"  
		        +"atr_rid, atr_nam, dny_cot, atr_btd, atr_inf " + 
		        "FROM dynasty, ( " +
		        "SELECT * " +  
		        "from auther, (SELECT * from poetry where pty_smt = 1) as pty " +
		        "where atr_rid = pty_atr) as a " +
		        "where dny_rid = atr_dny ";
		
		try {
			pstmt = cont.prepareStatement(sql);
			
			res = pstmt.executeQuery();
			while(res.next()) {
				Poetry poetry = new Poetry();
				poetry.setRid(res.getInt("pty_rid"));
				poetry.setTitle(res.getString("pty_ttl"));
				poetry.setContent(res.getString("pty_cot"));
				poetry.setTranslate(res.getString("pty_tst"));
				poetry.setAppreciate(res.getString("pty_apt"));
				poetry.setNotes(res.getString("pty_not"));
				poetry.setFamSentence(res.getString("pty_fam"));
				
				
					
				Auther auther = new Auther();
				auther.setRid(res.getInt("atr_rid"));
				auther.setName(res.getString("atr_nam"));
				auther.setDynasty(res.getString("dny_cot"));
				auther.setBtd(res.getString("atr_btd"));
				
				poetry.setAuther(auther);
				poetryadd.add(poetry);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		
		return poetryadd;
	}

	public int addPoetry(Poetry poetryInfo,int pty_atr) {
		Connection cont = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		int peortyId = 0;
		
		String sql = "insert into poetry (pty_ttl,pty_cot,pty_tst,pty_atr,pty_apt,pty_not,pty_fam,pty_rec,pty_smt)"
				+ "VALUES (?,?,?,?,?,?,?,0,0)";
		
		try {
			pstmt = cont.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			
			pstmt.setString(1, poetryInfo.getTitle());
			pstmt.setString(2, poetryInfo.getContent());
			pstmt.setString(3, poetryInfo.getTranslate());
			pstmt.setInt(4, pty_atr);
			pstmt.setString(5, poetryInfo.getAppreciate());
			pstmt.setString(6, poetryInfo.getNotes());
			pstmt.setString(7, poetryInfo.getFamSentence());
			pstmt.executeUpdate();
			//获取当前sql执行后自动生成的标识id
			res = pstmt.getGeneratedKeys();
			res.next();
			peortyId = res.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		
		return peortyId;
		
	}
	
	/*
	 * 把id调出来
	 */
	public int getID(String pty_atr) {
		Connection cont = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		int  num = -1;
		
		String sql = "select atr_rid from auther where atr_nam = ?";
				
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setString(1, pty_atr);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				num = res.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		
		return num;
	}
}
