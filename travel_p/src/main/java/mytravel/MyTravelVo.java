package mytravel;

public class MyTravelVo {
	private int num;
	private String id;
	private int travel_id;
	
	
	public MyTravelVo(int num, String id, int travel_id) {
		super();
		this.num = num;
		this.id = id;
		this.travel_id = travel_id;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getTravel_id() {
		return travel_id;
	}


	public void setTravel_id(int travel_id) {
		this.travel_id = travel_id;
	}


	@Override
	public String toString() {
		return "MyTravelVo [num=" + num + ", id=" + id + ", travel_id=" + travel_id + "]";
	}
	
	
}
