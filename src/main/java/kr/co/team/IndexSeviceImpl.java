package kr.co.team;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.team.vo.ProductVO;

@Service
@Qualifier("mss")
public class IndexSeviceImpl implements IndexService{

	@Autowired()
	private IndexMapper mapper;

	@Override
	public String index(HttpServletRequest request, Model model, ProductVO pvo) {
		
		//신상품
		String pcode=request.getParameter("pcode");
		ArrayList<ProductVO> list=mapper.index();
		model.addAttribute("list",list);
		
		//best상품
		ArrayList<ProductVO> list2=mapper.index2();
		model.addAttribute("list2",list2);
		
		return "/main/index";
	}
	
}
