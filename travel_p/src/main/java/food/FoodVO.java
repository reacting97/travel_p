package food;

public class FoodVO {
	private int num;
	private String name;
	private String address;
	private String phone;
	private String pic1;
	private String pic2;
	
	public FoodVO() {}

	public FoodVO(int num, String name, String address, String phone, String pic1, String pic2) {
		this.num = num;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.pic1 = pic1;
		this.pic2 = pic2;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	@Override
	public String toString() {
		return "FoodVO [num=" + num + ", name=" + name + ", address=" + address + ", phone=" + phone + ", pic1=" + pic1
				+ ", pic2=" + pic2 + "]";
	}
}
