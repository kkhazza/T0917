package hyun.jung.kim.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import hyun.jung.kim.Beans.FileBean;

@Controller
public class MainController {

	@Autowired 
	SqlSession s;
	
	// 메인 화면
	@RequestMapping (value="/")
	public String Mainpage(HttpServletRequest req, HttpSession hs, FileBean fb) {
		req.setAttribute("id", hs.getAttribute("id"));
		req.setAttribute("fb",  s.selectList("mp.select",fb));
		return "Mainpage";
	}
	
	// 자세히 보기
	@RequestMapping (value="/result/{DBno}")
	public String Resultpage(@PathVariable("DBno") int no, FileBean fb, HttpServletRequest req) {
		req.setAttribute("fb", s.selectList("mp.result",no));
		return "Resultpage";
	}
}
