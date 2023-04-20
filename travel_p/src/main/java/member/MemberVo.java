package member;

public class MemberVo {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String manager;

	public MemberVo() {
	}

	public MemberVo(String id, String pwd, String name, String email, String phone, String manager) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.manager = manager;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", manager=" + manager + "]";
	}

}
