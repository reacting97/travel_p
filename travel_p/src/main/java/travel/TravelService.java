package travel;

import java.util.ArrayList;

public class TravelService {
	private TravelDAO dao;
	
	public TravelService() {
		dao = new TravelDAO();
	}
	
	public void insert(TravelVO travel) {
		dao.insert(travel);
	}
	
	public void update(TravelVO travel) {
		dao.update(travel);
	}
	
	public void delete(int num) {
		dao.delete(num);
	}
	
	public TravelVO selectByNum(int num) {
		return dao.selectByNum(num);
	}
	
	public ArrayList<TravelVO> selectByName(String name) {
		return dao.selectByName(name);
	}
	
	public ArrayList<TravelVO> selectByLoc(String loc) {
		return dao.selectByLoc(loc);
	}
	
	public ArrayList<TravelVO> selectAll() {
		return dao.selectAll();
	}
}
