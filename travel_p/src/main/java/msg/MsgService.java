package msg;

import java.util.ArrayList;

public class MsgService {
	private MsgDao dao;
	
	public MsgService() {
		dao = new MsgDao();
	}
	
	public void addMsg(MsgVo vo) {
		dao.insert(vo);
	}
	
	public void delMsg(int num) {
		dao.delete(num);
	}
	
	public ArrayList<MsgVo> getById(String id){
		return dao.selectById(id);
	}
}
