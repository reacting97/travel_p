package like;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import recommand_board.RecommandBoardVo;

public class LikeDao {
private DBConnect dbconn;
	
	public LikeDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(LikeVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into liketable values(seq_like.nextval, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getUser_id());
			ps.setInt(2, vo.getRecommand_num());
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
	
	public void delete(LikeVo vo) {
		Connection conn = dbconn.conn();
		String sql = "delete from liketable where user_id=? and recommand_num=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getUser_id());
			ps.setInt(2, vo.getRecommand_num());
			int num = ps.executeUpdate();
			System.out.println(num + " 줄 삭제");
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
	
	
	public int selectLike(int board_num) {
		int num = 0;
		Connection conn = dbconn.conn();
		String sql = "select count(*) from liketable where recommand_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				num=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	
	public LikeVo selectByNum(int board_num, String id) {
		Connection conn = dbconn.conn();
		LikeVo vo = null;
		String sql = "select * from liketable where recommand_num=? and user_id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new LikeVo(rs.getInt(1),rs.getString(2),rs.getInt(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	public ArrayList<RecommandBoardVo> selectById(String id) {
		Connection conn = dbconn.conn();
		String sql = "select r.num, r.writer, r.title from liketable l, recommand_board r where user_id=? and l.user_id = r.writer and l.recommand_num = r.num";
		ArrayList<RecommandBoardVo> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				RecommandBoardVo vo = new RecommandBoardVo(rs.getInt(1), rs.getString(2), rs.getString(3), null, null, null, null);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
