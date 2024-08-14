package model;

public class Region {
	private String si;
	private String gu;
	private String dong;
	
	public Region(String si, String gu, String dong){
		this.si = si;
		this.gu  = gu;
		this.dong = dong;
	}

	public String getSi() {
		return si;
	}

	public void setSi(String si) {
		this.si = si;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}
	
	

}
