package record_board;

import java.util.ArrayList;

public class RecordBoardService {
	private RecordBoardDao dao;
	
	public RecordBoardService() {
		dao = new RecordBoardDao();
	}
	
	public void addBoard(RecordBoardVo vo) {
		dao.insert(vo);
	}
	
	public void editBoard(String content, int num) {
		dao.update(content, num);
	}
	
	public void delBoard(int num) {
		dao.delete(num);
	}
	
	public RecordBoardVo selectByNum(int num) {
		return dao.select(num);
	}
	
	public ArrayList<RecordBoardVo> selectAll() {
		return dao.selectAll();
	}
	
	public void upCnt(int num) {
		dao.upCnt(num);
	}
}