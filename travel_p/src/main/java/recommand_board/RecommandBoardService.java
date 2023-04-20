package recommand_board;

import java.util.ArrayList;


public class RecommandBoardService {
	private RecommandBoardDao dao;
	public RecommandBoardService() {
		dao = new RecommandBoardDao();
	}
	
	public void addBoard(RecommandBoardVo vo) {
		dao.insert(vo);
	}
	
	public RecommandBoardVo getBoard(int num) {
		return dao.select(num);
	}
	//원글 목록 검색
	public ArrayList<RecommandBoardVo> getAll(){
		return dao.selectAll();
	}
	
	//댓글 검색
	public ArrayList<RecommandBoardVo> getReps(int parent){
		return dao.selectReps(parent);
	}
	
	public void editBoard(RecommandBoardVo vo) {
		dao.update(vo);
	}
	
	public void delBoard(int num) {
		dao.delete(num);
	}
}





