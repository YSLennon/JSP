package model;

public class User {
	private String uid;
	private String pwd;
	private int cnt;
	private String name;
	private String phone;
	private String addr;
	private String nickName;
	private String favor;
	private String authority;
	private String cdatetime;
	private String udatetime;

	// Default constructor
	public User() {
	}

	// Constructor with all fields
	public User(String uid, String pwd, int cnt, String name, String phone, String addr, String nickName, String favor,
			String authority, String cdatetime, String udatetime) {
		this.uid = uid;
		this.pwd = pwd;
		this.cnt = cnt;
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.nickName = nickName;
		this.favor = favor;
		this.authority = authority;
		this.cdatetime = cdatetime;
		this.udatetime = udatetime;
	}
	// insertUser
	public User(String uid, String pwd, String name, String phone, String addr, String nickName, String favor) {
		this.uid = uid;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.nickName = nickName;
		this.favor = favor;
	}

	public User(String uid, int cnt, String name, String phone, String addr, String nickName, String favor,
			String cdatetime, String udatetime) {
		this.uid = uid;
		this.cnt = cnt;
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.nickName = nickName;
		this.favor = favor;
		this.cdatetime = cdatetime;
		this.udatetime = udatetime;
	}

	// Getters and Setters
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getFavor() {
		return favor;
	}

	public void setFavor(String favor) {
		this.favor = favor;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getCdatetime() {
		return cdatetime;
	}

	public void setCdatetime(String cdatetime) {
		this.cdatetime = cdatetime;
	}

	public String getUdatetime() {
		return udatetime;
	}

	public void setUdatetime(String udatetime) {
		this.udatetime = udatetime;
	}
}