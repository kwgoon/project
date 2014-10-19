package model.domain;

import java.io.Serializable;

public class StudentsDTO implements Serializable {
	private String code;
	private String name;
	private String company;
	private String email;
	
	public StudentsDTO() {}
	public StudentsDTO(String code, String name, String company, String email) {
		super();
		this.code = code;
		this.name = name;
		this.company = company;
		this.email = email;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StudentsDTO [code=");
		builder.append(code);
		builder.append(", name=");
		builder.append(name);
		builder.append(", company=");
		builder.append(company);
		builder.append(", email=");
		builder.append(email);
		builder.append("]");
		return builder.toString();
	}
}