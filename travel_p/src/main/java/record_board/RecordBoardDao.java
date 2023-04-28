package record_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

public class RecordBoardDao {
	private DBConnect dbconn;
	
	public RecordBoardDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(RecordBoardVo vo) {
		Connection conn = dbconn.conn();

		String sql = "insert into recordboard values(seq_recordboard.nextval,?,?,?,?,sysdate,?,?,?,0)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getPrice());
			pstmt.setString(5, vo.getPic1());
			pstmt.setString(6, vo.getPic2());
			pstmt.setString(7, vo.getPic3());

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

	public RecordBoardVo select(int num) {
		Connection conn = dbconn.conn();

		String sql = "select * from recordboard where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return new RecordBoardVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
						rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));
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

	public ArrayList<RecordBoardVo> selectAll() {
		Connection conn = dbconn.conn();
		ArrayList<RecordBoardVo> list = new ArrayList<RecordBoardVo>();
		String sql = "select * from recordboard order by num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new RecordBoardVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
						rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10)));
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
	
	public ArrayList<RecordBoardVo> selectRank() {
		Connection conn = dbconn.conn();
		ArrayList<RecordBoardVo> list = new ArrayList<RecordBoardVo>();
		String sql = "SELECT num,title,pic1,cnt FROM (SELECT num,title,pic1,cnt, DENSE_RANK() OVER(ORDER BY cnt DESC) AS rnk FROM recordboard) WHERE rnk <= 5";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new RecordBoardVo(rs.getInt(1), null, rs.getString(2), null, 
						null, null, rs.getString(3), null, null, rs.getInt(4)));
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

	public void update(String content, int num) {
		Connection conn = dbconn.conn();

		String sql = "update recordboard content=? where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, content);
			pstmt.setInt(2, num);
			int num2 = pstmt.executeUpdate();
			System.out.println(num2 + " 줄이 수정되었다");
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

		String sql = "delete recordboard where num=?";
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
	
	public void upCnt(int num) {
		Connection conn = dbconn.conn();

		String sql = "update recordboard set cnt=cnt+1 where num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, num);
			int x = pstmt.executeUpdate();
			System.out.println(x + " 줄이 수정되었다");
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