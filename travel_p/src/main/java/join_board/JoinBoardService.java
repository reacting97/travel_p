package join_board;

import java.util.ArrayList;

public class JoinBoardService {

	private JoinBoardDao dao;
	public JoinBoardService() {
		dao = new JoinBoardDao();
	}
	
	public void addBoard(JoinBoardVo vo) {
		dao.insert(vo);
	}
	
	public JoinBoardVo getBoard(int num) {
		return dao.select(num);
	}
	//원글 목록 검색
	public ArrayList<JoinBoardVo> getAll(){
		return dao.selectAll();
	}
	
	//댓글 검색
	public ArrayList<JoinBoardVo> getReps(int parent){
		return dao.selectReps(parent);
	}
	
	public void editBoard(JoinBoardVo vo) {
		dao.update(vo);
	}
	
	public void delBoard(int num) {
		dao.delete(num);
	}
}


