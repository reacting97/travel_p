package recommand_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import recommandrep.RecommandRepVo;


public class RecommandBoardDao {
	private DBConnect dbconn;

	public RecommandBoardDao() {
		dbconn = DBConnect.getInstance();
	}

	public void insert(RecommandBoardVo vo) {
		Connection conn = dbconn.conn();

		String sql = "insert into recommand_board values(seq_imgboard.nextval, ?, sysdate, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getPath());

			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 추가되었다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public RecommandBoardVo select(int num) {
		Connection conn = dbconn.conn();

		String sql = "select * from recommand_board where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return new RecommandBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), 
						rs.getString(5), rs.getString(6));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public ArrayList<RecommandRepVo> selectByPnum(int pnum){
		Connection conn = dbconn.conn();
		ArrayList<RecommandRepVo> list = new ArrayList<RecommandRepVo>();
		String sql = "select * from recommand_reps where pnum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new RecommandRepVo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<RecommandBoardVo> selectAll() {
		Connection conn = dbconn.conn();
		ArrayList<RecommandBoardVo> list = new ArrayList<RecommandBoardVo>();
		String sql = "select * from recommand_board order by num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new RecommandBoardVo(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), 
						rs.getString(5), rs.getString(6)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public void update(RecommandBoardVo vo) {
		Connection conn = dbconn.conn();

		String sql = "update recommand_board set title=?, content=? where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getNum());
			int num = pstmt.executeUpdate();
			System.out.println(num + " 줄이 수정되었다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void delete(int num) {
		Connection conn = dbconn.conn();

		String sql = "delete recommand_board where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, num);
			int x = pstmt.executeUpdate();
			System.out.println(x + " 줄이 삭제되었다");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
