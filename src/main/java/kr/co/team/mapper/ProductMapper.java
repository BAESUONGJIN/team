package kr.co.team.mapper;

import java.net.PortUnreachableException;
import java.util.ArrayList;

import kr.co.team.vo.DaeVO;
import kr.co.team.vo.InquiryVO;
import kr.co.team.vo.ProductVO;
import kr.co.team.vo.ReviewVO;

public interface ProductMapper {

	public  ArrayList<DaeVO> getdae(String dcode);
	public Integer getbunho(String dcode);
	public ArrayList<DaeVO> pro_write();
	public void pro_write_ok(ProductVO pvo);
	public int getchong(int pcnt,String dcode);
	public ArrayList<ProductVO> pro_list(String dcode, int start, int pcnt);
	public ProductVO pro_content(String pcode);

	
	
	//review 상품평 작성 및 리스트
	public void pro_review_write_ok(ReviewVO rvo);
	public ArrayList<ReviewVO> pro_review_list (String pcode);
	
	//inquiry 상품문의 작성 및 리스트
	public ArrayList<InquiryVO> pro_inquiry_list(String pcode);
	public void pro_inquiry_write_ok(InquiryVO ivo);
	
	//wish 관한
	public int checkwish(String userid,String pcode);
	public void wish_cancel(String pcode, String userid);
	
}
