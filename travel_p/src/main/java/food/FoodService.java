package food;

import java.util.ArrayList;

public class FoodService {
	private FoodDAO dao;
	
	public FoodService() {
		dao = new FoodDAO();
	}
	
	public void insert(FoodVO travel) {
		dao.insert(travel);
	}
	
	public void update(FoodVO travel) {
		dao.update(travel);
	}
	
	public void delete(int num) {
		dao.delete(num);
	}
	
	public ArrayList<FoodVO> selectByLoc(String loc) {
		return dao.selectByLoc(loc);
	}
	
	public ArrayList<FoodVO> selectAll() {
		return dao.selectAll();
	}
}
