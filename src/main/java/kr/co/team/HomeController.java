package kr.co.team;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.team.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	@Qualifier("mss")

    private IndexService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "redirect:/main/index";
		/*return "redirect:/main/test";*/
	}
	
	@RequestMapping("main/index")
	public String index(HttpServletRequest request, Model model, ProductVO pvo)
	{
		return service.index(request,model,pvo);
	}

/*	@RequestMapping("main/test")
	public String index()
	{
		return "/main/test";
	}*/
	
}