 package com.nt.client;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.nt.sbeans.Cricket;

public class DependyLookupTest {

	
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx=new ClassPathXmlApplicationContext("com/nt/cfgs/applicationContext.xml");
		
		Cricket cktr=ctx.getBean(Cricket.class);
		cktr.bowling();
		cktr.fielding();
		cktr.batting();
		System.out.println("___________________________________");
		cktr.batting();
		ctx.close();
		
	}
}
