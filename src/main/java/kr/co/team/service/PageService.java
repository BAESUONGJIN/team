package kr.co.team.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.team.vo.BaesongVO;
import kr.co.team.vo.BuyVO;

public interface PageService {

	public void wish_add(HttpSession session,HttpServletRequest request,PrintWriter out);
	public void cart_add(HttpSession session,HttpServletRequest request,PrintWriter out);
	public String wish(HttpSession session,Model model);
	public String wish_del(HttpServletRequest request);
	public String select_del(HttpServletRequest request);
	public String move_cart(HttpServletRequest request,HttpSession session);
	public String cart(HttpSession session,Model model);
	public String cart_del(HttpServletRequest request);
	public String buy(HttpServletRequest request,Model model,HttpSession session);
	public void bae_add(HttpSession session,PrintWriter out);
	public String baesong_list(HttpSession session,Model model);
	
	public String juso_add_ok(BaesongVO bvo,HttpSession session);
	public String baesong_edit(HttpServletRequest request,Model model);
	public String baesong_edit_ok(BaesongVO bvo);
	
	public String buy_ok(BuyVO bvo,HttpSession session);
}
