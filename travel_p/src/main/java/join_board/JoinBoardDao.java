package join_board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;


public class JoinBoardDao {
	private DBConnect dbconn;

	public JoinBoardDao() {
		dbconn = DBConnect.getInstance();
	}
		
		// 글번호로 검색
		public JoinBoardVo select(int num) {
			JoinBoardVo vo = null;
			Connection conn = dbconn.conn();
			String sql = "select * from board where num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				ResultSet rs = pstmt.executeQuery();// select 실행
				if (rs.next()) {// 첫 줄로 이동하여 데이터 있는지 확인
					int num2 = rs.getInt(1);
					String writer = rs.getString(2);
					String title = rs.getString(3);
					String content = rs.getString(4);
					Date w_date= rs.getDate(5);
					vo = new JoinBoardVo(num2, writer, title, content, w_date);
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
			return vo;
		}
	

		public ArrayList<JoinBoardVo> selectAll() {
			Connection conn = dbconn.conn();
			String sql = "select * from board where parent=? order by num desc";
			ArrayList<JoinBoardVo> list = new ArrayList<>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(new JoinBoardVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5)));
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
		

		public ArrayList<JoinBoardVo> selectReps(int parent) {
			Connection conn = dbconn.conn();
			String sql = "select * from board where parent=? order by num desc";
			ArrayList<JoinBoardVo> list = new ArrayList<>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, parent);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(new JoinBoardVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5)));
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

		
		public void insert(JoinBoardVo vo) {
			Connection conn = dbconn.conn();

			String sql = "insert into board values(seq_board.nextval, ?, ?, ?, sysdate)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getWriter());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getContent());
				
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

		// update: 글번호로 찾아서 title, content를 새 값으로 수정
		public void update(JoinBoardVo vo) {
			Connection conn = dbconn.conn();
			String sql = "update board set title=?, content=? where num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getContent());
				pstmt.setInt(3, vo.getNum());
				int num = pstmt.executeUpdate();
				System.out.println(num + " 줄이 수정됨");
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

		// delete: 글번호로 찾아서 삭제
		public void delete(int num) {
			Connection conn = dbconn.conn();
			String sql = "delete from board where num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				int num2 = pstmt.executeUpdate();
				System.out.println(num2 + " 줄이 삭제됨");
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
		
	