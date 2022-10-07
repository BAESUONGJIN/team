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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.team.mapper.ProductMapper;
import kr.co.team.vo.AnswerVO;
import kr.co.team.vo.DaeVO;
import kr.co.team.vo.InquiryVO;
import kr.co.team.vo.MemberVO;
import kr.co.team.vo.ProbestVO;
import kr.co.team.vo.ProductVO;
import kr.co.team.vo.PronewVO;
import kr.co.team.vo.ReviewVO;

@Service
@Qualifier("product")
public class ProductServiceImpl implements ProductService {
	
	@Autowired(required=false)
	private ProductMapper mapper;

	
	@Override
	public void getdae(HttpServletRequest request, PrintWriter out) {
		String dcode = request.getParameter("dcode");
		ArrayList<DaeVO> list = mapper.getdae(dcode);
		
		//optiong태그를 생성해서 전달
		String str="";
		//ArrayList => list.get(0)..
		for(int i=0; i<list.size();i++)
		{
			DaeVO dvo =list.get(i);
			str=str+"<option value='"+dvo.getDcode()+"'>"+URLEncoder.encode(dvo.getTitle())+"</option>";
			
		}
		//System.out.println("str"+str);
		out.print(str);
	}
	
	@Override
	public void getbunho(HttpServletRequest request, PrintWriter out) {
		
		String code=request.getParameter("code");
		Integer bunho=mapper.getbunho(code);
		out.print(bunho);
		//System.out.println("번호"+bunho);
		
	}
	
	@Override
	public String pro_write(HttpServletRequest request,Model model) {
		ArrayList<DaeVO> list =mapper.pro_write();
		
		model.addAttribute("list",list);
		return "/product/pro_write";
	}

