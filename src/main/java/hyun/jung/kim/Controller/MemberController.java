package hyun.jung.kim.Controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@Autowired
	SqlSession s;
	
	@RequestMapping(value="/member")
	public String Member() {
		return "Memberpage";
	}
}
