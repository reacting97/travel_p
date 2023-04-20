package join_board;

import java.util.ArrayList;

import recommandrep.RecommandRepDao;
import recommandrep.RecommandRepVo;

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
	
	public ArrayList<JoinBoardVo> getAll(){
		return dao.selectAll();
	}
	
	public void editBoard(JoinBoardVo vo) {
		dao.update(vo);
	}
	
	public void delBoard(int num) {
		dao.delete(num);
	}
}