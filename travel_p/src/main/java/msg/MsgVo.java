package msg;

public class MsgVo {
	private int num;
	private String id;
	private String content;
	public MsgVo(int num, String id, String content) {
		super();
		this.num = num;
		this.id = id;
		this.content = content;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "MsgVo [num=" + num + ", id=" + id + ", content=" + content + "]";
	}
	
	
}
