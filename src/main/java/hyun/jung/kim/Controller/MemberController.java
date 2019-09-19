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

import hyun.jung.kim.Beans.MemberBean;

@Controller
public class MemberController {
	
	@Autowired
	SqlSession s;
	
	@RequestMapping(value="/member")
	public String Member(HttpServletRequest req,HttpSession hs) {
		if("admin".equals(hs.getAttribute("id"))) {
			req.setAttribute("mb", s.selectList("mp.member"));;
			return "Memberpage";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/admin/{a}")
	public String Admin(@PathVariable("a") String a, MemberBean mb) {
		if(a.equals("sec")) {
			s.insert("mp.accountdelete",mb);
		} else {
			s.insert("mp.approval",mb);
		}
		return "redirect:/member";
	}
}
