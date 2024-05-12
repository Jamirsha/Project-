package com.nt.sbeans;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

@Component("cktr")
@PropertySource("com/nt/commons/info.properties")
public class Cricket implements ApplicationContextAware{

	@Value("${cktr.id}")
	private Integer id;

	@Value("${cktr.name}")
	private String name;

	@Value("${cktr.jersyNo}")
	private Integer jersyNo;
	
	private ApplicationContext ctx;
	
	@Override
	public void setApplicationContext(ApplicationContext ctx) throws BeansException {
		// TODO Auto-generated method stub
		System.out.println("Cricketer :: setApplicationContext(ApplicationContext ctx)");
this.ctx=ctx;
}
	
	public Cricket()
	{
		System.out.println("Cricket()-0 pram constructor ");
	}
	
	public void bowling() {
		System.out.println(name+"Cricketer is Bowling");
	}

	public void fielding() {
		System.out.println(name+"Cricketer is fielding");
	}
	public void wicketkeeping() {

		System.out.println(name+"Cricketer is wicketkeeping");
		
	}
	public void batting() {
	
		System.out.println("Cricket is batting ()");
		//since the underlying  IOC container managed ApplicationContext obj is injected 
 //		//get depenecy class obj through "Dependnecy lookup"
//		CricketBat bat=ctx.getBean("bat",CricketBat.class);
		
		CricketBat bat=ctx.getBean("bat",CricketBat.class);
		int runs=bat.ScoreRuns();
		System.out.println(name+"circketer is batting and socored runs :: "+runs);
		
	}

	
}
