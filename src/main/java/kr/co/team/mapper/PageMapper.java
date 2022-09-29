package kr.co.team.mapper;

import java.util.ArrayList;

import kr.co.team.vo.BaesongVO;
import kr.co.team.vo.BuyVO;
import kr.co.team.vo.CartVO;
import kr.co.team.vo.MemberVO;
import kr.co.team.vo.ProductVO;
import kr.co.team.vo.WishVO;

public interface PageMapper {
	public void wish_add(String userid,String pcode);
	public void cart_add(String userid,String pcode);
	public ArrayList<WishVO> wish(String userid);
	public void wish_del(String id);
	public void move_cart(String userid,String pcode);
	public void wish_del2(String userid,String pcode);
	public ArrayList<CartVO> cart(String userid);
	public void cart_del(String id);
	
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
    
}
