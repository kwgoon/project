package model.domain;

import java.io.Serializable;

public class BoardDTO implements Serializable{
	private int no;
	private String title;
	private String contents;
	private String days;
	private String id;
	private int count;
	private int type;
	
	public BoardDTO(){}
	public BoardDTO(int no, String title, String contents, String id, int type){
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.id = id;
		this.type = type;
	}
	public BoardDTO(String title, String contents, String id, int type){
		this.title = title;
		this.contents = contents;
		this.id = id;
		this.type = type;
	}
	public BoardDTO(int no, String title, String days, String id, int count, int type){
		this.no = no;
		this.title = title;
		this.days = days;
		this.id = id;
		this.count = count;
		this.type = type;
	}
	public BoardDTO(int no, String title, String contents, String days, String id, int count, int type){
		this.no = no;
		this.title = title;
		this.contents = contents;
		this.days = days;
		this.id = id;
		this.count = count;
		this.type = type;
	}
	public int getNo(){
		return no;
	}
	public void setNo(int no){
		this.no = no;
	}
	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title = title;
	}
	public String getContents(){
		return contents;
	}
	public void setContents(String contents){
		this.contents = contents;
	}
	public String getDays(){
		return days;
	}
	public void setDays(String days){
		this.days = days;
	}
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id = id;
	}
	public int getCount(){
		return count;
	}
	public void setCount(int count){
		this.count = count;
	}
	public int getType(){
		return type;
	}
	public void setType(int type){
		this.type = type;
	}
	public String toString(){
		StringBuilder builder = new StringBuilder();
		builder.append("BoardDTO [no=");
		builder.append(no);
		builder.append(", title=");
		builder.append(title);
		builder.append(", contents=");
		builder.append(contents);
		builder.append(", days=");
		builder.append(days);
		builder.append(", id=");
		builder.append(id);
		builder.append(", count=");
		builder.append(count);
		builder.append(", type=");
		builder.append(type);
		builder.append("]");
		return builder.toString();
	}
}