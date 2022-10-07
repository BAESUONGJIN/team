package kr.co.team.mapper;

import java.util.ArrayList;

import kr.co.team.vo.BaesongVO;
import kr.co.team.vo.BuyVO;
import kr.co.team.vo.CartVO;
import kr.co.team.vo.MemberVO;
import kr.co.team.vo.ProductVO;
import kr.co.team.vo.ReviewVO;
import kr.co.team.vo.ViewVO;
import kr.co.team.vo.WishVO;

public interface PageMapper {
	public void wish_add(String userid,String pcode,int su,String color,String size);
	public void cart_add(String userid,String pcode,int su,String color,String size);
	public ArrayList<WishVO> wish(String userid);
	public void wish_del(String id);
	public void move_cart(String userid,String pcode,String su,String size,String color);
	public void wish_del2(String userid,String pcode,String su,String size,String color);
	public ArrayList<CartVO> cart(String userid);
	public void cart_del(String id);
	public void cart_del2(String userid,String pcode,String size,String color);
	public ProductVO buy(String pcode);
	
	public MemberVO member(String userid);
	
	public BaesongVO baesong(String userid);
	public void bae_add(MemberVO mvo);
	public ArrayList<BaesongVO>baesong_list(String userid);
	
	public void juso_add_ok(BaesongVO bvo);
    
    public BaesongVO baesong_edit(String id);
    public void baesong_edit_ok(BaesongVO bvo);

    public void buy_ok(BuyVO bvo);
    public Integer getjumun(String userid);
    public ArrayList<ViewVO>buy_view(String jumunc);
    
    public ArrayList<BuyVO> myorder(String userid);
    public void change_state(String id,String state);
    
    public BuyVO review(String bid);
    public void review_ok(ReviewVO rvo);
    public void hugi(int id);
    public ArrayList<ReviewVO> myreview(String userid);
    public void review_del(String id);
    public void del_hugi(String bid);
    public ReviewVO review_update(String id);
    public void review_update_ok(ReviewVO rvo);
    
}
