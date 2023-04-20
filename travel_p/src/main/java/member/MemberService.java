package member;

public class MemberService {
	private MemberDao dao;

	public MemberService() {
		dao = new MemberDao();
	}

	// 일반회원가입
	public void join(MemberVo vo) {
		dao.insert(vo);
	}

	// 관리자 회원가입
	public void joinM(MemberVo vo) {
		dao.insertM(vo);
	}

	// 아이디로 검색
	public MemberVo getMember(String id) {
		return dao.select(id);
	}

	// 수정 (비밀번호,이름,이메일,폰번)
	public void editMyInfo(MemberVo vo) {
		dao.update(vo);
	}

	// 탈퇴
	public void delMember(String id) {
		dao.delete(id);
	}

}
