package party;

public class PartyVo {
	private String master;
	private String party_member;
	private int party_board;
	
	public PartyVo(String master, String party_member, int party_board) {
		super();
		this.master = master;
		this.party_member = party_member;
		this.party_board = party_board;
	}

	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	public String getParty_member() {
		return party_member;
	}

	public void setParty_member(String party_member) {
		this.party_member = party_member;
	}

	public int getParty_board() {
		return party_board;
	}

	public void setParty_board(int party_board) {
		this.party_board = party_board;
	}

	@Override
	public String toString() {
		return "PartyVo [master=" + master + ", party_member=" + party_member + ", party_board=" + party_board + "]";
	}
	
	
}
