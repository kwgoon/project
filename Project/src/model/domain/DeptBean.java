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
		System.out.println("getNo()");
		return no;
	}
	public void setNo(int no) {
		System.out.println("setNo()");
		this.no = no;
	}
	public String getName() {
		System.out.println("getName()");
		return name;
	}
	public void setName(String name) {
		System.out.println("setName()");
		this.name = name;
	}
	public String getAddress() {
		System.out.println("getAddress()");
		return address;
	}
	public void setAddress(String address) {
		System.out.println("setAddress()");
		this.address = address;
	}
	@Override
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
