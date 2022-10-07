package kr.co.team.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.team.service.ProductService;
import kr.co.team.vo.InquiryVO;
import kr.co.team.vo.ProductVO;
import kr.co.team.vo.ReviewVO;

@Controller
public class ProductController {

	@Autowired(required=false)
	@Qualifier("product")
	private ProductService service;
	
	@RequestMapping("/product/getdae")
	public void getdae(HttpServletRequest request,PrintWriter out)
	{
		service.getdae(request,out);
	}
	@RequestMapping("/product/getbunho")
	public void getbunho(HttpServletRequest request,PrintWriter out)
	{
		service.getbunho(request,out);
	}
	
	@RequestMapping("/product/pro_write")
	public String pro_write(HttpServletRequest request,Model model) {
		return service.pro_write(request, model);
	}
	@RequestMapping("/product/pro_write_ok")
	public String pro_write_ok(HttpServletRequest request) {
		return service.pro_write_ok(request);
	}
	
	@RequestMapping("/product/pro_list")
	public String pro_list(HttpServletRequest request,Model model,ProductVO pvo)
	{
		return service.pro_list(request,model,pvo);
	}

	@RequestMapping("/product/pro_readnum")
	public String pro_readnum(HttpServletRequest request)
	{
		return service.pro_readnum(request);
	}
	
	@RequestMapping("/product/pro_content")
	public String pro_content(HttpServletRequest request,Model model,HttpSession session)
	{
		return service.pro_content(request,model,session);
	}
	@RequestMapping("/product/pro_review_write_ok")
	public String pro_review_write_ok(ReviewVO rvo,HttpSession session, HttpServletRequest request) {
		return service.pro_review_write_ok(rvo,session,request);
	}
	
	@RequestMapping("/product/pro_inquiry_write_ok")
	public String pro_inquiry_write_ok(InquiryVO ivo,HttpSession session,HttpServletRequest request) {
		return service.pro_inquiry_write_ok(ivo,session,request);
		
	}
	
	@RequestMapping("/product/wish_cancel")
	public String wish_cancel(HttpSession session,HttpServletRequest request)
	{
		return service.wish_cancel(session,request);
	}
	
	
}
