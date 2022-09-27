package kr.co.team.mapper;

import kr.co.team.vo.MemberVO;

public interface LoginMapper {

	public MemberVO login_ok(MemberVO mvo);
	public String search_id2(MemberVO mvo);
	public String search_pwd2(MemberVO mvo);
}
