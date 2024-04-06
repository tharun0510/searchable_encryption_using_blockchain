
package com.privacy.bean;

public class Register {
	
	private int id;
	private String name;
	private String email;
	private String password;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	

}


/*
package com.privacy.bean;
import java.util.Scanner;
public class Register{
	public static void main(String[] args){
		System.out.println("Enter the number : ");
		Scanner in=new Scanner(System.in);
		int n=in.nextInt();
		int temp=n;
		int f=0;
		int sum=0;
		while (temp>0)
		{
			temp=temp%10;
			System.out.println(temp);
			for (int i=1;i<=temp;i++)
			{
				f=temp*i;
				System.out.println("Factorial "+f);
			}
			sum=sum+f;
			temp=temp/10;
		}
		if (sum == n)
		{
			System.out.println(n+"is strong number");
		}else{
			System.out.println(n+"is not strong number");
		}
	}
}
*/














