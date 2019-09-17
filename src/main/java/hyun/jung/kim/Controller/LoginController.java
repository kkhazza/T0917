package hyun.jung.kim.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hyun.jung.kim.Beans.MemberBean;

@Controller
public class LoginController {
	
	@Autowired
	SqlSession s;
	
	// 로그인 화면
	@RequestMapping (value="/")
	public String Loginpage() {
		return "Loginpage";
	}
	
	// 로그인
	@RequestMapping (value="/login")
	public void Login(MemberBean mb, HttpServletResponse res, HttpSession hs) {
		try {
			res.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = res.getWriter();
			List<MemberBean> mbDB = s.selectList("mp.login");
			for(int i = 0; i < mbDB.size(); i++) {
				if(mb.getId().equals(mbDB.get(i).getId()) && mb.getPw().equals(mbDB.get(i).getPw())){
					hs.setAttribute("id", mbDB.get(i).getId());
					out.print("<script>location.href='/mainpage'</script>");
				} else {
					out.print("<script>alert('로그인 실패');location.href='/'</script>");
				}
			}
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	// 회원가입
	@RequestMapping (value="/register")
	public void Register(MemberBean mb, HttpServletResponse res) {
		try {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			int idcheck = s.selectOne("mp.idcheck", mb);
			if(idcheck == 0) {
				if(mb.getPw().equals(mb.getCpw())) {
					s.insert("mp.register",mb);
					out.print("<script>alert('회원가입 신청되었습니다'); location.href='/';</script>");				
				} else {
					out.print("<script>alert('비밀번호가 다르게 입력되었습니다 :('); location.href='/';</script>");
				}
			} else {
				out.print("<script>alert('ID 중복 :('); location.href='/';</script>");
			}
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 내 정보
	@RequestMapping (value="/account")
	public String Account(HttpServletRequest req, HttpSession hs) {
		List<MemberBean> mbDB = s.selectList("mp.login");
		req.setAttribute("id", hs.getAttribute("id"));
		req.setAttribute("mbDB", mbDB);
		return "Accountpage";
	}
	
	// 내 정보 수정
	@RequestMapping (value="/accountedit")
	public String Accountedit(MemberBean mb) {
		s.insert("mp.accountedit", mb);
		return "redirect:/account";
	}
}
