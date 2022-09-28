package kr.co.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.team.service.MypageService;
import kr.co.team.vo.MemberVO;

@Controller
public class MypageController {

	@Autowired
	@Qualifier("ms2")
	private MypageService service;
	
	@RequestMapping("/mypage/myinfo")
	public String myinfo(HttpSession session, Model model)
	{
		return service.myinfo(session,model);
	}
	
	@RequestMapping("/mypage/myinfo_change")
	public String myinfo_change(HttpSession session, Model model)
	{
		return service.myinfo_change(session, model);
	}
	
	@RequestMapping("/mypage/myinfo_change_ok")
	public String myinfo_change_ok(MemberVO mvo, HttpSession session)
	{
		return service.myinfo_change_ok(mvo,session);
	}
	
	@RequestMapping("/mypage/mem_del")
	public String mem_del(HttpSession session)
	{
		return service.mem_del(session);
	}
	
	@RequestMapping("/mypage/change_pwd")
	public String change_pwd(HttpSession session, HttpServletRequest request)
	{
		return service.change_pwd(session,request);
	}
	
}
