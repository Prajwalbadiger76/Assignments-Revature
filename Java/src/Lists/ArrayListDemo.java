package Lists;

import java.util.*;

public class ArrayListDemo {
public static void main(String[] args) {
	
	ArrayList<String> list = new ArrayList<>();
    list.add("Java");
    list.add("Python");

    String[] arr = list.toArray(new String[0]);
    System.out.println(Arrays.toString(arr));
    System.out.println(list.size());
    
    System.out.println("-------------------------");
    
    ArrayList<Integer> list1 = new ArrayList<>(Arrays.asList(10,40,20));
    System.out.println(Collections.max(list1));
    
    System.out.println("-------------------------");
    
    ArrayList<Integer> list3 = new ArrayList<>();
    list3.add(5);
    list3.add(10);

    System.out.println(list3.contains(10));
    
    System.out.println("-------------------------");

	
	ArrayList al3=new ArrayList<>();
	
	
	ArrayList al2=new ArrayList<>();
	al2.add("sample");
	al2.add(67);
	System.out.println("Al2 items are"+al2);
	
	ArrayList<Integer> al=new ArrayList<Integer>();
	al.add(300);
	al.add(new Integer(200));
	
	al.add(10);
	al.add(20);
	al.add(30);
	System.out.println(al);
	
	System.out.println("Size of  al "+al.size());
	
	al.add(1,450);
	
	System.out.println("after al.add(1,450) ");
	System.out.println("Size of  al "+al.size());
	System.out.println(al);
	//modifying the existing element of the List by specifying its value
	al.remove (new Integer (30));
	System.out.println("after al.remove (new Integer (30))");
	System.out.println (al);
	System.out.println (al.size ());
	//removing the element of the List by specifying its index position
	al.remove (0);
	System.out.println("after al.remove (0)");
	System.out.println (al);
	
	//Displaying elements of List 1 by 1 using for loop (accessing)
	for (int i = 0; i < al.size (); i++)
	{
	System.out.println (al.get (i));
	}


	//Displaying elements of List 1 by 1 using forEach Loop (auto-unboxing)
	for (int v:al)
	{
	System.out.println (v);
	}
	
	//Searching an element
	System.out.println (al.contains (50));
	//Copying the array list into another list
	ArrayList < Integer > al1 = new ArrayList < Integer > (al);
	System.out.println (al1);

}
}