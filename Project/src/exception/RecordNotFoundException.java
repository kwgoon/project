package exception;

public class RecordNotFoundException extends Exception{
	public RecordNotFoundException(){
		super("존재하지 않습니다.");
	}
	public RecordNotFoundException(String msg){
		super(msg + "는 존재하지 않습니다.");
	}
}