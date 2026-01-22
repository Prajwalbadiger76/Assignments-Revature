class Parent1 {
	void m1() {
		System.out.println("parent class method");
	}
}

class Child1 extends Parent1 {
	void m1() {
		System.out.println("child class method m1");
	}

	void m2() {
		this.m1();
		System.out.println("child class method m2");
		super.m1();
	}

}

public class SuperKeywordDemo {
	public static void main(String[] arhs) {
		Child1 c = new Child1();
		Parent1 p = new Parent1();
		p.m1();
		System.out.println("---------------");
		Parent1 pc = new Child1();
		pc.m1();
		System.out.println("---------------");
		c.m1();
		System.out.println("---------------");

		c.m2();
	}
}