package kr.co.team.mapper;

import java.util.ArrayList;

import kr.co.team.vo.InquiryVO;
import kr.co.team.vo.MemberVO;
import kr.co.team.vo.ReviewVO;

public interface MypageMapper {

   public MemberVO myinfo(String userid);
   public void myinfo_change_ok(MemberVO mvo);
   public void mem_del(String userid);
   public String getPwd(String userid);
   public void change_pwd(String pwd, String userid);
  
   public ReviewVO myreview_update(String id);
   public void myreview_update_ok(ReviewVO rvo);
   public void myreview_del(String id); 
   
   //상품
   public ArrayList<ReviewVO>myreview(String userid);
   public ArrayList<InquiryVO> mymun(String userid, int start);
   public int mymun_getChong(); //총페이지 구하기
   
   
}
