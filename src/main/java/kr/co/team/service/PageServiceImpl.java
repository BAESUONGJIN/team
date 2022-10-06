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
import kr.co.team.vo.ReviewVO;
import kr.co.team.vo.ViewVO;
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
		String su=request.getParameter("su");
		String color=request.getParameter("color");
		String size=request.getParameter("size");
		
		mapper.wish_add(userid,pcode,Integer.parseInt(su),color,size);

		out.print("0");	
	}
	
	@Override
	public void cart_add(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String userid=session.getAttribute("userid").toString();
		String pcode=request.getParameter("pcode");
		String su=request.getParameter("su");
		String color=request.getParameter("color");
		String size=request.getParameter("size");
		
		mapper.cart_add(userid,pcode,Integer.parseInt(su),color,size);
		
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
		String[] su=request.getParameter("su").split(",");
		String[] size=request.getParameter("size").split(",");
		String[] color=request.getParameter("color").split(",");
		String userid=session.getAttribute("userid").toString();
		
		for(int i=0;i<pcode.length;i++)
		{
			mapper.move_cart(userid,pcode[i],su[i],size[i],color[i]);
			
			mapper.wish_del2(userid,pcode[i],su[i],size[i],color[i]);
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
			pvo.setSize(size[i]);
			pvo.setColor(color[i]);

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
		
		Integer number=mapper.getjumun(userid);
		number++;
		
		String num=number.toString();
		
		if(num.length()==1)
			num="000"+num;
		else if(num.length()==2)
		        num="00"+num;
			 else if(num.length()==3)
		             num="0"+num;
		
		String jumunc=userid+num;
		
		bvo.setJumunc(jumunc);
				
		String[] pcode=bvo.getPcode().split(",");
		String[] su=bvo.getSu_imsi().split(",");
		String[] chong=bvo.getChong_imsi().split(",");
		String[] color=bvo.getColor_imsi().split(",");
		String[] size=bvo.getSize_imsi().split(",");
		

		for(int i=0;i<pcode.length;i++)
		{	
			bvo.setPcode(pcode[i]);
			bvo.setSu(Integer.parseInt(su[i]));
			bvo.setChong(Integer.parseInt(chong[i]));
			bvo.setSize(size[i]);
			bvo.setColor(color[i]);
		    mapper.buy_ok(bvo);
		}
		
		return "redirect:/page/buy_view?jumunc="+jumunc;		
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

	@Override
	public String buy_view(Model model,HttpSession session,HttpServletRequest request) {
		
		String userid=session.getAttribute("userid").toString();
		String jumunc=request.getParameter("jumunc");
		
		ArrayList<ViewVO> list=mapper.buy_view(jumunc);
		model.addAttribute("list",list);
		return "/page/buy_view";
	}

	@Override
	public String myorder(HttpSession session, Model model) {
		
		String userid=session.getAttribute("userid").toString();
		ArrayList<BuyVO> list=mapper.myorder(userid);
		model.addAttribute("list",list);
		return "/page/myorder";
	}

	@Override
	public String change_state(HttpServletRequest request) {
		String id=request.getParameter("id");
		String state=request.getParameter("state");
		
		mapper.change_state(id,state);
		
		return "redirect:/page/myorder";
	}
	
	//review 관련
	
	@Override
	public String review(HttpServletRequest request, Model model) {
		String pcode=request.getParameter("pcode");
		String bid=request.getParameter("bid");
		BuyVO bvo=mapper.review(bid);
		model.addAttribute("bvo",bvo);
		model.addAttribute("bid",bid);
		return "/page/review";
	}

	@Override
	public String review_ok(ReviewVO rvo,HttpSession session) {
		rvo.setUserid(session.getAttribute("userid").toString());
		mapper.review_ok(rvo);
		mapper.hugi(rvo.getBid());
		return "redirect:/page/myreview";

	}

	@Override
	public String myreview(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		ArrayList<ReviewVO> rlist=mapper.myreview(userid);
		model.addAttribute("rlist",rlist);
		return "/page/myreview";
	}

	@Override
	public String review_del(HttpServletRequest request) {
		String id=request.getParameter("id");
		String gid=request.getParameter("gid");
		mapper.review_del(id);
		mapper.change_hugi(gid);
		
		return "redirect:/page/myreview";
	}

	@Override
	public String review_update(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		ReviewVO rvo=mapper.review_update(id);
		model.addAttribute("rvo",rvo);
		return "/page/review_update";
	}

	@Override
	public String review_update_ok(ReviewVO rvo) {
		mapper.review_update_ok(rvo);
		return "redirect:/page/myreview";
	}

	
	


	
	
	
}
