package like;

public class LikeService {
private LikeDao dao;
	
	public LikeService() {
		dao = new LikeDao();
	}
	
	public void upLike(LikeVo vo) {
		dao.insert(vo);
	}
	
	public void downLike(LikeVo vo) {
		dao.delete(vo);
	}
	
	public int getLike(int num) {
		return dao.selectLike(num);
	}
	
	public LikeVo getVo(int num, String id) {
		return dao.selectByNum(num, id);
	}
}
