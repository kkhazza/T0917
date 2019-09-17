package hyun.jung.kim.Beans;

public class MemberBean {
	
	private int no;
	private String id;
	private String pw;
	private String cpw;
	private String email;
	private String appYn;
	private String delYn;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getCpw() {
		return cpw;
	}
	public void setCpw(String cpw) {
		this.cpw = cpw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAppYn() {
		return appYn;
	}
	public void setAppYn(String appYn) {
		this.appYn = appYn;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	
	@Override
	public String toString() {
		return "MemberBean [no=" + no + ", id=" + id + ", pw=" + pw + ", cpw=" + cpw + ", email=" + email + ", appYn="
				+ appYn + ", delYn=" + delYn + "]";
	}
	
}
