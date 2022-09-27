package kr.co.team.mapper;

import kr.co.team.vo.MemberVO;

public interface MemberMapper {

	public void memberinput_ok(MemberVO mvo);
	public int check_userid(String userid);
}
