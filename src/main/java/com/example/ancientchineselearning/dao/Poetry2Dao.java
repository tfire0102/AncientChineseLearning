package com.example.ancientchineselearning.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.example.ancientchineselearning.tools.DButil;
import com.example.ancientchineselearning.domain.Auther;
import com.example.ancientchineselearning.domain.Poetry;
import com.example.ancientchineselearning.domain.Press;

public class Poetry2Dao {
	/**
	 * 查询诗词信息根据诗词标识ID
	 * @param poetryid
	 * @return
	 */
	public Poetry selectPoetryById(int poetryid) {
		// TODO Auto-generated method stub
		//获取连接对象
		Connection cont = DButil.getConnection();
		//执行对象
		PreparedStatement pstmt = null;
		//结果集
		ResultSet res = null;
		
		Poetry poetry = new Poetry();
		
		String sql = "SELECT * from dynasty,(SELECT * from auther,"
				+ "(select * from poetry where pty_rid=?) as pti WHERE atr_rid = pty_atr) "
				+ "as a WHERE dny_rid = atr_dny";
		
		try {
			//获取执行对象
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, poetryid);
			res = pstmt.executeQuery();
			while(res.next()) {
				poetry.setRid(res.getInt("pty_rid"));
				
				//接收作者信息
				Auther auther =  new Auther();
				auther.setRid(res.getInt("atr_rid"));
				auther.setName(res.getString("atr_nam"));
				auther.setDynasty(res.getString("dny_cot"));
				auther.setBtd(res.getString("atr_btd"));
				auther.setInfo(res.getString("atr_inf"));
				
				poetry.setAuther(auther);
				poetry.setTitle(res.getString("pty_ttl"));
				poetry.setContent(res.getString("pty_cot"));
				poetry.setTranslate(res.getString("pty_tst"));
				poetry.setAppreciate(res.getString("pty_apt"));
				poetry.setNotes(res.getString("pty_not"));
				poetry.setFamSentence(res.getString("pty_fam"));
				poetry.setNumOfLike(res.getInt("pty_rec"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭数据库连接
			DButil.closeJDBC(cont, pstmt, res);
		}
		return poetry;
	}
	/**
	 * 更新数据库信息，为诗词点赞
	 * @param poetryId
	 * @return
	 */
	public void updateselectPoetryById(int poetryId) {
		// TODO Auto-generated method stub
		//获取连接对象
		Connection cont = DButil.getConnection();
		//执行对象
		PreparedStatement pstmt = null;
		//结果集
		ResultSet res = null;
		
		String sql = "UPDATE poetry SET pty_rec=pty_rec+1 WHERE pty_rid = ?";
		
		try {
			//获取执行对象
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, poetryId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭数据库连接
			DButil.closeJDBC(cont, pstmt, res);
		}
	}
	/**
	 * 获得猜你喜欢列表猜你喜欢
	 * @param poetryId
	 * @param dynasty
	 * @return
	 */
	public List<Poetry> SelectGlike(int poetryId, String dynasty) {
		// TODO Auto-generated method stub
		//获取连接对象
		Connection cont = DButil.getConnection();
		//执行对象
		PreparedStatement pstmt = null;
		//结果集
		ResultSet res = null;
		
		List<Poetry> list = new ArrayList<>();
		
		
		
		String sql = "SELECT * from dynasty,(SELECT * from auther,poetry WHERE atr_rid = pty_atr)"
				+ "as b WHERE dny_rid = atr_dny AND pty_rid != ? AND dny_cot = ? limit 5";
		try {
			//获取执行对象
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, poetryId);
			pstmt.setString(2, dynasty);
			res = pstmt.executeQuery();
			while(res.next()) {
				Poetry poetry = new Poetry();
				poetry.setRid(res.getInt("pty_rid"));
				
				//接收作者信息
				Auther auther =  new Auther();
				auther.setRid(res.getInt("atr_rid"));
				auther.setName(res.getString("atr_nam"));
				auther.setDynasty(res.getString("dny_cot"));
				auther.setBtd(res.getString("atr_btd"));
				auther.setInfo(res.getString("atr_inf"));
				
				poetry.setAuther(auther);
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
			//关闭数据库连接
			DButil.closeJDBC(cont, pstmt, res);
		}
		return list;
		
	}
	
	/**
	 * 将收藏数据存入数据库
	 * @param poetryId 诗词ID
	 * @param userId 用户ID
	 */
	public void Insertcollection(int poetryId, int userId) {
		// TODO Auto-generated method stub
		//获取连接对象
		Connection cont = DButil.getConnection();
		//执行对象
		PreparedStatement pstmt = null;
		//结果集
		ResultSet res = null;
		
		String sql = "INSERT INTO collection VALUES (NULL,?,?)";
		
		//获取执行对象
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, poetryId);
			pstmt.setInt(2, userId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭数据库连接
			DButil.closeJDBC(cont, pstmt, res);
		}
	}
	
	/**
	 * 联系我们添加反馈
	 * @param poetryId
	 * @param accountId
	 * @param message
	 */
	public void ContactInster(int poetryId, int accountId, String message) {
		// TODO Auto-generated method stub
		//获取连接对象
		Connection cont = DButil.getConnection();
		//执行对象
		PreparedStatement pstmt = null;
		//结果集
		ResultSet res = null;
		
		String sql = "INSERT INTO feedback VALUES (NULL,?,?,?)";
		
		//获取执行对象
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, poetryId);
			pstmt.setInt(2, accountId);
			pstmt.setString(3, message);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭数据库连接
			DButil.closeJDBC(cont, pstmt, res);
		}
	}
	
	/**
	 * 发布评论功能查找评论
	 * @param poetryId
	 * @param accountId
	 * @param message
	 * @return
	 */
	public void Insertpress(int poetryId, int accountId, String message) {
		// TODO Auto-generated method stub
		//获取连接对象
		Connection cont = DButil.getConnection();
		//执行对象
		PreparedStatement pstmt = null;
		//结果集
		ResultSet res = null;		
		
		String sql = "INSERT INTO press VALUES (NULL,?,?,?,0)";
		
		//获取执行对象
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, poetryId);
			pstmt.setInt(2, accountId);
			pstmt.setString(3, message);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭数据库连接
			DButil.closeJDBC(cont, pstmt, res);
		}
	}
	/**
	 * 根据诗词ID查询已审核的诗词评论
	 * @param poetryId
	 * @return
	 */
	public List<Press> selectpress(int poetryId) {
		// TODO Auto-generated method stub
		//获取连接对象
		Connection cont = DButil.getConnection();
		//执行对象
		PreparedStatement pstmt = null;
		//结果集
		ResultSet res = null;
		
		List<Press> list = new ArrayList<>();
		
		String sql = "SELECT * from account,(SELECT * from press,poetry WHERE pty_rid = prs_pty)"
				+ "as b WHERE prs_acn = acn_rid and pty_rid=? and prs_smt=1";
		
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, poetryId);
			res = pstmt.executeQuery();
			while(res.next()) {
				Press press = new Press();
				press.setRid(res.getInt("prs_rid"));
				press.setPoemID(res.getInt("prs_pty"));
				press.setAccount(res.getString("acn_eml"));
				press.setContent(res.getString("prs_cot"));
				list.add(press);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭数据库连接
			DButil.closeJDBC(cont, pstmt, res);
		}
		return list;
	}
	
	/**
	 * 判断是否已经加入收藏
	 * @return
	 */
	public boolean collectionis(int poetryId,int AccountId ) {
		// TODO Auto-generated method stub
		//获取连接对象
		Connection cont = DButil.getConnection();
		//执行对象
		PreparedStatement pstmt = null;
		//结果集
		ResultSet res = null;
		
		String sql ="SELECT * FROM collection WHERE cln_pty=? AND cln_acn=?";
		
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, poetryId);
			pstmt.setInt(2, AccountId);
			res = pstmt.executeQuery();
			if (res.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭数据库连接
			DButil.closeJDBC(cont, pstmt, res);
		}
		
		return false;
	}
	
	/**
	 * 取消收藏
	 * @param poetryId
	 * @param userId
	 */
	public void Removecollection(int poetryId, int userId) {
		// TODO Auto-generated method stub
		//获取连接对象
		Connection cont = DButil.getConnection();
		//执行对象
		PreparedStatement pstmt = null;
		//结果集
		ResultSet res = null;
				
		String sql ="DELETE FROM collection WHERE cln_pty=? AND cln_acn=?";
		
		try {
			pstmt = cont.prepareStatement(sql);
			pstmt.setInt(1, poetryId);
			pstmt.setInt(2, userId);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭数据库连接
			DButil.closeJDBC(cont, pstmt, res);
		}
	}
	
}
