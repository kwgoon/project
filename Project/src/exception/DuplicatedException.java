package exception;

public class DuplicatedException extends Exception{
	public DuplicatedException(){
		super("�̹� �����ϴ� ������ �Դϴ�.");
	}
	public DuplicatedException(String msg){
		super(msg + "�� �̹� �����ϴ� ������ �Դϴ�.");
	}
}