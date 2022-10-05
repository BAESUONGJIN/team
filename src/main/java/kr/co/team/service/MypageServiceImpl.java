package kr.co.team.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.team.mapper.MypageMapper;
import kr.co.team.vo.AnswerVO;
import kr.co.team.vo.FaqVO;
import kr.co.team.vo.InquiryVO;
import kr.co.team.vo.MemberVO;
import kr.co.team.vo.ProductVO;
import kr.co.team.vo.ReviewVO;

@Service
@Qualifier("ms2")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageMapper mapper;
	
	@Override
	public String myinfo(HttpSession session, Model model) {
		MemberVO mvo=mapper.myinfo(session.getAttribute("userid").toString());
		model.addAttribute("mvo",mvo);
		return "/mypage/myinfo";
		
	}

	@Override
	public String myinfo_change(HttpSession session, Model model) {
		MemberVO mvo=mapper.myinfo(session.getAttribute("userid").toString());
		model.addAttribute("mvo",mvo);
		
		return "/mypage/myinfo_change";
	}

	@Override
	public String myinfo_change_ok(MemberVO mvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		mvo.setUserid(userid);
		mapper.myinfo_change_ok(mvo);
		
		return "redirect:/mypage/myinfo";
	}
	
	@Override
	public String mem_del(HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		mapper.mem_del(userid);
		session.invalidate();
		return "redirect:/main/index";
	}

	@Override
	public String change_pwd(HttpSession session, HttpServletRequest request) {
		String prepwd=request.getParameter("prepwd");
		String pwd=request.getParameter("pwd");
		String userid=session.getAttribute("userid").toString();
		String dbpwd=mapper.getPwd(userid);
		
		if(dbpwd.equals(prepwd))
		{
			mapper.change_pwd(pwd, userid);
			session.invalidate();
			return "redirect:/main/index";
		}
		else
		{
			return "redirect:/mypage/myinfo";
		}
		
	}


	@Override
	public String myreview_update(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		ReviewVO rvo=mapper.myreview_update(id);
		model.addAttribute("rvo",rvo);
		return "/mypage/myreview_update";
	}

	@Override
	public String myreview_update_ok(ReviewVO rvo) {
		mapper.myreview_update_ok(rvo);
		return "redirect:/mypage/myreview";
	}

	@Override
	public String myreview_del(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.myreview_del(id);
		return "redirect:/mypage/myreview";
	}
	
	@Override
	public String myreview(HttpSession session, Model model,HttpServletRequest request) {

		//페이징 처리
		int page, start;
		
		//원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));
		start = (page - 1) * 10;
		
		//사용자가 페이지를 이동하기 위해 출력하는 범위
		//pstart, pend
		int pstart, pend;
		pstart = page/10;
		if(page%10 == 0)
			pstart--;
		pstart = pstart*10+1;
		pend = pstart + 9;
		
		//총페이지 구하기
		int chong = mapper.mymun_getChong();
		
		if(chong < pend)
			pend = chong;
		
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		
		//상품평, 상품문의 처리
		String userid=session.getAttribute("userid").toString();
		ArrayList<ReviewVO> rlist=mapper.myreview(userid);
	
		ArrayList<InquiryVO> ilist=mapper.mymun(userid, start);
		model.addAttribute("rlist",rlist);   //상품평
		model.addAttribute("ilist",ilist);	//상품문의
		return "/mypage/myreview";
	}


	
	

}
