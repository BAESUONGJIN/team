package kr.co.team.mapper;

import kr.co.team.vo.MemberVO;

public interface MypageMapper {

   public MemberVO myinfo(String userid);
   public void myinfo_change_ok(MemberVO mvo);
   public void mem_del(String userid);
   public String getPwd(String userid);
   public void change_pwd(String pwd, String userid);
}
