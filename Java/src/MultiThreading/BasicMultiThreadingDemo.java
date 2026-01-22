package MultiThreading;

class LoadMenu implements Runnable {

	public void run() {
		for (int i = 1; i <= 2; i++) {
			System.out.println(" Menu Loading ... step " + i + "| " + Thread.currentThread().getName());
		}
	}
}

class LoadOffers implements Runnable {

	public void run() {
		for (int i = 1; i <= 2; i++) {
			System.out.println("Offers Loading ... step " + i + "| " + Thread.currentThread().getName());
		}
	}
}

class LoadItems implements Runnable {

	public void run() {
		for (int i = 1; i <= 2; i++) {
			System.out.println("Items Loading ... step " + i + "| " + Thread.currentThread().getName());
		}
	}
}

class Search  implements Runnable {

	public void run() {
		
		System.out.println("Hii Please do search items!");
		try {
			Thread.sleep(2000);
		} catch(Exception e) {
			System.out.println("time out");
		}
	}
}
public class BasicMultiThreadingDemo {

	public static void main(String[] args) {
		Thread t1=new Thread(new LoadMenu(),"Menu-Thread");
		Thread t2=new Thread(new LoadOffers(),"Offers-Thread");
		Thread t3=new Thread(new LoadOffers(),"Items-Thread");
		Thread s = new Thread(new Search(), "search");
		s.start();
		try {
			s.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		t1.start();
		t2.start();
		t3.start();		
	}

}