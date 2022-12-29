package com.example.ancientchineselearning.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.ancientchineselearning.domain.Account;
import com.example.ancientchineselearning.tools.DButil;

public class Account1Dao {
	
	//验证邮箱是否被注册
	public boolean isExistEmail(String email1) {
		Connection cont = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		String sql = "select * from account where acn_eml = ?";
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setString(1, email1);
			res = pstmt.executeQuery();
			if(res.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		
		return false;
	}

	//注册存入
	public void insertEmail(String email1, String pawd1) {
		// TODO Auto-generated method stub
		Connection cont = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		String sql = "insert into account(acn_eml,acn_pwd) values (?,?)";
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setString(1, email1);
			pstmt.setString(2, pawd1);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
	}
	
	//验证登录
	public Account valiLogin(String email1) {
		Connection cont = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		Account accountBean = new Account();
		
		String sql = "select * from account where acn_eml = ?";
		
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setString(1, email1);
			res = pstmt.executeQuery();
			
			if(res.next()) {
				accountBean.setAcn_rid(res.getInt(1));
				accountBean.setAcn_eml(res.getString("acn_eml"));

				accountBean.setAcn_pwd(res.getString("acn_pwd"));
				accountBean.setAcn_perm(res.getString("acn_perm"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DButil.closeJDBC(cont, pstmt, res);
		}
		System.out.println(accountBean);
		return accountBean;
		
	}

	public void changPassword(int rid, String newPwd) {
		Connection cont = DButil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;

		String sql = "update account set acn_pwd = ? where acn_rid = ?";
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setInt(2, rid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			System.out.println("修改成功");
			DButil.closeJDBC(cont, pstmt, res);
		}
	}
}
