package com.nt.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages="com.nt.dao")
@PropertySource("com/nt/commons/info.properties")
public class PersistenceConfig {

	
	@Autowired
	private Environment env;

	@Bean(name="hkds")
	public HikariDataSource createDs()
	{
		HikariDataSource hkds=new HikariDataSource();
		hkds.setDriverClassName(env.getProperty("jdbc.driver"));
		hkds.setJdbcUrl(env.getProperty("jdbc.url"));
		hkds.setUsername(env.getProperty("jdbc.username"));
		hkds.setPassword(env.getProperty("jdbc.password"));
		
		return hkds;	
	}
}
