package like;

public class LikeVo {
	private int num;
	private String user_id;
	private int recommand_num;
	
	
	public LikeVo() {
		
	}
	
	public LikeVo(int num, String user_id, int recommand_num) {
		super();
		this.num = num;
		this.user_id = user_id;
		this.recommand_num = recommand_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getRecommand_num() {
		return recommand_num;
	}

	public void setRecommand_num(int recommand_num) {
		this.recommand_num = recommand_num;
	}

	@Override
	public String toString() {
		return "LikeVo [num=" + num + ", user_id=" + user_id + ", recommand_num=" + recommand_num + "]";
	}
	
}
