package exception;

public class RecordNotFoundException extends Exception{
	public RecordNotFoundException(){
		super("�������� �ʽ��ϴ�.");
	}
	public RecordNotFoundException(String msg){
		super(msg + "�� �������� �ʽ��ϴ�.");
	}
}