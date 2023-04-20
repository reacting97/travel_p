package recommandrep;

import java.util.ArrayList;

import recommand_board.RecommandBoardDao;
import recommand_board.RecommandBoardVo;

public class RecommandRepService {
	private RecommandBoardDao dao;
	
	public RecommandRepService() {
		dao = new RecommandBoardDao();
	}
	
	public void addImg(RecommandBoardVo vo) {
		dao.insert(vo);
	}
	
	public RecommandBoardVo getImg(int num) {
		return dao.select(num);
	}
	
	public ArrayList<RecommandBoardVo> getAll(){
		return dao.selectAll();
	}
	
	public void editImg(RecommandBoardVo vo) {
		dao.update(vo);
	}
	
	public void delImg(int num) {
		dao.delete(num);
		
		
	
		
	}
}
