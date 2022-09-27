package kr.co.team.mapper;

import java.net.PortUnreachableException;
import java.util.ArrayList;

import kr.co.team.vo.DaeVO;
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
	public ArrayList<ReviewVO> pro_review_list (String userid,String pcode);
	
	//review 작성
	public void pro_review_write_ok(ReviewVO rvo);
}
