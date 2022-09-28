package kr.co.team.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.team.service.AdminService;
import kr.co.team.vo.AdminVO;
import kr.co.team.vo.AnswerVO;
import kr.co.team.vo.FaqVO;
import kr.co.team.vo.ProductVO;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	//gongji
	@RequestMapping("/gongji/write")
	public String write()
	{
		return "/gongji/write";
	}
	
	@RequestMapping("/gongji/write_ok")
	public String write_ok(AdminVO avo, HttpSession session)
	{
		return service.write_ok(avo, session);
	}
	
	@RequestMapping("/gongji/list")
	public String list(HttpServletRequest request, Model model)
	{
		return service.list(request, model);
	}
	
	@RequestMapping("/gongji/readnum")
	public String readnum(HttpServletRequest request)
	{
		return service.readnum(request);
	}
	
	@RequestMapping("/gongji/content")
	public String content(HttpServletRequest request,Model model)
	{
		return service.content(request, model);
	}
	
	@RequestMapping("/gongji/update")
	public String update(HttpServletRequest request,Model model)
	{
		return service.update(request, model);
	}
	
	@RequestMapping("/gongji/update_ok")
	public String update_ok(AdminVO avo)
	{
		return service.update_ok(avo);
	}
	
	@RequestMapping("/gongji/delete")
	public String delete(HttpServletRequest request)
	{
		return service.delete(request);
	}
	
	
	//faq
	@RequestMapping("/faq/faq_write")
	public String faq_write()
	{
		return "/faq/faq_write";
	}
	
	@RequestMapping("faq/faq_write_ok")
	public String faq_write_ok(FaqVO fvo)
	{
		return service.faq_write_ok(fvo);
	}
	
	@RequestMapping("/faq/faq_list")
	public String faq_list(HttpServletRequest request, Model model)
	{
		return service.faq_list(request, model);
	}
	
	@RequestMapping("/faq/faq_delete")
	public String faq_delete(HttpServletRequest request)
	{
		return service.faq_delete(request);
	}
	
	@RequestMapping("/faq/faq_update")
	public String faq_update(HttpServletRequest request,Model model)
	{
		return service.faq_update(request,model);
	}
	
	@RequestMapping("/faq/faq_update_ok")
	public String faq_update_ok(FaqVO fvo)
	{
		return service.faq_update_ok(fvo);
	}
	
	@RequestMapping("/faq/faq_list_etc")
	public String faq_list_etc(HttpServletRequest request, Model model)
	{
		return service.faq_list_etc(request,model);
	}
	
	
	//admin(회원리스트)
	@RequestMapping("/admin/mem_list")
	public String mem_list(HttpServletRequest request, Model model)
	{
		return service.mem_list(request, model);
	}
	
	@RequestMapping("/admin/mem_content")
	public String mem_content(HttpServletRequest request, Model model)
	{
		return service.mem_content(request,model);
	}
	
	//상품리스트
	@RequestMapping("/admin/pro_list")
	public String pro_list(HttpServletRequest request, Model model)
	{
		return service.pro_list(request, model);
	}
	
	@RequestMapping("/admin/pro_list_etc")
	public String pro_list_etc(HttpServletRequest request, Model model)
	{
		return service.pro_list_etc(request,model);
	}
	
	@RequestMapping("/admin/pro_content")
	public String pro_content(HttpServletRequest request, Model model)
	{
		return service.pro_content(request, model);
	}
	
	@RequestMapping("/admin/pro_delete")
	public String pro_delete(HttpServletRequest request)
	{
		return service.pro_delete(request);
	}
	
	@RequestMapping("/admin/pro_update")
	public String pro_update(HttpServletRequest request)
	{
		return service.pro_update(request);
	}
	
	
	//상품문의
	@RequestMapping("/admin/inquiry_list")
	public String inquiry_list(Model model)
	{
		return service.inquiry_list(model);
	}
	
	@RequestMapping("/admin/inquiry_content")
	public String inquiry_content(HttpServletRequest request, Model model)
	{
		return service.inquiry_content(request, model);
	}
}