package party;

import java.util.ArrayList;

public class PartyService {
	private PartyDao dao;
	
	public PartyService() {
		dao = new PartyDao();
	}
	
	public void AddPartyMember(PartyVo vo) {
		dao.insert(vo);
	}
	
	public PartyVo select(PartyVo vo) {
		return dao.select(vo);
	}
	
	public ArrayList<PartyVo> selectByNum(int num){
		return dao.selectByNum(num);
	}
	
	public void delPartyMember(int num, String id) {
		dao.delete(num, id);
	}
}
