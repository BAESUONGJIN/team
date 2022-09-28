package kr.co.team.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.team.vo.MemberVO;

public interface MypageService {

	public String myinfo(HttpSession session, Model model);
	public String myinfo_change(HttpSession session, Model model);
	public String myinfo_change_ok(MemberVO mvo, HttpSession session);
	public String mem_del(HttpSession session); 
	public String change_pwd(HttpSession session, HttpServletRequest request);
}
