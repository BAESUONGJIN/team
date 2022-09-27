package kr.co.team.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.team.service.LoginService;
import kr.co.team.vo.MemberVO;

@Controller
public class LoginController {

	@Autowired
	@Qualifier("ls")
	private LoginService service;
	
	@RequestMapping("/login/login")
	public String login(HttpServletRequest request,Model model)
	{
		model.addAttribute("err", request.getParameter("err"));
		return "/login/login";
	}
	
	@RequestMapping("/login/login_ok")
	public String login_ok(MemberVO mvo, HttpSession session)
	{
		return service.login_ok(mvo,session);
	}
	
	@RequestMapping("/login/logout")
	public String logout(HttpSession session)
	{
		return service.logout(session);
	}
	
	@RequestMapping("/login/search_pwd")
	public String search_pwd()
	{
		return "/login/search_pwd";
	}
	
	@RequestMapping("/login/search_id")
	public String search_id()
	{
		return "/login/search_id";
	}
	
	@RequestMapping("/login/search_id2")
	public void search_id2(MemberVO mvo,PrintWriter out)
	{
		service.search_id2(mvo,out);
	}
	
	@RequestMapping("/login/search_pwd2")
	public void search_pwd2(MemberVO mvo, PrintWriter out)
	{
		service.search_pwd2(mvo,out);
	}
	

}
