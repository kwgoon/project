package exception;

public class DuplicatedException extends Exception{
	public DuplicatedException(){
		super("이미 존재하는 데이터 입니다.");
	}
	public DuplicatedException(String msg){
		super(msg + "는 이미 존재하는 데이터 입니다.");
	}
}