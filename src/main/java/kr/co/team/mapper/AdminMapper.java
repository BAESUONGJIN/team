package kr.co.team.mapper;

import java.util.ArrayList;

import kr.co.team.vo.AdminVO;
import kr.co.team.vo.AnswerVO;
import kr.co.team.vo.DaeVO;
import kr.co.team.vo.FaqVO;
import kr.co.team.vo.InquiryVO;
import kr.co.team.vo.MemberVO;
import kr.co.team.vo.ProductVO;

public interface AdminMapper {
	
	//gongji
	public void write_ok(AdminVO avo);
	public ArrayList<AdminVO> list(int start);
	public int gongji_getChong();
	public void readnum(String id);
	public AdminVO content(String id);
	public void update_ok(AdminVO avo);
	public void delete(String id);
	
	//faq
	public void faq_write_ok(FaqVO fvo);
	public ArrayList<FaqVO> faq_list(int start);
	public int faq_getChong();
	public ArrayList<FaqVO> faq_list_etc(int gubun, int start);
	public int faq_etc_getChong(int gubun);
	public void faq_delete(String id);
	public FaqVO faq_update(String id);
	public void faq_update_ok(FaqVO fvo);
	
	//회원정보
	public ArrayList<MemberVO> mem_list(int start);
	public int mem_getChong(); //총페이지 구하기
	public MemberVO mem_content(String userid);
	
	//상품리스트
	public ArrayList<ProductVO> pro_list(int start);
	public int pro_list_count();
	public int pro_getChong();
	public ArrayList<ProductVO> pro_list_etc(String pdae,int start);
	public int pro_list_etc_count(String pdae);
	public int pro_etc_getChong(String pdae);
	
	public ProductVO pro_update(String id);
	public void pro_delete(String id);
	public ArrayList<DaeVO> pro_cat();
	public void pro_update_ok(ProductVO pvo);
	
	//상품문의
	public ArrayList<InquiryVO> inquiry_list();
	public InquiryVO inquiry_content(String id);
	public String getAnswer(String id);
}