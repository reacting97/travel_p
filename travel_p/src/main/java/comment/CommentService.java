package comment;

import java.util.ArrayList;

public class CommentService {
	private CommentDao dao;

	public CommentService() {
		dao = new CommentDao();
	}
	
	public void addComment(CommentVo vo) {
		dao.insert(vo);
	}
	
	public void editComment(String content, int num) {
		dao.update(content, num);
	}
	
	public void delComment(int num) {
		dao.delete(num);
	}
	
	public ArrayList<CommentVo> selectByBoard(int num){
		return dao.selectByBoard(num);
	}
}
