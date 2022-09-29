package kr.co.team.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.team.mapper.MypageMapper;
import kr.co.team.vo.MemberVO;
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
	public String myreview(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		ArrayList<ReviewVO> rlist=mapper.myreview(userid);
		model.addAttribute("rlist",rlist);
		
		return "/mypage/myreview";
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

}
