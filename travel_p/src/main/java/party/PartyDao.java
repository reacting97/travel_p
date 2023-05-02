package party;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;


public class PartyDao {
	private DBConnect dbconn;
	
	public PartyDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(PartyVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into party values(?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMaster());
			ps.setString(2, vo.getParty_member());
			ps.setInt(3, vo.getParty_board());
			int num = ps.executeUpdate();
			System.out.println(num + " 줄 추가");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public PartyVo select(PartyVo vo) {
		Connection conn = dbconn.conn();
		PartyVo vo1 = null;
		String sql = "select * from party where master=? and party_member=? and party_board=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getMaster());
			ps.setString(2, vo.getParty_member());
			ps.setInt(3, vo.getParty_board());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				vo1 = new PartyVo(rs.getString(1),rs.getString(2),rs.getInt(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return vo1;
	}
	
	public ArrayList<PartyVo> selectByNum(int num) {
		Connection conn = dbconn.conn();
		ArrayList<PartyVo> list = new ArrayList<>();
		String sql = "select * from party where party_board=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new PartyVo(rs.getString(1),rs.getString(2),rs.getInt(3)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public void delete(int num, String id) {
		Connection conn = dbconn.conn();
		String sql = "delete from party where party_board=? and party_member=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, id);
	
			int num2 = ps.executeUpdate();
			System.out.println(num2 + " 줄 추가");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
