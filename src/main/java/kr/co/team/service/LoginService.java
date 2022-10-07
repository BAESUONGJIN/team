package kr.co.team.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import kr.co.team.vo.MemberVO;

public interface LoginService {
	
	public String login_ok(MemberVO mvo, HttpSession session);
	public String logout(HttpSession session);
	public void search_id2(MemberVO mvo, PrintWriter out);
	public void search_pwd2(MemberVO mvo, PrintWriter out);
}
