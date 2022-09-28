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
import kr.co.team.vo.ReviewVO;

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
	
	@RequestMapping("/mypage/myreview")
	public String myreview(HttpSession session, Model model)
	{
		return service.myreview(session,model);
	}
	
	@RequestMapping("/mypage/myreview_update")
	public String myreview_update(HttpServletRequest request, Model model)
	{
		return service.myreview_update(request,model);
	}
	
	@RequestMapping("/mypage/myreview_update_ok")
	public String myreview_update_ok(ReviewVO rvo)
	{
		return service.myreview_update_ok(rvo);
	}
	
}
