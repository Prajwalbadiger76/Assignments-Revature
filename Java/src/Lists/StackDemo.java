package Lists;

import java.util.*;

public class StackDemo {

	public static void main(String[] args) {
		
		Stack<Integer> s1 = new Stack<>();
		s1.push(10);
		s1.push(20);
		s1.pop();
		System.out.println(s1.peek());

		System.out.println("-------------------------------");
		
		Stack<Integer> s2 = new Stack<>();
		s2.push(1);
		s2.push(2);
		s2.push(3);
		System.out.print(s2.pop() + " ");
		System.out.print(s2.peek());
		System.out.println();
		
		System.out.println("-------------------------------");

		
		 Stack<Double> s = new Stack<Double>();
	     s.push(10.2);
	     s.push(50.2);
	     s.push(30.2);
	     s.push(40.2);
	     s.push(70.2);
	     System.out.println(s);
	     System.out.println(s.pop());
	     System.out.println(s);
	     System.out.println(s.peek());
	     System.out.println(s);
	     s.clear();
	     System.out.println("after Clear "+s.isEmpty());
	}

}