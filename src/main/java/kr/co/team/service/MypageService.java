package kr.co.team.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.team.vo.MemberVO;
import kr.co.team.vo.ReviewVO;

public interface MypageService {

	public String myinfo(HttpSession session, Model model);
	public String myinfo_change(HttpSession session, Model model);
	public String myinfo_change_ok(MemberVO mvo, HttpSession session);
	public String mem_del(HttpSession session); 
	public String change_pwd(HttpSession session, HttpServletRequest request);
	public String myreview(HttpSession session, Model model);
	public String myreview_update(HttpServletRequest request, Model model); 
	public String myreview_update_ok(ReviewVO rvo);
}
