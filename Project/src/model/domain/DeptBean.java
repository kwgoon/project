package model.domain;

public class DeptBean {
	private int no;
	private String name;
	private String address;
	
	public DeptBean() {}
	public DeptBean(int no, String name, String address) {
		this.no = no;
		this.name = name;
		this.address = address;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("DeptBean [no=");
		builder.append(no);
		builder.append(", name=");
		builder.append(name);
		builder.append(", address=");
		builder.append(address);
		builder.append("]");
		return builder.toString();
	}
}