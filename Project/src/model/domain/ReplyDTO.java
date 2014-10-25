package model.domain;

public class ReplyDTO{
	private int no;
	private int bNo;
	private String contents;
	private String days;
	private String id;
	
	public ReplyDTO(){}
	public ReplyDTO(int bNo, String contents, String id){
		this.bNo = bNo;
		this.contents = contents;
		this.id = id;
	}
	public ReplyDTO(int no, int bNo, String contents, String days, String id) {
		super();
		this.no = no;
		this.bNo = bNo;
		this.contents = contents;
		this.days = days;
		this.id = id;
	}
	public int getNo(){
		return no;
	}
	public void setNo(int no){
		this.no = no;
	}
	public int getbNo(){
		return bNo;
	}
	public void setbNo(int bNo){
		this.bNo = bNo;
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
	public String toString(){
		StringBuilder builder = new StringBuilder();
		builder.append("ReplyDTO [no=");
		builder.append(no);
		builder.append(", bNo=");
		builder.append(bNo);
		builder.append(", contents=");
		builder.append(contents);
		builder.append(", days=");
		builder.append(days);
		builder.append(", id=");
		builder.append(id);
		builder.append("]");
		return builder.toString();
	}
}