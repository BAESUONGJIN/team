package kr.co.team;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.team.vo.ProductVO;

public interface IndexService {

	public String index(HttpServletRequest request, Model model, ProductVO pvo);
}
