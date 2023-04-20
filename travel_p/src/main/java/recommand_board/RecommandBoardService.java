package recommand_board;

import java.util.ArrayList;


import recommandrep.RecommandRepVo;

public class RecommandBoardService {
	private  RecommandBoardDao dao;
	
	public RecommandBoardService() {
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
		
	public ArrayList<RecommandRepVo> getReps(int pnum){
			return dao.selectByPnum(pnum);
		
		
	}
}
