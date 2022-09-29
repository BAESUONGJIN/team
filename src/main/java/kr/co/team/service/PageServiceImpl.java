package kr.co.team.service;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.team.mapper.PageMapper;
import kr.co.team.vo.BaesongVO;
import kr.co.team.vo.BuyVO;
import kr.co.team.vo.CartVO;
import kr.co.team.vo.MemberVO;
import kr.co.team.vo.ProductVO;
import kr.co.team.vo.WishVO;

@Service
@Qualifier("ws")
public class PageServiceImpl implements PageService {

	@Autowired
	private PageMapper mapper;

	@Override
	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out){ 
		String userid=session.getAttribute("userid").toString();
		String pcode=request.getParameter("pcode");
		
		mapper.wish_add(userid,pcode);

		out.print("0");	
	}
	
	@Override
	public void cart_add(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String userid=session.getAttribute("userid").toString();
		String pcode=request.getParameter("pcode");
		//수량체크 꼭!!
		//String su=request.getParameter("su");
		
		mapper.cart_add(userid,pcode);
		
		out.print("0");
		
	}
	
	@Override
	public String wish(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		ArrayList<WishVO> list=mapper.wish(userid);
		model.addAttribute("list",list);
		return "/page/wish";
	}

	@Override
	public String wish_del(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.wish_del(id);
		
		return "redirect:/page/wish";
	}

	@Override
	public String select_del(HttpServletRequest request) {
		String[] id=request.getParameter("delid").split(",");
		
		for(int i=0;i<id.length;i++)
		{
			mapper.wish_del(id[i]);
		}
		
		return "redirect:/page/wish";
	}

	@Override
	public String move_cart(HttpServletRequest request,HttpSession session) {
		String[] pcode=request.getParameter("pcode").split(",");
		String userid=session.getAttribute("userid").toString();
		for(int i=0;i<pcode.length;i++)
		{
			mapper.move_cart(userid,pcode[i]);
			
			mapper.wish_del2(userid,pcode[i]);
		}
		return "redirect:/page/cart";
	}

	@Override
	public String cart(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		ArrayList<CartVO> list=mapper.cart(userid);
		model.addAttribute("list",list);
		return "/page/cart";
	}

	@Override
	public String cart_del(HttpServletRequest request) {
		String[] id=request.getParameter("delid").split(",");
		for(int i=0;i<id.length;i++)
		{
			mapper.cart_del(id[i]);
		}
		return "redirect:/page/cart";
	}

	@Override
	public String buy(HttpServletRequest request, Model model,HttpSession session) {
		String[] pcode=request.getParameter("pcode").split(",");
		String[] su=request.getParameter("su").split(",");
		String[] color=request.getParameter("color").split(",");
		String[] size=request.getParameter("size").split(",");
				
		ArrayList<ProductVO> list=new ArrayList<ProductVO>();
		for(int i=0;i<pcode.length;i++)
		{
			ProductVO pvo=mapper.buy(pcode[i]);
			pvo.setSu(Integer.parseInt(su[i]));
			pvo.setSize((size[i]));
			pvo.setColor((color[i]));

			list.add(pvo);
		}
	    
		model.addAttribute("list",list);

				
		String userid=session.getAttribute("userid").toString();
		MemberVO mvo=mapper.member(userid);
		model.addAttribute("mvo",mvo);
		
		BaesongVO bvo=mapper.baesong(userid);
		model.addAttribute("bvo",bvo);
		

		return "/page/buy";
	}
	
	@Override
	public String buy_ok(BuyVO bvo,HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		bvo.setUserid(userid);
		mapper.buy_ok(bvo);
		
		return "redirect:/page/buy_view?jumuncode=";		
	}

	

	@Override
	public void bae_add(HttpSession session, PrintWriter out) {
		String userid=session.getAttribute("userid").toString();
		MemberVO mvo=mapper.member(userid);

		mapper.bae_add(mvo);

	    String str="";   
	    str=URLEncoder.encode(mvo.getName())+","; 
	    str=str+URLEncoder.encode(mvo.getJuso())+" "+URLEncoder.encode(mvo.getJuso_etc())+",";
	    str=str+mvo.getPhone();
	    
	    str=str.replace("+", " ");
	    
	    out.print(str);
	}

	@Override
	public String baesong_list(HttpSession session,Model model) {
		String userid=session.getAttribute("userid").toString();
		ArrayList<BaesongVO> list=mapper.baesong_list(userid);
		model.addAttribute("list",list);
		return "/page/baesong_list";
	}
	
	@Override
	public String juso_add_ok(BaesongVO bvo,HttpSession session) {
		bvo.setUserid(session.getAttribute("userid").toString());
		mapper.juso_add_ok(bvo);
		return "redirect:/page/baesong_list";
	}

	@Override
	public String baesong_edit(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		BaesongVO bvo=mapper.baesong_edit(id);
		model.addAttribute("bvo",bvo);
		return "/page/baesong_edit";
	}

	@Override
	public String baesong_edit_ok(BaesongVO bvo) {
		mapper.baesong_edit_ok(bvo);
		return "redirect:/page/baesong_list";
   }

	
	


	
	
	
}
