package com.example.ancientchineselearning.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.ancientchineselearning.domain.Auther;
import com.example.ancientchineselearning.tools.*;

public class Auther3Dao {
	public List<Auther> getAutherList() {
		Connection cont = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		List<Auther> auther = new ArrayList<Auther>();
		
		String sql = "select * FROM dynasty, "
				+ "(SELECT * from auther ) as a where dny_rid = atr_dny ";
		try {
			pstmt = cont.prepareStatement(sql);
			res = pstmt.executeQuery();
			while(res.next()) {
				Auther Auther = new Auther();
				Auther.setRid(res.getInt("atr_rid"));
				Auther.setName(res.getString("atr_nam"));
				Auther.setDynasty(res.getString("dny_cot"));
				
				auther.add(Auther);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		
		return auther;
	}
	
	//调出作者
	public Auther getauther(int atr_rid) {
		Connection cont = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		Auther auther = new Auther();
		
		String sql = "select * FROM dynasty, "
				+ "(SELECT * from auther ) as a where dny_rid = atr_dny and atr_rid = ?";
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, atr_rid);
			res = pstmt.executeQuery();
			while(res.next()) {
				auther.setRid(res.getInt("atr_rid"));
				auther.setName(res.getString("atr_nam"));
				auther.setDynasty(res.getString("dny_cot"));
				auther.setBtd(res.getString("atr_btd"));
				auther.setInfo(res.getString("atr_inf"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		return auther;
	}
	
}
