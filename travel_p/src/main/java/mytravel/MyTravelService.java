package mytravel;

import java.util.ArrayList;

public class MyTravelService {
	private MyTravelDao dao;
	
	public MyTravelService() {
		dao = new MyTravelDao();
	}
	
	public void addMyTravel(MyTravelVo vo) {
		dao.insert(vo);
	}
	
	public void delMyTravel(int num) {
		dao.delete(num);
	}
	
	public ArrayList<MyTravelVo> getById(String id){
		return dao.selectById(id);
	}
	
	public MyTravelVo getByIdNum(String id, int num) {
		return dao.select(id, num);
	}
}
