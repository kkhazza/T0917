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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hyun.jung.kim.Beans.MemberBean;

@Controller
public class LoginController {
	
	@Autowired
	SqlSession s;
	
	// 로그인 화면
	@RequestMapping (value="/loginpage")
	public String Loginpage(HttpSession hs) {
		if(hs.getAttribute("id") != null) {
			return "redirect:/";
		}
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
				if(mbDB.get(i).getId().equals(mb.getId()) && mbDB.get(i).getPw().equals(mb.getPw())){
//					hs.setMaxInactiveInterval(1800);
					hs.setAttribute("id", mbDB.get(i).getId());
					out.print("<script>location.href='/'</script>");
				} 
			}
			out.print("<script>alert('로그인 실패');location.href='/loginpage'</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 로그아웃
	@RequestMapping (value="/logout")
	public String Logout(HttpSession hs) {
		hs.invalidate();
		return "redirect:/";
	}

	// 회원가입
	@RequestMapping (value="/register")
	public void Register(MemberBean mb, HttpServletResponse res, HttpSession hs) {
		try {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			if(hs.getAttribute("id") != null) {
				out.print("<script>alert('이미 로그인 되어있습니다.');location.href='/'</script>");
			}
			int idcheck = s.selectOne("mp.idcheck", mb);
			if(idcheck == 0) {
				if(mb.getPw().equals(mb.getCpw())) {
					s.insert("mp.register",mb);
					out.print("<script>alert('회원가입 신청되었습니다'); location.href='/loginpage';</script>");				
				} else {
					out.print("<script>alert('비밀번호가 다르게 입력되었습니다 :('); location.href='/loginpage';</script>");
				}
			} else {
				out.print("<script>alert('ID 중복 :('); location.href='/loginpage';</script>");
			}
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 내 정보
	@RequestMapping (value="/account")
	public String Account(HttpServletRequest req, HttpSession hs) {
		if(hs.getAttribute("id") == null) {
			return "redirect:/";
		}
		List<MemberBean> mbDB = s.selectList("mp.login");
		req.setAttribute("id", hs.getAttribute("id"));
		req.setAttribute("mbDB", mbDB);
		return "Accountpage";
	}
	
	// 내 정보 수정 그리고 탈퇴
	@RequestMapping (value="/account/{a}")
	public void Accountedit(MemberBean mb, HttpServletResponse res, @PathVariable("a") String a) {
		try {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			if(a.equals("edit")) { // 수정
				if(mb.getPw().equals(mb.getCpw())) {
					s.insert("mp.accountedit",mb);
					out.print("<script>alert('수정되었습니다.'); location.href='/account';</script>");				
				} else {
					out.print("<script>alert('비밀번호가 다르게 입력되었습니다 :('); location.href='/account';</script>");
				}
			} else { // 탈퇴
				s.insert("mp.accountdelete",mb);
				out.print("<script>alert('탈퇴되었습니다.'); location.href='/';</script>");		
			}		
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
