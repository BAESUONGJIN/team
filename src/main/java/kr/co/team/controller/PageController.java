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

import kr.co.team.service.PageService;
import kr.co.team.vo.BaesongVO;
import kr.co.team.vo.BuyVO;
import kr.co.team.vo.ReviewVO;

@Controller
public class PageController {

	@Autowired
	@Qualifier("ws")
	private PageService service;
	
	@RequestMapping("/product/wish_add")
	public void wish_add(HttpSession session, HttpServletRequest request, PrintWriter out)
	{
		service.wish_add(session,request,out);
	}
	
	@RequestMapping("/product/cart_add")
	public void cart_add(HttpSession session, HttpServletRequest request, PrintWriter out)
	{
		service.cart_add(session,request,out);
	}
	
	@RequestMapping("/page/wish")
	public String wish(HttpSession session,Model model)
	{
		return service.wish(session, model);
	}
	
	@RequestMapping("/page/wish_del")
	public String wish_del(HttpServletRequest request)
	{
		return service.wish_del(request);
	}
	
	@RequestMapping("/page/select_del")
	public String select_del(HttpServletRequest request)
	{
		return service.select_del(request);
	}
	
	@RequestMapping("/page/move_cart")
	public String move_cart(HttpServletRequest request,HttpSession session)
	{
		return service.move_cart(request,session);
	}
	
	@RequestMapping("/page/cart")
	public String cart(HttpSession session,Model model)
	{
		return service.cart(session,model);
	}
	
	@RequestMapping("/page/cart_del")
	public String cart_del(HttpServletRequest request)
	{
		return service.cart_del(request);
	}
	
	@RequestMapping("/page/buy")
	public String buy(HttpServletRequest request,Model model,HttpSession session)
	{
		return service.buy(request,model,session);
	}
	
	@RequestMapping("/page/bae_add")
	public void bae_add(HttpSession session,PrintWriter out)
	{
		service.bae_add(session,out);
	}
	
	@RequestMapping("/page/baesong_list")
	public String baesong_list(HttpSession session,Model model)
	{
		return service.baesong_list(session,model);
	}
	
	
	@RequestMapping("/page/juso_add")
	public String juso_add()
	{
		return "/page/juso_add";
	}
	
	@RequestMapping("/page/juso_add_ok")
	public String juso_add_ok(BaesongVO bvo,HttpSession session)
	{
		return service.juso_add_ok(bvo,session);
	}   
	
	@RequestMapping("/page/baesong_edit")
	public String baesong_edit(HttpServletRequest request,Model model)
	{
		return service.baesong_edit(request,model);
	}
	
	@RequestMapping("/page/baesong_edit_ok")
	public String baesong_edit_ok(BaesongVO bvo)
	{
		return service.baesong_edit_ok(bvo);
	}
	
	@RequestMapping("/page/buy_ok")
	public String buy_ok(BuyVO bvo,HttpSession session)
	{
		return service.buy_ok(bvo,session);
	}
	
	@RequestMapping("/page/buy_view")
	public String buy_view(Model model,HttpSession session,HttpServletRequest request)
	{
		return service.buy_view(model,session,request);
	}
	
	@RequestMapping("/page/myorder")
	public String myorder(HttpSession session,Model model)
	{
		return service.myorder(session,model);
	}

	@RequestMapping("/page/change_state")
	public String change_state(HttpServletRequest request)
	{
		return service.change_state(request);
	}
	
	@RequestMapping("/page/review")
	public String review(HttpServletRequest request, Model model)
	{
		return service.review(request,model);
	}
	
	@RequestMapping("/page/review_ok")
	public String review_ok(ReviewVO rvo,HttpSession session,HttpServletRequest request)
	{
		return service.review_ok(rvo,session,request);
	}
	
	@RequestMapping("/page/myreview")
	public String myreview(HttpSession session, Model model)
	{
	    return service.myreview(session,model);	
	}
	
	@RequestMapping("/page/review_del")
	public String review_del(HttpServletRequest request)
	{
		return service.review_del(request);
	}
	
	@RequestMapping("/page/review_update")
	public String review_update(HttpServletRequest request, Model model)
	{
		return service.review_update(request,model);
	}
	
	@RequestMapping("/page/review_update_ok")
	public String review_update_ok(ReviewVO rvo)
	{
		return service.review_update_ok(rvo);
	}
	
}
