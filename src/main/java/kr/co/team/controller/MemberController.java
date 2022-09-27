package kr.co.team.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.team.service.MemberService;
import kr.co.team.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/member/memberinput")
	public String memberinput()
	{
		return "/member/memberinput";
	}
	
	@RequestMapping("/member/memberinput_ok")
	public String memberinput_ok(MemberVO mvo)
	{
		return service.memberinput_ok(mvo);
	}
	
	@RequestMapping("/member/check_userid")
	public void check_userid(HttpServletRequest request, PrintWriter out)
	{
		service.check_userid(request,out);
	}
}
