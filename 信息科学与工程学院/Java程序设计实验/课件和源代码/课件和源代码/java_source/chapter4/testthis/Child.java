class  Parent{	
	public void pr1(){		
		System.out.println(this);	 
	} 
}
public class Child extends Parent{
	public void pr2(){		
		System.out.println(this);	 
		//System.out.println(super);//�﷨���� super���Ƕ���
	}
	public static void main(String[] args) 	{
		 Child c1=new Child();
		 c1.pr1();// ��ӡ���ΪChild@1x095da
		 c1.pr2();// ��ӡ���ΪChild@1x095da:��pr1��ӡ������һ��
	}
}
