package hyun.jung.kim.Controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@Autowired 
	SqlSession s;
	
	// 메인 화면
	@RequestMapping (value="/mainpage")
	public String Mainpage() {
		return "Mainpage";
	}
}
