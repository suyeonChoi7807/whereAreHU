package model;

import java.sql.Connection;  
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class UserDAO {
	
	
	// 회원정보 수정 
		public int updateUser(UserVO user) {
			System.out.println(user);
		int result = 0;
		String sql = " update user_tb set " +
					 " USER_PW = decode(?, '', USER_PW,?), "+
					 " USER_PHONE =decode(?, '', USER_PHONE,?),"+
					 " USER_EMAIL =decode(?, '', USER_EMAIL,?)" +
					 " where USER_ID = ?";
			
			Connection conn;
			PreparedStatement st = null;
			conn = DBUtil.getConnection();
			try {
				st = conn.prepareStatement(sql);
				
				st.setString(1,user.getUser_pw());
				st.setString(2,user.getUser_pw());
				st.setString(3, user.getUser_phone());
				st.setString(4, user.getUser_phone());
				st.setString(5, user.getUser_email());
				st.setString(6, user.getUser_email());
				st.setString(7, user.getUser_id());
				result = st.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DBUtil.dbClose(null, st, conn);
			}
			System.out.println(result);
			return result;
			
		}
		

	
	
	
	public void deleteId(String user_id) throws SQLException{
	    String sql = "delete from user_tb where user_id = ?";
	     
		Connection conn = DBUtil.getConnection();
	    PreparedStatement st = null;
	     
	    try{
	        st = conn.prepareStatement(sql);    
	        st.setString(1, user_id);	         
	        st.executeUpdate();	         
	    } finally{
	       DBUtil.dbClose(null, st, conn);
	    }
       
	}
	public List<UserVO> selectById (String user_id) {
		List<UserVO> userlist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select *from user_id where user_id =? ";
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, user_id);
			rs = st.executeQuery();
			while(rs.next()) {
				userlist.add(makeUser(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return userlist;
	}
	
	public int changepw(String user_id, String user_pw, String newpasswd) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		int result=0;
		String sql = "update user_tb set user_pw ='?'"
				+ " where user_id='?'"
				+ " and user_pw='?'";
		
		try {
			 st = conn.prepareStatement(sql);
			st.setString(1, newpasswd);
			st.setString(2, user_id);
			st.setString(3, user_pw);
			result= st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}
	public int delete(String user_id) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		int result=0;
		String SQL = "delete from user_tb where USER_ID = ?";
		try {
			conn.setAutoCommit(false);
			st = conn.prepareStatement(SQL);
			st.setString(1, user_id);
			result=st.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(null, st, conn);
		}
		
		return result;
	}
	
	public UserVO confirmID(String user_id) {
		UserVO user = new UserVO();
		boolean result = false;
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select user_id from user_tb where user_id =?";
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, user_id);
			rs = st.executeQuery();
		if(rs.next()) {
			user = makeUser(rs);
		}
		} catch (Exception e){
				e.printStackTrace();
			}finally {
				DBUtil.dbClose(rs, st, conn);
			}
		
		return user;
	}
	public List<UserVO> All() {
		List<UserVO> userlist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = "select * from user_tb where ?";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				UserVO user = makeUser(rs);
				userlist.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return userlist;
		
	}
	
	
	 public int join(UserVO user) {
	
			Connection conn = DBUtil.getConnection();
			PreparedStatement st = null;
			int result=0;
		 String SQL = "INSERT INTO USER_TB VALUES (?,?,?,?,?)";
		 try {
			 conn.setAutoCommit(false);
			 st = conn.prepareStatement(SQL);
			 st.setString(1, user.getUser_id());
			 st.setString(2, user.getUser_pw());
			 st.setString(3, user.getUser_name());
			 st.setString(4, user.getUser_phone());
			 st.setString(5, user.getUser_email());
			 result=st.executeUpdate();
			conn.commit();
		 }catch(Exception e) {
			 try {
				 conn.rollback();
			 }catch(SQLException e1){
				 e1.printStackTrace();
			 }
			 e.printStackTrace();
		 }
		finally {
			DBUtil.dbClose(null, st, conn);
		}return result;
	 }
	
	public UserVO loginChk(String user_id, String user_pw) {
		UserVO user = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		
		String sql = "select * from USER_TB where USER_ID = ? and USER_PW=?";
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, user_id);
			st.setString(2, user_pw);
			rs = st.executeQuery();
			while(rs.next()) {
				user = new UserVO();
			user = makeUser(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}

		return user;
	}

	private UserVO makeUser(ResultSet rs) throws SQLException {
		UserVO user = new UserVO();
		user.setUser_id(rs.getString("USER_ID"));
		user.setUser_pw(rs.getString("USER_PW"));
		user.setUser_name(rs.getString("USER_NAME"));
		user.setUser_phone(rs.getString("USER_PHONE"));
		user.setUser_email(rs.getString("USER_EMAIL"));
		return user;
	}

}