	@Override
	public String pro_write_ok(HttpServletRequest request) {
		//라이브러리를 이용하여 폼태그에 값을 가져오기
		String path="C:\\Users\\Administrator\\git\\team\\src\\main\\webapp\\resources\\img";
		/*String path="C:\\Users\\jjs20\\git\\team\\src\\main\\webapp\\resources\\img";*/
		int size=1024*1024*30;
		ProductVO pvo= new ProductVO();
		
		try
		{
			MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
			pvo.setPimg(multi.getFilesystemName("pimg"));
			pvo.setPcode(multi.getParameter("pcode"));
			pvo.setDcode(multi.getParameter("dcode"));
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
		mapper.pro_write_ok(pvo);
		
		return "redirect:/product/pro_list?dcode="+pvo.getDcode();
	}

	@Override
	public String pro_list(HttpServletRequest request, Model model,ProductVO pvo) {
		int page; //현재페이지
		int start;
		int pcnt; //페이지당 레코드 갯수 구하기
		
	
		if(request.getParameter("pcnt")==null)
			pcnt=9;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		//원하는 페이지의 시작 인덱스값 구하기
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		//페이지 이동 범위
		//startpage(시작 페이지),endpage (끝페이지)
		
		int startpage,endpage;
		
		startpage=page/10;
		if(page%10 == 0)
			startpage--;
		
		startpage=startpage*10+1;
		endpage=startpage+9;
		
		//총페이지 구한후 view 전달
		String dcode=pvo.getDcode();
		//System.out.println(dcode);
		int chongpage=mapper.getchong(pcnt,dcode);
		
		if(chongpage < endpage)
			endpage=chongpage;
		
		String pcode =request.getParameter("pcode");
		ArrayList<ProductVO> list = mapper.pro_list(dcode,start,pcnt);
	
		
		model.addAttribute("list", list);
		model.addAttribute("page", page); //현재페이지
		model.addAttribute("startpage", startpage); //시작페이지
		model.addAttribute("endpage", endpage); //끝페이지
		model.addAttribute("pcnt", pcnt); //페이지당 레코드 갯수
		model.addAttribute("chongpage", chongpage); //총페이지수
		model.addAttribute("dcode", dcode);
		return "/product/pro_list";
	}

	@Override
	public String pro_readnum(HttpServletRequest request) {
		String pcode = request.getParameter("pcode");
		mapper.pro_readnum(pcode);
		return "redirect:/product/pro_content?pcode="+pcode;
	}
	
	@Override
	public String pro_content(HttpServletRequest request, Model model,HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		String pcode = request.getParameter("pcode");
		
		ProductVO pvo = mapper.pro_content(pcode);
		pvo.setSize2(pvo.getSize().split(","));
		pvo.setColor2(pvo.getColor().split(","));
		pvo.setStock2(pvo.getStock().split(","));
		
		model.addAttribute("pvo", pvo);
		
		
		
		// review list   상품평
		ArrayList<ReviewVO> rlist = mapper.pro_review_list(pcode);
		model.addAttribute("rlist",rlist);
		
		//inquiry list  상품문의
		ArrayList<InquiryVO> ilist = mapper.pro_inquiry_list(pcode,userid);
		model.addAttribute("ilist",ilist);
		
		//answer_content 상품문의 답글
		ArrayList<InquiryVO> ilist1 = mapper.answer_content();
		model.addAttribute("ilist1", ilist1);
		//wish존재 여부확인
		int wishcnt;
		if(session.getAttribute("userid")==null)
		{
			wishcnt=0;
		}
		 else 
			{
				session.getAttribute("userid").toString();
				int num=mapper.checkwish(userid,pcode);
				if(num==0)
					{
						wishcnt=0;
					}
					else
					{
						wishcnt=1;
					}
				}
				model.addAttribute("wishcnt",wishcnt);
		
		return "/product/pro_content";
	}

	@Override
	public String pro_review_write_ok(ReviewVO rvo,HttpSession session, HttpServletRequest request) {
				
				rvo.setUserid(session.getAttribute("userid").toString());
				rvo.setPcode(request.getParameter("pcode"));
				rvo.setContent(request.getParameter("content").replace("\r\n", "<br>"));
				
				
				mapper.pro_review_write_ok(rvo);
				
				return "redirect:/product/pro_content?pcode="+rvo.getPcode();
	}

	@Override
	public String pro_inquiry_write_ok(InquiryVO ivo, HttpSession session, HttpServletRequest request) {
		AnswerVO avo = new AnswerVO();
		ivo.setUserid(session.getAttribute("userid").toString());
		ivo.setTitle(request.getParameter("title"));
		ivo.setPcode(request.getParameter("pcode"));
		ivo.setCid(avo.getCid());
		ivo.setContent1(avo.getContent());
		
		mapper.pro_inquiry_write_ok(ivo);
		
		return "redirect:/product/pro_content?pcode="+ivo.getPcode();
	}
	
	@Override
	public String wish_cancel(HttpSession session,HttpServletRequest request) {
		String pcode=request.getParameter("pcode");
		String userid=session.getAttribute("userid").toString();
		
		mapper.wish_cancel(pcode,userid);
		return "redirect:/product/pro_content?pcode="+pcode;
	}
	
	
	//new상품
	@Override
	public String pro_newlist(HttpServletRequest request, Model model) {
		mapper.pro_new_del();
		mapper.pro_new_ok();
		int page; //현재페이지
		int start;
		int pcnt; //페이지당 레코드 갯수 구하기
		
	
		if(request.getParameter("pcnt")==null)
			pcnt=9;
		else
			pcnt=Integer.parseInt(request.getParameter("pcnt"));
		
		//원하는 페이지의 시작 인덱스값 구하기
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		start=(page-1)*pcnt;
		
		//페이지 이동 범위
		//startpage(시작 페이지),endpage (끝페이지)
		
		int startpage,endpage;
		
		startpage=page/10;
		if(page%10 == 0)
			startpage--;
		
		startpage=startpage*10+1;
		endpage=startpage+9;
		
		int chongpage=mapper.newlist_getchong(pcnt);
		
		if(chongpage < endpage)
			endpage=chongpage;
		
		ArrayList<PronewVO> plist = mapper.pro_newlist(start,pcnt);
		model.addAttribute("plist", plist);
		model.addAttribute("page", page); //현재페이지
		model.addAttribute("startpage", startpage); //시작페이지
		model.addAttribute("endpage", endpage); //끝페이지
		model.addAttribute("pcnt", pcnt); //페이지당 레코드 갯수
		model.addAttribute("chongpage", chongpage); //총페이지수
		return "/product/pro_newlist";
	}

	
	//best상품
		@Override
		public String pro_bestlist(HttpServletRequest request, Model model) {
			mapper.pro_best_del();
			mapper.pro_best_ok();
			int page; //현재페이지
			int start;
			int pcnt; //페이지당 레코드 갯수 구하기
			
		
			if(request.getParameter("pcnt")==null)
				pcnt=9;
			else
				pcnt=Integer.parseInt(request.getParameter("pcnt"));
			
			//원하는 페이지의 시작 인덱스값 구하기
			if(request.getParameter("page")==null)
				page=1;
			else
				page=Integer.parseInt(request.getParameter("page"));
			
			start=(page-1)*pcnt;
			
			//페이지 이동 범위
			//startpage(시작 페이지),endpage (끝페이지)
			
			int startpage,endpage;
			
			startpage=page/10;
			if(page%10 == 0)
				startpage--;
			
			startpage=startpage*10+1;
			endpage=startpage+9;
			
			int chongpage=mapper.bestlist_getchong(pcnt);
			
			if(chongpage < endpage)
				endpage=chongpage;
			
			ArrayList<ProbestVO> plist = mapper.pro_bestlist(start,pcnt);
			model.addAttribute("plist", plist);
			model.addAttribute("page", page); //현재페이지
			model.addAttribute("startpage", startpage); //시작페이지
			model.addAttribute("endpage", endpage); //끝페이지
			model.addAttribute("pcnt", pcnt); //페이지당 레코드 갯수
			model.addAttribute("chongpage", chongpage); //총페이지수
			return "/product/pro_newlist";
		}
}
