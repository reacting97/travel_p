package recommand_board;

import java.util.ArrayList;


import recommandrep.RecommandRepVo;

public class RecommandBoardService {
	private  RecommandBoardDao dao;
	
	public RecommandBoardService() {
		dao = new RecommandBoardDao();
	}
	
	public void addBoard(RecommandBoardVo vo) {
		dao.insert(vo);
	}
	
	public RecommandBoardVo getBoard(int num) {
		return dao.select(num);
	}
	
	public ArrayList<RecommandBoardVo> getAll(){
		return dao.selectAll();
	}
	
	public void editBoard(RecommandBoardVo vo) {
		dao.update(vo);
	}
	
	public void delBoard(int num) {
		dao.delete(num);
	}
	
	public ArrayList<RecommandBoardVo> getByWriter(String writer){
		return dao.selectByWriter(writer);
	}
		
}
