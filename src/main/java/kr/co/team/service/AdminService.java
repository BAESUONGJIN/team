package kr.co.team.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.team.vo.AdminVO;
import kr.co.team.vo.FaqVO;
import kr.co.team.vo.ProductVO;

public interface AdminService {
	//gongji
	public String write_ok(AdminVO avo, HttpSession session);
	public String list(HttpServletRequest request, Model model);
	public String readnum(HttpServletRequest request);
	public String content(HttpServletRequest request, Model model);
	public String update(HttpServletRequest request, Model model);
	public String update_ok(AdminVO avo);
	public String delete(HttpServletRequest request);
	
	//faq
	public String faq_write_ok(FaqVO fvo);
	public String faq_list(HttpServletRequest request, Model model);
	public String faq_delete(HttpServletRequest request);
	public String faq_update(HttpServletRequest request,Model model);
	public String faq_update_ok(FaqVO fvo);
	public String faq_list_etc(HttpServletRequest request, Model model);
	
	//회원정보
	public String mem_list(HttpServletRequest request, Model model);
	public String mem_content(HttpServletRequest request, Model model);
	
	//상품리스트
	public String pro_list(HttpServletRequest request, Model model);
	public String pro_list_etc(HttpServletRequest request, Model model);
	public String pro_content(HttpServletRequest request, Model model);
	public String pro_delete(HttpServletRequest request);
	public String pro_update(HttpServletRequest request);
}