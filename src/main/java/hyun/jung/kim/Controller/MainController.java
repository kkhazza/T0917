package hyun.jung.kim.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.multipart.MultipartFile;

import hyun.jung.kim.Beans.FileBean;
import hyun.jung.kim.Beans.UploadBean;

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
	
	// 글 쓰기 화면
	@RequestMapping (value="/newpage")
	public String Newpage(HttpSession hs) {
		if(hs.getAttribute("id") == null) {
			return "redirect:/";
		}
		return "Newpage";
	}
	
	// 글 쓰기 
	@RequestMapping (value="/new")
	public String New(FileBean fb, UploadBean ub, HttpServletRequest req, HttpSession hs, @RequestParam("file") MultipartFile[] files) {
		try {
			fb.setId((String)hs.getAttribute("id"));
			s.insert("mp.new", fb);
			int no = s.selectOne("mp.no",fb);
			for(int i = 0; i < files.length; i++) {
				MultipartFile file = files[i];
				String originalFileName = file.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
				String fileName = UUID.randomUUID().toString();
				byte[] data = file.getBytes();
				String path = "D:\\IDE\\workspace\\T0917\\src\\main\\resources\\file\\";
				File f = new File(path);
				if(!f.isDirectory()) {
					f.mkdirs();
				}
				OutputStream os = new FileOutputStream(new File(path + fileName + ext));
				os.write(data);
				os.close();
				ub.setFno(no);
				ub.setFn(originalFileName);
				ub.setUn(fileName+ext);
				ub.setFu(path);
				s.insert("mp.newupload", ub);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	// 자세히 보기
	@RequestMapping (value="/result/{DBno}")
	public String Resultpage(@PathVariable("DBno") int no, HttpServletRequest req, HttpSession hs) {
		req.setAttribute("id", hs.getAttribute("id"));		
		req.setAttribute("fb", s.selectList("mp.result",no));
		req.setAttribute("ub", s.selectList("mp.resultupload",no));
		return "Resultpage";
	}
	
	// 다운로드
	@RequestMapping (value="/download/{no}")
	public String Download(@PathVariable("no") int no, HttpServletResponse res) {
		List<UploadBean> ub = s.selectList("mp.download", no);
		try {
			InputStream input = new FileInputStream(ub.get(0).getFu()+ub.get(0).getUn());
			OutputStream output = res.getOutputStream();
			IOUtils.copy(input, output);			
			res.setHeader("Content-Disposition", "attachment; filename=\""+ ub.get(0).getFn() + "\"");			
			input.close();
			output.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/result";
	}
	
	// 수정 삭제 
	@RequestMapping (value="/file/{a}")
	public void File(@PathVariable("a") String a, FileBean fb, HttpServletResponse res) {
		try {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			if(a.equals("delete")) {
				s.insert("mp.delete", fb);
				out.println("<script>alert('삭제 되었습니다.');location.href='/';</script>");
			} else {
				s.insert("mp.edit",fb);
				out.println("<script>alert('수정 되었습니다.');location.href='/result/" + fb.getNo() + "';</script>");
			}
			out.flush();
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}
}
