package travel;

public class TravelVO {
	private int id;
	private String name;
	private String address;
	private String phone;
	private String content;
	private String pic1;
	private String pic2;
	private String pic3;
	
	public TravelVO() {}
	
	public TravelVO(int id, String name, String address, String phone, String content, String pic1, String pic2,
			String pic3) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.content = content;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getPic3() {
		return pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}

	@Override
	public String toString() {
		return "TravelVO [id=" + id + ", name=" + name + ", address=" + address + ", phone=" + phone + ", content="
				+ content + ", pic1=" + pic1 + ", pic2=" + pic2 + ", pic3=" + pic3 + "]";
	}
}
