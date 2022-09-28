package kr.co.team.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.team.mapper.AdminMapper;
import kr.co.team.vo.AdminVO;
import kr.co.team.vo.AnswerVO;
import kr.co.team.vo.DaeVO;
import kr.co.team.vo.FaqVO;
import kr.co.team.vo.InquiryVO;
import kr.co.team.vo.MemberVO;
import kr.co.team.vo.ProductVO;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;
	
	//gongji
	@Override
	public String write_ok(AdminVO avo, HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		String name = session.getAttribute("name").toString();
		avo.setUserid(userid);
		avo.setName(name);
		mapper.write_ok(avo);
		return "redirect:/gongji/list";
	}

	@Override
	public String list(HttpServletRequest request, Model model) {
		int page, start;
		
		//원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));
		start = (page - 1) * 10;
		
		//사용자가 페이지를 이동하기 위해 출력하는 범위
		//pstart, pend
		int pstart, pend;
		pstart = page/10;
		if(page%10 == 0)
			pstart--;
		pstart = pstart*10+1;
		pend = pstart + 9;
		
		//총페이지 구하기
		int chong = mapper.gongji_getChong();
		
		if(chong < pend)
			pend = chong;
		
		
		ArrayList<AdminVO> list = mapper.list(start);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		return "/gongji/list";
	}

	@Override
	public String readnum(HttpServletRequest request) {
		String id = request.getParameter("id");
		mapper.readnum(id);
		return "redirect:/gongji/content?id="+id;
	}

	@Override
	public String content(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		AdminVO avo = mapper.content(id);
		model.addAttribute("avo", avo);
		return "/gongji/content";
	}

	@Override
	public String update(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		AdminVO avo = mapper.content(id);
		model.addAttribute("avo", avo);
		return "/gongji/update";
	}

	@Override
	public String update_ok(AdminVO avo) {
		mapper.update_ok(avo);
		return "redirect:/gongji/content?id="+avo.getId();
	}

	@Override
	public String delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		mapper.delete(id);
		return "redirect:/gongji/list";
	}

	
	//faq
	@Override
	public String faq_write_ok(FaqVO fvo) {
		mapper.faq_write_ok(fvo);
		return "redirect:/faq/faq_list";
	}

	@Override
	public String faq_list(HttpServletRequest request, Model model) {
		int page, start;
		
		//원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));
		start = (page - 1) * 10;
		
		//사용자가 페이지를 이동하기 위해 출력하는 범위
		//pstart, pend
		int pstart, pend;
		pstart = page/10;
		if(page%10 == 0)
			pstart--;
		pstart = pstart*10+1;
		pend = pstart + 9;
		
		//총페이지 구하기
		int chong = mapper.faq_getChong();
		
		if(chong < pend)
			pend = chong;
		
		ArrayList<FaqVO> faq_list = mapper.faq_list(start);
		model.addAttribute("faq_list", faq_list);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		return "faq/faq_list";
	}

	@Override
	public String faq_list_etc(HttpServletRequest request, Model model) {
		int page, start;
		
		//원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));
		start = (page - 1) * 10;
		
		//사용자가 페이지를 이동하기 위해 출력하는 범위
		//pstart, pend
		int pstart, pend;
		pstart = page/10;
		if(page%10 == 0)
			pstart--;
		pstart = pstart*10+1;
		pend = pstart + 9;
		
		int gubun = Integer.parseInt(request.getParameter("gubun"));
		//총페이지 구하기
		int chong = mapper.faq_etc_getChong(gubun);
		
		if(chong < pend)
			pend = chong;
	
		
		ArrayList<FaqVO> flist = mapper.faq_list_etc(gubun, start);
		model.addAttribute("flist", flist);
		model.addAttribute("faq_gubun", gubun);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		return "faq/faq_list_etc";
	}
	
	@Override
	public String faq_delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		mapper.faq_delete(id);
		return "redirect:/faq/faq_list";
	}

	@Override
	public String faq_update(HttpServletRequest request,Model model) {
		String id = request.getParameter("id");
		FaqVO fvo = mapper.faq_update(id);
		model.addAttribute("fvo", fvo);
		return "/faq/faq_update";
	}

	@Override
	public String faq_update_ok(FaqVO fvo) {
		mapper.faq_update_ok(fvo);
		return "redirect:/faq/faq_list";
	}
	
	
	//회원정보
	@Override
	public String mem_list(HttpServletRequest request, Model model) {
		int page, start;
		
		//원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));
		start = (page - 1) * 10;
		
		//사용자가 페이지를 이동하기 위해 출력하는 범위
		//pstart, pend
		int pstart, pend;
		pstart = page/10;
		if(page%10 == 0)
			pstart--;
		pstart = pstart*10+1;
		pend = pstart + 9;
		
		//총페이지 구하기
		int chong = mapper.mem_getChong();
		
		if(chong < pend)
			pend = chong;
		
		ArrayList<MemberVO> mlist = mapper.mem_list(start);
		model.addAttribute("mlist", mlist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		return "/admin/mem_list";
	}

	@Override
	public String mem_content(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		MemberVO mvo = mapper.mem_content(userid);
		model.addAttribute("mvo", mvo);
		return "/admin/mem_content";
	}

	//상품리스트
	@Override
	public String pro_list(HttpServletRequest request, Model model) {
		int page, start;
		
		//원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));
		start = (page - 1) * 10;
		
		//사용자가 페이지를 이동하기 위해 출력하는 범위
		//pstart, pend
		int pstart, pend;
		pstart = page/10;
		if(page%10 == 0)
			pstart--;
		pstart = pstart*10+1;
		pend = pstart + 9;
		
		//총페이지 구하기
		int chong = mapper.pro_getChong();
		
		if(chong < pend)
			pend = chong;
		
		
		ArrayList<ProductVO> plist = mapper.pro_list(start);
		
		int pro_list_count = mapper.pro_list_count();
		model.addAttribute("plist", plist);
		model.addAttribute("pro_list_count", pro_list_count);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		return "/admin/pro_list";
	}
	

	@Override
	public String pro_list_etc(HttpServletRequest request, Model model) {
		String pdae = request.getParameter("pdae");
		
		int page, start;
		
		//원하는 페이지의 시작 인덱스값을 구하기
		if(request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));
		start = (page - 1) * 10;
		
		//사용자가 페이지를 이동하기 위해 출력하는 범위
		//pstart, pend
		int pstart, pend;
		pstart = page/10;
		if(page%10 == 0)
			pstart--;
		pstart = pstart*10+1;
		pend = pstart + 9;
		
		//총페이지 구하기
		int chong = mapper.pro_etc_getChong(pdae);
		
		if(chong < pend)
			pend = chong;
		
		ArrayList<ProductVO> plist = mapper.pro_list_etc(pdae,start);
		int pro_list_etc_count = mapper.pro_list_etc_count(pdae);
		
		model.addAttribute("plist", plist);
		model.addAttribute("pro_list_etc_count", pro_list_etc_count);
		model.addAttribute("pdae", pdae);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		return "/admin/pro_list_etc";
	}
	@Override
	public String pro_content(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		ProductVO pvo = mapper.pro_content(id);
		model.addAttribute("pvo", pvo);
		
		ArrayList<DaeVO> list = mapper.pro_cat();
		model.addAttribute("list", list);
		return "/admin/pro_content";
	}

	@Override
	public String pro_delete(HttpServletRequest request) {
		String id= request.getParameter("id");
		mapper.pro_delete(id);
		return "redirect:/admin/pro_list";
	}

	@Override
	public String pro_update(HttpServletRequest request) {
		//라이브러리를 이용하여 폼태그에 값을 가져오기
		String path="C:\\Users\\Administrator\\git\\team\\src\\main\\webapp\\resources\\img";
		int size=1024*1024*30;
		ProductVO pvo= new ProductVO();
		try
		{
			MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
			pvo.setId(Integer.parseInt(multi.getParameter("id")));
			pvo.setPimg(multi.getFilesystemName("pimg"));
			pvo.setPcode(multi.getParameter("pcode"));
			pvo.setTitle(multi.getParameter("title"));
			pvo.setSize(multi.getParameter("size"));
			pvo.setColor(multi.getParameter("color"));
			pvo.setStock(multi.getParameter("stock"));
			pvo.setCimg(multi.getFilesystemName("cimg"));
			pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
			pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
		}
		catch(Exception e)
		{
					
		}
		mapper.pro_update(pvo);
				
		return "redirect:/admin/pro_list";
	}

	@Override
	public String inquiry_list(Model model) {
		ArrayList<InquiryVO> ilist = mapper.inquiry_list();
		model.addAttribute("ilist", ilist);
		return "/admin/inquiry_list";
	}
	
	@Override
	public String inquiry_content(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		InquiryVO ivo = mapper.inquiry_content(id);
		model.addAttribute("ivo", ivo);
		
		String answer_content = mapper.getAnswer(id);
		model.addAttribute("answer_content", answer_content);
		return "admin/inquiry_content";
	}
}