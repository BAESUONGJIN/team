package kr.co.team.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.team.vo.InquiryVO;
import kr.co.team.vo.ProductVO;
import kr.co.team.vo.ReviewVO;

public interface ProductService {

	public void getdae(HttpServletRequest request, PrintWriter out);
	public void getbunho(HttpServletRequest request,PrintWriter out); //대분류 번호 가져오기
	public String pro_write(HttpServletRequest request,Model model);
	public String pro_write_ok(HttpServletRequest request);
	public String pro_list(HttpServletRequest request,Model model,ProductVO pvo);
	public String pro_readnum(HttpServletRequest request);
	public String pro_content(HttpServletRequest request, Model model, HttpSession session);    
	
	
	//review 작성
	public String pro_review_write_ok(ReviewVO rvo,HttpSession session, HttpServletRequest request);
	
	//상품 문의 Inquiry 작성
	public String pro_inquiry_write_ok(InquiryVO ivo,HttpSession session, HttpServletRequest request);
	
	//찜 삭제
	public String wish_cancel(HttpSession session,HttpServletRequest request);
	
	//new 상품
	public String pro_newlist(HttpServletRequest request, Model model);
	
	//best상품
	public String pro_bestlist(HttpServletRequest request, Model model);
}
